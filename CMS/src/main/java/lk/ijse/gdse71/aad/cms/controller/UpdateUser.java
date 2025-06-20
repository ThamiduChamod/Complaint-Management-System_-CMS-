package lk.ijse.gdse71.aad.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.gdse71.aad.cms.dto.ComplainDTO;
import lk.ijse.gdse71.aad.cms.model.ComplainModel;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {
    BasicDataSource basicDataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Format: 2025-06-20
        String formattedDate = today.format(formatter);
        String date =formattedDate;

        String id = req.getParameter("id");
        String complain = req.getParameter("complaint");
        System.out.println(complain);

        ComplainDTO complainDTO = new ComplainDTO();
        complainDTO.setComplain(complain);
        complainDTO.setId(id);
        complainDTO.setComplaint_date(date);


        ComplainModel complainModel = new ComplainModel();
        try {
            boolean isSave = complainModel.updateComplain(complainDTO, basicDataSource);
            if (isSave) {
                System.out.println("update success");
                resp.sendRedirect("UserPageServlet");
            }else {
                System.out.println("update fail");
                resp.sendRedirect("UserPageServlet");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
        String id = req.getParameter("id");
        ComplainModel complainModel =   new ComplainModel();
        try {
            System.out.println("delete "+id);
            boolean delete = complainModel.delete(basicDataSource, id);
            if (delete) {
                System.out.println("delete success");
                resp.sendRedirect("UserPageServlet");

            }else {
                System.out.println("delete fail");
                resp.sendRedirect("UserPageServlet");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
