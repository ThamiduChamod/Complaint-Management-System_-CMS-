package lk.ijse.gdse71.aad.cms.db;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.SQLException;

@WebListener
public class DBC implements ServletContextListener {

    BasicDataSource dataSource;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/cms");
        dataSource.setUsername("root");
        dataSource.setPassword("Thamidu1234");
        dataSource.setInitialSize(5);
        dataSource.setMaxTotal(10);

        sce.getServletContext().setAttribute("dataSource", dataSource);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

        BasicDataSource basicDataSource = (BasicDataSource) sce.getServletContext().getAttribute("dataSource");
        try {
            basicDataSource.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
