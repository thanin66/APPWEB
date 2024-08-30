package controller;

import java.sql.*;  // Import necessary classes for database operations
import model.Order; // Ensure this import matches your Order model class

public class DBConnection {

    public boolean insertNewOrder(Order order) {
        boolean result = false; 
        Connection connection = null;
        PreparedStatement preparedStatement = null; // Declare PreparedStatement outside try

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/supershop", "root", "UBU_12345678");

            String query = "INSERT INTO orders (name, processor, vga, ram, storage, price) " +
                           "VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query); // Initialize PreparedStatement

            // Set parameters for the prepared statement
            preparedStatement.setString(1, order.getName());
            preparedStatement.setString(2, order.getProcessor());
            preparedStatement.setString(3, order.getVga());
            preparedStatement.setString(4, String.join(", ", order.getRam())); // Join array to string
            preparedStatement.setString(5, String.join(", ", order.getStorage())); // Join array to string
            preparedStatement.setInt(6, order.getPrice());

            // Execute the update and set result to true if successful
            result = preparedStatement.executeUpdate() > 0; // Return true if at least one row was inserted

        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
        } finally {
            // Close resources in finally block to ensure they're closed
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close PreparedStatement: " + e.getMessage());
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close connection: " + e.getMessage());
                }
            }
        }

        return result; // Return the result of the operation
    }
}
