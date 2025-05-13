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

	public UserModelData getUserDetails(String username) {
	    UserModelData user = null;
	    try (Connection conn = DbConfig.getDbConnection();
	         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM User WHERE username = ?")) {
	        
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        
	        if (rs.next()) {
	            user = new UserModelData();
	            user.setfirstName(rs.getString("firstName"));
	            user.setlastName(rs.getString("lastName"));
	            user.setbirthDate(rs.getDate("birthDate").toLocalDate());
	            user.setphonenumber(rs.getString("phonenumber"));
	            user.setaddress(rs.getString("address"));
	            user.setusername(rs.getString("username"));
	            user.setemail(rs.getString("email"));
	            user.setimageUrl(rs.getString("imageUrl"));
	        }
	        
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return user;
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

			if (!result.next()) {
				// User not found
				return null;
			} 
			
			boolean isValidPassword = validatePassword(result, userModelData);
			if(!isValidPassword) {
				return false;
			}
			else {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}


	/**
	 * Validates the password retrieved from the database. 
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModelData userModel) throws SQLException {
		String dbUsername = result.getString("userName");
		String dbPassword = result.getString("password");
		return dbUsername.equals(userModel.getusername())
				&& Password.decrypt(dbPassword, dbUsername).equals(userModel.getpassword());
	}


}
