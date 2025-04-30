package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.silk.config.DbConfig;

@WebServlet(asyncSupported = true, urlPatterns = { "/menu" })
public class MenuController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/menu.jsp").forward(request, response);
	}

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Flavor> flavors = new ArrayList<>();
//        Connection connection = null;
//        Statement statement = null;
//        ResultSet resultSet = null;
//
//        try {
//            connection = DbConfig.getDbConnection();
//            String sql = "SELECT * FROM ice_cream"; // Assuming your table name is "ice_cream"
//            statement = connection.createStatement();
//            resultSet = statement.executeQuery(sql);
//
//            while (resultSet.next()) {
//                Flavor flavor = new Flavor();
//                flavor.setName(resultSet.getString("name"));
//                flavor.setDescription(resultSet.getString("description"));
//                flavor.setCategory(resultSet.getString("category"));
//                flavor.setImage(resultSet.getString("image_url"));
//                flavor.setPrice(resultSet.getDouble("price"));
//                flavors.add(flavor);
//            }
//
//            request.setAttribute("flavors", flavors);
//            request.getRequestDispatcher("/pages/menu.jsp").forward(request, response);
//
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace(); // Log the exception
//            request.setAttribute("errorMessage", "Error fetching data from the database.");
//            //request.getRequestDispatcher("/pages/error.jsp").forward(request, response); // Create an error page
//        } finally {
//            try {
//                if (resultSet != null) resultSet.close();
//                if (statement != null) statement.close();
//                if (connection != null) connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: Implement menu page logic here
    }

    // Simple Flavor class to hold data
    public static class Flavor {
        private String name;
        private String description;
        private String category;
        private String image;
        private double price;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
        public String getCategory() { return category; }
        public void setCategory(String category) { this.category = category; }
        public String getImage() { return image; }
        public void setImage(String image) { this.image = image; }
        public double getPrice() { return price; }
        public void setPrice(double price) { this.price = price; }
    }
}
