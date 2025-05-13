package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

import com.silk.model.UserModelData;

/**
 * Servlet implementation class AdminProfileController
 */
@WebServlet("/adminprofile")
public class AdminProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminProfileController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a dummy admin user
        UserModelData admin = new UserModelData();
        admin.setfirstName("Aarya");
        admin.setlastName("Paudel");
        admin.setusername("AaryaPaudel");
        admin.setemail("paudel7aarya@gmail.com");
        admin.setphonenumber("9803464891");
        admin.setaddress("Bhaisepati");
        admin.setbirthDate(LocalDate.of(2005, 1, 23));
        admin.setimageUrl("/resources/images/admin.JPG");

        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/WEB-INF/pages/adminprofile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // For now, just redirect back to the GET request
        doGet(request, response);
    }
}
