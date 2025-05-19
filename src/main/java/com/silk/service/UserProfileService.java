// src/main/java/com/silk/service/UserProfileService.java
package com.silk.service;

import com.silk.model.UserModelData;
import com.silk.config.DbConfig; // Assuming you have a DbConfig class
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserProfileService {

    public boolean updateUser(UserModelData user) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                System.err.println("Error: Could not connect to the database.");
                return false;
            }
            System.out.println ("hello");
            String sql = "UPDATE user SET firstName = ?, lastName = ?, birthDate = ?, phonenumber = ?, address = ?, email = ?, username = ? WHERE username = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getfirstName());
            preparedStatement.setString(2, user.getlastName());
            preparedStatement.setDate(3, java.sql.Date.valueOf(user.getbirthDate()));
            preparedStatement.setString(4, user.getphonenumber());
            preparedStatement.setString(5, user.getaddress());
            preparedStatement.setString(6, user.getemail());
            preparedStatement.setString(7, user.getusername());
//            preparedStatement.setString(8, user.getimageUrl());
            preparedStatement.setString(8, user.getusername()); // Using the original username from the session to identify

            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: firstName=" + user.getfirstName() + ", lastName=" + user.getlastName() + ", birthDate=" + user.getbirthDate() + ", phonenumber=" + user.getphonenumber() + ", address=" + user.getaddress() + ", email=" + user.getemail() + ", newUsername=" + user.getusername() + ", originalUsername=" + user.getusername());

            System.out.println("Before executeUpdate()");
            int rowsUpdated = preparedStatement.executeUpdate();
            System.out.println("After executeUpdate(), Rows updated: " + rowsUpdated);
            return rowsUpdated > 0;

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    private void closeResources(Connection conn, PreparedStatement stmt, java.sql.ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log
        }
    }
}