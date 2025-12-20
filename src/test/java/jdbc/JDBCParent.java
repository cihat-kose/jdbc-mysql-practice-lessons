package jdbc;

import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;

import java.sql.*;

public class JDBCParent {

    public static Connection connection;
    public static Statement statement;

    @BeforeClass
    public void dbConnectionOpen() {
        String hostUrl = "jdbc:mysql://localhost:3306/sakila";
        String username = "root";
        String password = ".MySQL01,";

        try {
            connection = DriverManager.getConnection(hostUrl, username, password);
            // statement= connection.createStatement();
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException exception) {
            System.out.println("exception.getMessage() = " + exception.getMessage());
        }
    }

    @AfterClass
    public void dbConnectionClose() {
        try {
            connection.close();
        } catch (SQLException exception) {
            System.out.println("exception.getMessage() = " + exception.getMessage());
        }
    }
}
