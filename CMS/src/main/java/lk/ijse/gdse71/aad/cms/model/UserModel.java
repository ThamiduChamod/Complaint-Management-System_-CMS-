package lk.ijse.gdse71.aad.cms.model;

import lk.ijse.gdse71.aad.cms.dto.UserDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
            return true;
        }else {
            return false;
        }
    }

}
