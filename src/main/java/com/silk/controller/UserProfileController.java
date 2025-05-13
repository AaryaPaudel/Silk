package com.silk.controller;

import java.io.IOException;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.RequestDispatcher;

import com.silk.model.UserModelData;
import com.silk.service.LoginService;
import com.silk.service.RegisterService;
import com.silk.util.ValidationUtil;
import com.silk.util.ImageUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/userprofile" })
@MultipartConfig
public class UserProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String username = (String) request.getSession().getAttribute("username"); // Get from session

        if (username != null) {
            LoginService loginService = new LoginService();
            UserModelData user = loginService.getUserDetails(username);
			if (user != null) {
			    request.setAttribute("user", user); // Passing user data to JSP
			    System.out.println("User fetched: " + user.getusername());
			} else {
			    request.setAttribute("error", "User not found!");
			}
        } else {
            request.setAttribute("error", "No user logged in!");
        }
        
        request.getRequestDispatcher("WEB-INF/pages/userprofile.jsp").forward(request, response);  
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserModelData user = (UserModelData) session.getAttribute("user");

        if (user != null) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String birthDateStr = request.getParameter("birthDate");
            String phonenumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String username = request.getParameter("username");

            LocalDate birthDate = null;
            if (birthDateStr != null && !birthDateStr.isEmpty()) {
                birthDate = LocalDate.parse(birthDateStr);
            }

            // Validate the extracted data
            String error = null;
            if (ValidationUtil.isNullOrEmpty(firstName)) {
                error = "First name cannot be empty.";
            } else if (ValidationUtil.isNullOrEmpty(lastName)) {
                error = "Last name cannot be empty.";
            } else if (ValidationUtil.isNullOrEmpty(birthDateStr)) {
                error = "Birth date cannot be empty.";
            } else if (birthDate == null || !ValidationUtil.isAgeAtLeast16(birthDate)) {
                error = "You must be at least 16 years old to register.";
            } else if (ValidationUtil.isNullOrEmpty(phonenumber)) {
                error = "Phone number cannot be empty.";
            } else if (!ValidationUtil.isValidPhoneNumber(phonenumber)) {
                error = "Invalid phone number. Please enter a 10-digit number starting with 98.";
            } else if (ValidationUtil.isNullOrEmpty(address)) {
                error = "Address cannot be empty.";
            } else if (ValidationUtil.isNullOrEmpty(email)) {
                error = "Email cannot be empty.";
            } else if (!ValidationUtil.isValidEmail(email)) {
                error = "Invalid email address.";
            } else if (ValidationUtil.isNullOrEmpty(username)) {
                error = "Username cannot be empty.";
            } else {
            	RegisterService registerService = new RegisterService();
            	if(registerService.isUsernameTaken(username) && !username.equals(user.getusername())) {
            		error = "Username already taken. Please choose a different username.";
            	}
            }

            if (error != null) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDateStr", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                request.setAttribute("error", error);
            }
            else {

                    user.setfirstName(firstName);
                    user.setlastName(lastName);
                    user.setbirthDate(birthDate);
                    user.setphonenumber(phonenumber);
                    user.setaddress(address);
                    user.setemail(email);
                    user.setusername(username);

                    Part imagePart = request.getPart("image");
                    if (imagePart != null && imagePart.getSize() > 0) {
                        try {
                            String fileName = ImageUtil.handleFileUpload(imagePart, request);
                            user.setimageUrl(fileName);
                        } catch (Exception e) {
                            request.setAttribute("error", "Error uploading image: " + e.getMessage());
                        }
                    }

                    session.setAttribute("user", user);
                    request.setAttribute("message", "Profile updated successfully!");
                    LoginService loginService = new LoginService();
                    UserModelData updatedUser = loginService.getUserDetails(username);
                    request.setAttribute("user", updatedUser);
                    response.sendRedirect(request.getContextPath() + "/userprofile");
                    return;
                }
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/userprofile.jsp");
    dispatcher.forward(request, response);
    }
}
