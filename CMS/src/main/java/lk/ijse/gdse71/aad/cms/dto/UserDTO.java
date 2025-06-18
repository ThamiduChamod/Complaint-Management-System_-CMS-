package lk.ijse.gdse71.aad.cms.dto;

import lombok.*;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.DatabaseMetaData;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {
    String u_id;
    String u_name;
    String u_email;
    String u_password;
    String u_jobRoll;
    BasicDataSource basicDataSource;


}
