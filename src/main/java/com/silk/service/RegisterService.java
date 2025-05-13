package com.silk.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.silk.config.DbConfig;
import com.silk.model.UserModelData;

/**
 * RegisterService handles the registration of new users.
 * It manages database interactions for user registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new user in the database.
	 *
	 * @param userModelData the user details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(UserModelData userModelData) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		String insertQuery = "INSERT INTO user (firstName, lastName, birthDate, phonenumber, address, email, username, password, imageUrl) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
			insertStmt.setString(1, userModelData.getfirstName());
			insertStmt.setString(2, userModelData.getlastName());
			insertStmt.setDate(3, Date.valueOf(userModelData.getbirthDate()));
			insertStmt.setString(4, userModelData.getphonenumber());
			insertStmt.setString(5, userModelData.getaddress());
			insertStmt.setString(6, userModelData.getemail());
			insertStmt.setString(7, userModelData.getusername());
			insertStmt.setString(8, userModelData.getpassword());
			insertStmt.setString(9, userModelData.getimageUrl());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	public Boolean isUsernameTaken(String username) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }
        PreparedStatement preparedStatement = null;
        java.sql.ResultSet resultSet = null;

        try {
            String query = "SELECT username FROM user WHERE username = ?";
            preparedStatement = dbConn.prepareStatement(query);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            return resultSet.next(); // If a row is found, the username is taken

        } catch (SQLException e) {
            e.printStackTrace();
            return null; // Indicate a database error
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (preparedStatement != null) preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
