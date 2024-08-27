<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, model.Order" %>

<%
    // Database connection variables
    String url = "jdbc:mysql://localhost:3306/supershop";
    String user = "root";
    String password = "UBU_12345678";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establish connection
        connection = DriverManager.getConnection(url, user, password);
        // Create statement
        statement = connection.createStatement();
        // Execute query to retrieve orders
        String query = "SELECT * FROM orders";
        resultSet = statement.executeQuery(query);
%>

<h2>Order List</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Processor</th>
        <th>VGA</th>
        <th>RAM</th>
        <th>Storage</th>
        <th>Price</th>
    </tr>
<%
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            String processor = resultSet.getString("processor");
            String vga = resultSet.getString("vga");
            String ram = resultSet.getString("ram");
            String storage = resultSet.getString("storage");
            int price = resultSet.getInt("price");
%>
    <tr>
        <td><%= name %></td>
        <td><%= processor %></td>
        <td><%= vga %></td>
        <td><%= ram %></td>
        <td><%= storage %></td>
        <td><%= price %></td>
    </tr>
<%
        }
%>
</table>

<%
    } catch (ClassNotFoundException e) {
        out.println("JDBC Driver not found: " + e.getMessage());
    } catch (SQLException e) {
        out.println("SQL error: " + e.getMessage());
    } finally {
        // Close resources
        if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {}
        if (statement != null) try { statement.close(); } catch (SQLException e) {}
        if (connection != null) try { connection.close(); } catch (SQLException e) {}
    }
%>

<a href="index.html">กลับไปที่หน้าแรก</a>
