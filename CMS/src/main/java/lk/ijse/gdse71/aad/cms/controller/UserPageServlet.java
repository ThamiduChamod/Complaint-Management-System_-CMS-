package lk.ijse.gdse71.aad.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
import java.util.UUID;

//@WebServlet("/UserPageServlet")
public class UserPageServlet extends HttpServlet {
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


        ComplainModel complainModel = new ComplainModel();
        try {
            System.out.println("model eka call una");
            List<ComplainDTO> resolved = complainModel.getAllComplainByStatusANDUserMail("RESOLVED",user_email, basicDataSource);
            req.setAttribute("totalResolved", resolved.size());
            req.setAttribute("resolvedList", resolved);


            List<ComplainDTO> inProgress = complainModel.getAllComplainByStatusANDUserMail("PROGRESS",user_email, basicDataSource);
            req.setAttribute("totalInProgress", inProgress.size());
            req.setAttribute("InProgress", inProgress);


            List<ComplainDTO> pending = complainModel.getAllComplainByStatusANDUserMail("PENDING",user_email, basicDataSource);
            req.setAttribute("totalPending", pending.size());
            req.setAttribute("Pending", pending);

            req.getRequestDispatcher("UserPage.jsp").forward(req, resp);
//            resp.sendRedirect("UserPage.jsp");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Format: 2025-06-20
        String formattedDate = today.format(formatter);

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }
        String user_email = (String) session.getAttribute("userEmail");


        String complain = req.getParameter("complain");

        basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");

        ComplainDTO complainDTO = new ComplainDTO(
                UUID.randomUUID().toString(),
                user_email,
                complain,
                formattedDate,
                "",
                null,
                "PENDING"

        );
        ComplainModel complainModel = new ComplainModel();
        try {
            boolean isSave = complainModel.addComplain(complainDTO, basicDataSource);
            if (isSave) {
                System.out.println("save una");
                resp.sendRedirect("UserPageServlet");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
