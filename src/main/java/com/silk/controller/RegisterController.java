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
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String birthDate = request.getParameter("birthDate");
//        String phonenumber = request.getParameter("phonenumber");
//        String address = request.getParameter("address");
//        String email = request.getParameter("email");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String imageUrl = request.getParameter("imageUrl");
//
//        System.out.println(birthDate);
//        System.out.println(firstName);
//        System.out.println(username);
//
//        UserModelData user = extractUserModelData(request);
//        user.setfirstName(firstName);
//        user.setlastName(lastName);
//        user.setbirthDate(LocalDate.parse(birthDate));
//        user.setphonenumber(phonenumber);
//        user.setaddress(address);
//        user.setemail(email);
//        user.setusername(username);
//        user.setpassword(password);
//        user.setimageUrl(imageUrl);
//
//        RegisterService registerService = new RegisterService();
//        Boolean registered = registerService.addUser(user);
//
//
//        if (registered != null && registered) {
//            response.sendRedirect(request.getContextPath() + "/login");
//        } else {
//            // Handle registration failure
//            response.getWriter().println("Registration failed. Please try again.");
//        }
    	
    	try {
			UserModelData userModel = extractUserModelData(request);
			Boolean isAdded = registerService.addUser(userModel);

			if (isAdded == null){
				handleError(request, response, "Our server is under maintenance. Please try again later!");

			} else if(!isAdded){
				handleError(request, response, "Could not register your account. Please try again later!");
			}else {
			//Upon successful registration
			response.sendRedirect(request.getContextPath() + "/login");
			}
		} catch (Exception e) {
			handleError(request, response, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
    }
    
    private UserModelData extractUserModelData(HttpServletRequest req) throws Exception {
    	int user_id = Integer.parseInt(req.getParameter("user_id"));
		String firstName = req.getParameter("user_id");
		String lastName = req.getParameter("lastName");
		LocalDate birthDate = LocalDate.parse(req.getParameter("birthDate"));
		String phonenumber = req.getParameter("phonenumber");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String username = req.getParameter("username");
		//String role = "user";

		String password = req.getParameter("password");
		

		
		password = Password.encrypt(username, password);
		
		Part image = req.getPart("image");
		String imageUrl = imageUtil.getImageNameFromPart(image);
		
		return new UserModelData( user_id,  firstName,  lastName,  birthDate,  phonenumber,
				 address,  email,  username,  password, imageUrl);	
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
