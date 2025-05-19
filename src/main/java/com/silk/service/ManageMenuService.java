package com.silk.service;

import com.silk.model.IceCreamModel;
import com.silk.config.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ManageMenuService {

    // Default constructor
    public ManageMenuService() {
    }

    public List<IceCreamModel> getAllIceCreams() {
        List<IceCreamModel> iceCreamList = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                // Consider logging this error
                return new ArrayList<>(); // Return empty list, not null
            }
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM IceCream");

            while (resultSet.next()) {
                IceCreamModel iceCream = new IceCreamModel();
                iceCream.seticecream_Id(resultSet.getInt("icecream_Id"));
                iceCream.seticeCream_Name(resultSet.getString("iceCream_Name"));
                iceCream.seticeCream_Price(resultSet.getFloat("iceCream_Price"));
                iceCream.seticeCream_Type(resultSet.getString("iceCream_Type"));
                iceCream.seticeCream_Desc(resultSet.getString("iceCream_Desc"));
                iceCream.seticeCream_Availability(resultSet.getString("iceCream_Availability"));
                iceCreamList.add(iceCream);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception
            // Consider throwing a custom exception or logging
        } finally {
            closeResources(connection, statement, resultSet);
        }
        return iceCreamList;
    }
    
    public List<IceCreamModel> searchIceCreams(String searchTerm) {
        List<IceCreamModel> iceCreamList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                return new ArrayList<>();
            }
            String sql = "SELECT * FROM IceCream WHERE iceCream_Name LIKE ? OR iceCream_Desc LIKE ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + searchTerm + "%");
            preparedStatement.setString(2, "%" + searchTerm + "%");
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                IceCreamModel iceCream = new IceCreamModel();
                iceCream.seticecream_Id(resultSet.getInt("icecream_Id"));
                iceCream.seticeCream_Name(resultSet.getString("iceCream_Name"));
                iceCream.seticeCream_Price(resultSet.getFloat("iceCream_Price"));
                iceCream.seticeCream_Type(resultSet.getString("iceCream_Type"));
                iceCream.seticeCream_Desc(resultSet.getString("iceCream_Desc"));
                iceCream.seticeCream_Availability(resultSet.getString("iceCream_Availability"));
                iceCreamList.add(iceCream);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }
        return iceCreamList;
    }

    public boolean createIceCream(IceCreamModel iceCream) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                return false;
            }
            String sql = "INSERT INTO IceCream (iceCream_Name, iceCream_Price, iceCream_Type, iceCream_Desc, iceCream_Availability) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Get generated ID
            preparedStatement.setString(1, iceCream.geticeCream_Name());
            preparedStatement.setDouble(2, iceCream.geticeCream_Price());
            preparedStatement.setString(3, iceCream.geticeCream_Type());
            preparedStatement.setString(4, iceCream.geticeCream_Desc());
            preparedStatement.setString(5, iceCream.geticeCream_Availability());
            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                return false; // Indicate failure
            }

            // Get the generated ID
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    iceCream.seticecream_Id(generatedKeys.getInt(1)); // Set the ID in the model
                } else {
                    //  Consider logging that no ID was obtained
                }
            }
            return true;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception
            return false;
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    public boolean updateIceCream(IceCreamModel iceCream) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                return false;
            }
            String sql = "UPDATE IceCream SET iceCream_Name = ?, iceCream_Price = ?, iceCream_Type = ?, iceCream_Desc = ?, iceCream_Availability = ? WHERE icecream_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, iceCream.geticeCream_Name());
            preparedStatement.setDouble(2, iceCream.geticeCream_Price());
            preparedStatement.setString(3, iceCream.geticeCream_Type());
            preparedStatement.setString(4, iceCream.geticeCream_Desc());
            preparedStatement.setString(5, iceCream.geticeCream_Availability());
            preparedStatement.setInt(6, iceCream.geticecream_Id());
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0; // Indicate success if at least one row was updated
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception
            return false;
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }

    public boolean deleteIceCream(int iceCreamId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                return false;
            }
            String sql = "DELETE FROM IceCream WHERE icecream_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, iceCreamId);
            int affectedRows = preparedStatement.executeUpdate();
            return affectedRows > 0; // success if deleted >=1 row
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources(connection, preparedStatement, null);
        }
    }
    
    public IceCreamModel getIceCreamById(int iceCreamId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        IceCreamModel iceCream = null;
        try {
            connection = DbConfig.getDbConnection();
            if (connection == null) {
                return null;
            }
            String sql = "SELECT * FROM IceCream WHERE icecream_Id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, iceCreamId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                iceCream = new IceCreamModel();
                iceCream.seticecream_Id(resultSet.getInt("icecream_Id"));
                iceCream.seticeCream_Name(resultSet.getString("iceCream_Name"));
                iceCream.seticeCream_Price(resultSet.getFloat("iceCream_Price"));
                iceCream.seticeCream_Type(resultSet.getString("iceCream_Type"));
                iceCream.seticeCream_Desc(resultSet.getString("iceCream_Desc"));
                iceCream.seticeCream_Availability(resultSet.getString("iceCream_Availability"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception
        } finally {
            closeResources(connection, preparedStatement, resultSet);
        }
        return iceCream;
    }


    private void closeResources(Connection conn, Statement stmt, ResultSet rs) {
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