package com.medikhoj.util;

import java.io.File;
import java.io.IOException;

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
		return uniqueImageName(imageName);
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
	public String uploadImage(Part part, String rootPath, String saveFolder) {
		String savePath = rootPath+File.separator+saveFolder;
		System.out.println(savePath);
		File fileSaveDir = new File(savePath);

		// Ensure the directory exists
		if (!fileSaveDir.exists()) {
			if (!fileSaveDir.mkdir()) {
				return null; // Failed to create the directory
			}
		}
		try {
			// Get the image name
			String imageName = getImageNameFromPart(part);
			// Create the file path
			String filePath = savePath + File.separator + imageName;
			// Write the file to the server
			part.write(filePath);
			return imageName; // Upload successful
		} catch (IOException e) {
			e.printStackTrace(); // Log the exception
			return null; // Upload failed
		}
	}
	
	public String uniqueImageName(String originalName) {
        String extension = originalName.substring(originalName.lastIndexOf("."));
        String uniqueName = System.currentTimeMillis() + "_" + java.util.UUID.randomUUID() + extension;
		return uniqueName;
	}
	
}