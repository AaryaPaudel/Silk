package com.silk.util;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

/**
 * Utility class for handling image file uploads.
 * <p>
 * This class provides methods for extracting the file name from a {@link Part}
 * object and uploading the image file to a specified directory on the server.
 * </p>
 */
public class ImageUtil {

	/**
	 * Extracts the file name from the given {@link Part} object based on the
	 * "content-disposition" header.
	 * 
	 * <p>
	 * This method parses the "content-disposition" header to retrieve the file name
	 * of the uploaded image. If the file name cannot be determined, a default name
	 * "download.png" is returned.
	 * </p>
	 * 
	 * @param part the {@link Part} object representing the uploaded file.
	 * @return the extracted file name. If no filename is found, returns a default
	 *         name "download.png".
	 */
	public String getImageNameFromPart(Part part) {
		// Retrieve the content-disposition header from the part
		String contentDisp = part.getHeader("content-disposition");

		// Split the header by semicolons to isolate key-value pairs
		String[] items = contentDisp.split(";");

		// Initialize imageName variable to store the extracted file name
		String imageName = null;

		// Iterate through the items to find the filename
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// Extract the file name from the header value
				imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}

		// Check if the filename was not found or is empty
		if (imageName == null || imageName.isEmpty()) {
			// Assign a default file name if none was provided
			imageName = "download.png";
		}

		// Return the extracted or default file name
		return imageName;
	}

	/**
	 * Uploads the image file from the given {@link Part} object to a specified
	 * directory on the server.
	 * 
	 * <p>
	 * This method ensures that the directory where the file will be saved exists
	 * and creates it if necessary. It writes the uploaded file to the server's file
	 * system. Returns {@code true} if the upload is successful, and {@code false}
	 * otherwise.
	 * </p>
	 * 
	 * @param part the {@link Part} object representing the uploaded image file.
	 * @return {@code true} if the file was successfully uploaded, {@code false}
	 *         otherwise.
	 */
	public boolean uploadImage(Part part, String fullSavePath) {
	    File fileSaveDir = new File(fullSavePath);

	    // Debug and ensure the directory exists
	    if (!fileSaveDir.exists()) {
	        System.out.println("Directory does not exist. Trying to create: " + fullSavePath);
	        if (!fileSaveDir.mkdirs()) {
	            System.out.println("Failed to create directory: " + fullSavePath);
	            return false;
	        } else {
	            System.out.println("Directory created: " + fullSavePath);
	        }
	    } else {
	        System.out.println("Directory already exists: " + fullSavePath);
	    }

	    try {
	        String imageName = getImageNameFromPart(part);
	        String filePath = fullSavePath + File.separator + imageName;
	        System.out.println("Uploading to: " + filePath);
	        part.write(filePath);
	        return true;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	
	public String getSavePath(String saveFolder) {
		return "C:/Users/Aarya/eclipse-workspace/silk/src/main/webapp/resources/images/"+saveFolder+"/";
	}

    public static String handleFileUpload(Part imagePart, HttpServletRequest request) throws IOException, ServletException {
        String fileName = imagePart.getSubmittedFileName();
        String uploadDir = request.getServletContext().getRealPath("/resources/images");
        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) {
            uploadPath.mkdirs();
        }
        String filePath = uploadDir + File.separator + fileName;
        imagePart.write(filePath);
        return fileName;
    }
}
