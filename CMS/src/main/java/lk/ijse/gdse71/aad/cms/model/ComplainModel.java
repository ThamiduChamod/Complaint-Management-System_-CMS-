package lk.ijse.gdse71.aad.cms.model;

import lk.ijse.gdse71.aad.cms.dto.ComplainDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplainModel {

    public List<ComplainDTO> getAll (BasicDataSource basicDataSource) throws SQLException {
        Connection connection = basicDataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("select * from complaints");
        ResultSet resultSet = preparedStatement.executeQuery();
        List<ComplainDTO> complainDTOList = new ArrayList<>();
        while (resultSet.next()) {
            ComplainDTO complainDTO = new ComplainDTO(
                    resultSet.getString(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),
                    resultSet.getString(6),
                    resultSet.getString(7)
            );
            complainDTOList.add(complainDTO);
        }
        connection.close();
        return complainDTOList;

    }

    public List<ComplainDTO> getAllComplainByStatus(String status, BasicDataSource basicDataSource) throws SQLException {
        System.out.println("Model ekata awa");
        Connection connection = basicDataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from complaints where status=?");
        preparedStatement.setString(1, status);
        ResultSet resultSet = preparedStatement.executeQuery();

        List<ComplainDTO> complainDTOList = new ArrayList<>();
        while (resultSet.next()) {
            ComplainDTO complainDTO = new ComplainDTO(
                    resultSet.getString(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),
                    resultSet.getString(6),
                    resultSet.getString(7)
            );
            complainDTOList.add(complainDTO);
        }
        connection.close();
        return complainDTOList;

    }


    public List<ComplainDTO> getAllComplainByStatusANDUserMail(String status, String u_email, BasicDataSource basicDataSource) throws SQLException {
        System.out.println("Model ekata awa");
        Connection connection = basicDataSource.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement("select * from complaints where status=? and u_email=?");
        preparedStatement.setString(1, status);
        preparedStatement.setString(2, u_email);
        ResultSet resultSet = preparedStatement.executeQuery();

        List<ComplainDTO> complainDTOList = new ArrayList<>();
        while (resultSet.next()) {
            ComplainDTO complainDTO = new ComplainDTO(
                    resultSet.getString(1),
                    resultSet.getString(2),
                    resultSet.getString(3),
                    resultSet.getString(4),
                    resultSet.getString(5),
                    resultSet.getString(6),
                    resultSet.getString(7)
            );
            complainDTOList.add(complainDTO);
        }
        connection.close();
        return complainDTOList;
    }

    public boolean addComplain (ComplainDTO complainDTO, BasicDataSource basicDataSource) throws SQLException {
        Connection connection = basicDataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("insert into complaints values(?,?,?,?,?,?,?);");
        preparedStatement.setString(1, complainDTO.getId());
        preparedStatement.setString(2, complainDTO.getU_email());
        preparedStatement.setString(3, complainDTO.getComplain());
        preparedStatement.setString(4, complainDTO.getComplaint_date());
        preparedStatement.setString(5, complainDTO.getAnswer());
        preparedStatement.setString(6, complainDTO.getAnswer_date());
        preparedStatement.setString(7, complainDTO.getStatus());
        int result = preparedStatement.executeUpdate();

        if (result > 0) {
            connection.close();
            return true;
        }else {
            connection.close();
            return false;
        }
    }

    public  boolean updateAnswer(ComplainDTO complainDTO, BasicDataSource basicDataSource) throws SQLException {
        Connection connection = basicDataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE complaints SET answer = ?, answer_date = ? , status = ? WHERE id = ?");
        preparedStatement.setString(1, complainDTO.getAnswer());
        preparedStatement.setString(2, complainDTO.getAnswer_date());
        preparedStatement.setString(3, complainDTO.getStatus());
        preparedStatement.setString(4, complainDTO.getId());
        int result = preparedStatement.executeUpdate();
        if (result > 0) {
            connection.close();
            return true;
        }
        connection.close();
        return false;
    }

    public  boolean updateComplain (ComplainDTO complainDTO, BasicDataSource basicDataSource) throws SQLException {
        Connection connection = basicDataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE complaints SET complain = ?, complaint_date = ? WHERE id = ?");
        preparedStatement.setString(1, complainDTO.getComplain());
        preparedStatement.setString(2, complainDTO.getComplaint_date());
        preparedStatement.setString(3, complainDTO.getId());
        int result = preparedStatement.executeUpdate();
        if (result > 0) {
            connection.close();
            return true;
        }
        connection.close();
        return false;
    }


    public boolean delete (BasicDataSource basicDataSource, String id ) throws SQLException {
        Connection connection = basicDataSource.getConnection();

        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM complaints WHERE id = ?");
        preparedStatement.setString(1,id);
        int result = preparedStatement.executeUpdate();
        if (result > 0) {
            connection.close();
            return true;
        }
        connection.close();
        return false;

    }

}
