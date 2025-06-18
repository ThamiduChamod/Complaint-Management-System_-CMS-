package lk.ijse.gdse71.aad.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.gdse71.aad.cms.dto.UserDTO;
import lk.ijse.gdse71.aad.cms.model.UserModel;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    BasicDataSource basicDataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource");
            System.out.println(req.getParameter("roll"));
            UserDTO userDTO = new UserDTO(
                    UUID.randomUUID().toString(),
                    req.getParameter("cName"),
                    req.getParameter("cEmail"),
                    req.getParameter("cPassword"),
                    req.getParameter("roll"),
                    basicDataSource
            );

            UserModel userModel = new UserModel();
            boolean isSave = userModel.saveUser(userDTO);
            if (isSave){
                System.out.println("User Saved");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDTO userDTO = new UserDTO();
        userDTO.setU_email( req.getParameter("email"));
        userDTO.setU_password( req.getParameter("password"));
        userDTO.setBasicDataSource(basicDataSource = (BasicDataSource) getServletContext().getAttribute("dataSource"));


        try {
            UserModel userModel = new UserModel();
            String jobRoll = userModel.findUser(userDTO);

            if (!jobRoll.equals("Cannot find user")) {
                if (jobRoll.equals("Admin")) {
                    System.out.println("admin");
                    req.getRequestDispatcher("/AdminPage.jsp").forward(req, resp);
                } else {
                    System.out.println("user");
                    req.getRequestDispatcher("/UserPage.jsp").forward(req, resp);
                }
            }else {
                System.out.println("Wrong email or password");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
