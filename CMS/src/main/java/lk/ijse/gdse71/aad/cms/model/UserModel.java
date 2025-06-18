package lk.ijse.gdse71.aad.cms.model;

import lk.ijse.gdse71.aad.cms.dto.UserDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserModel {
    public boolean saveUser(UserDTO user) throws SQLException {

        Connection connection =user.getBasicDataSource().getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("insert into user values (?,?,?,?,?);");
        preparedStatement.setString(1, user.getU_id());
        preparedStatement.setString(2, user.getU_name());
        preparedStatement.setString(3, user.getU_email());
        preparedStatement.setString(4, user.getU_password());
        preparedStatement.setString(5, user.getU_jobRoll());

        int isSave = preparedStatement.executeUpdate();

        if (isSave > 0) {
            connection.close();
            return true;
        }else {
            connection.close();
            return false;
        }
    }

    public String findUser(UserDTO user) throws SQLException {
        Connection connection =user.getBasicDataSource().getConnection();

        PreparedStatement pst = connection.prepareStatement("select u_jobRoll from user where u_email=? and u_password=?");
        pst.setString(1, user.getU_email());
        pst.setString(2, user.getU_password());
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            return rs.getString("u_jobRoll");
        }
        return "Cannot find user";

    }

}
