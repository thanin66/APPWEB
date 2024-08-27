package controller;

import java.sql.*;  // Import necessary classes for database operations
import model.Order; // Ensure this import matches your Order model class

public class DBConnection {

    public boolean insertNewOrder(Order order) {
        boolean result = false;
        Connection connection = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/supershop", "root", "UBU_12345678");

            String query = "INSERT INTO orders (name, processor, vga, ram, storage, price) " +
                           "VALUES (?, ?, ?, ?, ?, ?)";

            // Use PreparedStatement to avoid SQL injection
            try (PreparedStatement pstmt = connection.prepareStatement(query)) {
                pstmt.setString(1, order.getName());
                pstmt.setString(2, order.getProcessor());
                pstmt.setString(3, order.getVga()); // Corrected getter method
                pstmt.setString(4, String.join(",", order.getRam())); // Corrected getter method and join RAM array
                pstmt.setString(5, String.join(",", order.getStorage())); // Join Storage array
                pstmt.setInt(6, order.getPrice());

                int i = pstmt.executeUpdate(); // Execute the update
                result = i > 0; // Check if rows were affected
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
        } finally {
            // Close connection in finally block to ensure it's closed
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close connection: " + e.getMessage());
                }
            }
        }

        return result;
    }
}
