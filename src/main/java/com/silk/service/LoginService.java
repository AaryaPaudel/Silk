package com.silk.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.silk.util.Password;
import com.silk.config.DbConfig;
import com.silk.model.UserModelData;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param userModel the UserModelData object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public Boolean loginUser(UserModelData userModelData) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT username, password FROM user WHERE username = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, userModelData.getusername());  
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				// Get the encrypted password from the database
				String dbEncryptedPassword = result.getString("password");

				// Decrypt the password from the database using the Password utility
				String decryptedPassword = Password.decrypt(dbEncryptedPassword, userModelData.getusername());

				// Check if the decrypted password matches the user input password
				if (decryptedPassword != null && decryptedPassword.equals(userModelData.getpassword())) {
					// Password matches, login successful
					return true;
				} else {
					// Password mismatch
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		// User not found
		return false;
	}

}
