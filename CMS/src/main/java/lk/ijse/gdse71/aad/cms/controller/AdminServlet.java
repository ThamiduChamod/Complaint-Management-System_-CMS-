package lk.ijse.gdse71.aad.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.gdse71.aad.cms.dto.ComplainDTO;
import lk.ijse.gdse71.aad.cms.model.ComplainModel;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class AdminServlet extends HttpServlet {
    BasicDataSource basicDataSource;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            resp.sendRedirect("index.jsp"); // not logged in
            return;
        }
        String user_email = (String) session.getAttribute("userEmail");
        System.out.println(user_email);

        ComplainModel complainModel = new ComplainModel();
        try {
            List<ComplainDTO> getAll = complainModel.getAll(basicDataSource);
            req.setAttribute("AllComplain", getAll);

            List<ComplainDTO> resolved = complainModel.getAllComplainByStatus("RESOLVED", basicDataSource);
            req.setAttribute("totalResolved", resolved.size());
            req.setAttribute("resolvedList", resolved);


            List<ComplainDTO> inProgress = complainModel.getAllComplainByStatus("PROGRESS", basicDataSource);
            req.setAttribute("totalInProgress", inProgress.size());
            req.setAttribute("InProgress", inProgress);


            List<ComplainDTO> pending = complainModel.getAllComplainByStatus("PENDING", basicDataSource);
            req.setAttribute("totalPending", pending.size());
            req.setAttribute("Pending", pending);

            req.getRequestDispatcher("AdminPage.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Format: 2025-06-20
        String formattedDate = today.format(formatter);


        String id = req.getParameter("id");
        String user_email = req.getParameter("email");
        String complain = req.getParameter("complain");
        String complaint_date = req.getParameter("complaint_date");
        String answer = req.getParameter("answer");
       String date = formattedDate;
        String status = req.getParameter("status");

        ComplainDTO complainDTO = new ComplainDTO(
                id,
                user_email,
                complain,
                complaint_date,
                answer,
                date,
                status
        );

        ComplainModel cm = new ComplainModel();
        try {
            boolean isSave = cm.updateAnswer(complainDTO, basicDataSource);
            if (isSave) {
                System.out.println("save una");
                resp.sendRedirect("AdminServlet");

            }else {
                System.out.println("na");
                resp.sendRedirect("AdminServlet");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
