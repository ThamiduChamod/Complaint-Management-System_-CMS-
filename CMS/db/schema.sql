create database cms;
use cms;
create table user(
                     u_id varchar(255) primary key ,
                     u_name varchar(255),
                     u_email varchar(255),
                     u_password varchar(255),
                     u_jobRoll varchar(255)
);

CREATE TABLE complaints (
                            id VARCHAR(255) PRIMARY KEY,
                            u_email VARCHAR(255),
                            complain TEXT,
                            complaint_date DATE,
                            answer TEXT,
                            answer_date DATE,
                            status VARCHAR(50)
);
