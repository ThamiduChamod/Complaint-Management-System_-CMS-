package lk.ijse.gdse71.aad.cms.dto;

import lombok.*;
import org.apache.commons.dbcp2.BasicDataSource;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ComplainDTO {
    String id;
    String u_email;
    String complain;
    String complaint_date;
    String answer;
    String answer_date;
    String status;
}
