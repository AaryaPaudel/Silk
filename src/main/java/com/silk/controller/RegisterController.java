package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;

import com.silk.model.UserModelData;
import com.silk.service.RegisterService;
import com.silk.util.ImageUtil;
import com.silk.util.Password;
import com.silk.util.ValidationUtil;

@WebServlet("/register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,    // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ImageUtil imageUtil = new ImageUtil();
    private final RegisterService registerService = new RegisterService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Extract user data from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String birthDateStr = request.getParameter("birthDate");
            String phonenumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
			Part image = request.getPart("image");
			

            // Validate the extracted data
            if (ValidationUtil.isNullOrEmpty(firstName)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "First name cannot be empty.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(lastName)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Last name cannot be empty.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(birthDateStr)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Birth date cannot be empty.");
                return;
            }
            LocalDate birthDate = LocalDate.parse(birthDateStr);
            if (!ValidationUtil.isAgeAtLeast16(birthDate)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "You must be at least 16 years old to register.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(phonenumber)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Phone number cannot be empty.");
                return;
            }
            if (!ValidationUtil.isValidPhoneNumber(phonenumber)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Invalid phone number. Please enter a 10-digit number starting with 98.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(address)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Address cannot be empty.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(email)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Email cannot be empty.");
                return;
            }
            if (!ValidationUtil.isValidEmail(email)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Invalid email address.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(username)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Username cannot be empty.");
                return;
            }
            if (ValidationUtil.isNullOrEmpty(password)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Password cannot be empty.");
                return;
            }
            if (!ValidationUtil.isValidPassword(password)) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Password must contain at least 8 characters, 1 capital letter, 1 number, and 1 symbol.");
                return;
            }

            Boolean isUsernameTaken = registerService.isUsernameTaken(username);
            if (isUsernameTaken == null) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Our server is under maintenance. Please try again later!");
                return;
            }
            if (isUsernameTaken) {
                request.setAttribute("firstName", firstName);
                request.setAttribute("lastName", lastName);
                request.setAttribute("birthDate", birthDateStr);
                request.setAttribute("phonenumber", phonenumber);
                request.setAttribute("address", address);
                request.setAttribute("email", email);
                request.setAttribute("username", username);
                handleError(request, response, "Username already taken. Please choose a different username.");
                return;
            }

            String imageUrl = imageUtil.getImageNameFromPart(image);

            password = Password.encrypt(username, password);

            // Create a UserModelData object
            UserModelData userModel = new UserModelData(
                    firstName, lastName, birthDate, phonenumber,
                    address, email, username, password, imageUrl
            );

            // Add the user to the database
            Boolean isAdded = registerService.addUser(userModel);

            if (isAdded == null) {
                handleError(request, response, "Our server is under maintenance. Please try again later!");
            } else if (!isAdded) {
                handleError(request, response, "Could not register your account. Please try again later!");
            } else {
                // Upon successful registration
            	response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
        } catch (Exception e) {
            handleError(request, response, "An unexpected error occurred. Please try again later!");
            e.printStackTrace(); // Log the exception
        }
    }

	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("image");
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");
	}
	
    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(redirectPage).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
    }
}
