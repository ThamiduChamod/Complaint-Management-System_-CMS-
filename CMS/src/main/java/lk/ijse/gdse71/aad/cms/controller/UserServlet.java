package lk.ijse.gdse71.aad.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    BasicDataSource basicDataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("cName");
        String email = req.getParameter("cEmail");
        String password = req.getParameter("cPassword");

        try {
            basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
            Connection connection = basicDataSource.getConnection();
            System.out.println("connection = "+connection);



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        System.out.println(name + " " + email + " " + password);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println(email + " " + password);
    }
}
