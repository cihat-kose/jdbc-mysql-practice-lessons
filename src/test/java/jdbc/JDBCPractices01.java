package jdbc;

import org.testng.annotations.Test;

import java.sql.*;

public class JDBCPractices01 {

    @Test
    public void test1() throws SQLException {

        // What is done to make a query work
        String hostUrl = "jdbc:mysql://demo.mersys.io:33906/sakila";
        String username = "admin";
        String password = "Techno24Study.%=";

        // 1)- We entered the connection information --> Connection information was set.
        Connection connection = DriverManager.getConnection(hostUrl, username, password);

        // 2)- We have chose the database -->
        // This information was added to hostUrl (/sakila); no other additional action was taken
        // String hostUrl = "jdbc:mysql://demo.mersys.io:33906/sakila";

        // 3)- We opened the query screen
        Statement statement = connection.createStatement();

        // 4)- We wrote the query to query screen then I was run
        ResultSet resultTable = statement.executeQuery("select * from actor");

        // 5)- The results appeared below
        resultTable.next(); // At this stage we have completed the first line

        String name = resultTable.getString("first_name");
        String lastName = resultTable.getString("last_name");
        System.out.println("name = " + name);
        System.out.println("lastName = " + lastName);

        resultTable.next();

        name = resultTable.getString("first_name");
        lastName = resultTable.getString("last_name");
        System.out.println("name = " + name);
        System.out.println("lastName = " + lastName);

        connection.close();
    }
}
