package com.medikhoj.util;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

import jakarta.servlet.http.Part;

public class ValidationUtil {
	
	
	private static final List<String> ALLOWED_TYPES = Arrays.asList(
		    "image/jpeg",
		    "image/png",
		    "image/jpg"
		);


    // Validate if a field is null or empty
    public static boolean isNullOrEmpty(String value) {
        return value==null || value.trim().isEmpty();
    }

    // Validate if a string contains only letters
    public static boolean isAlphabetic(String value) {
        return value != null && value.matches("^[a-zA-Z]+$");
    }

    // Validate if a string starts with a letter and is composed of letters and numbers
    public static boolean isAlphanumericStartingWithLetter(String value) {
        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
    }


    // Validate if a string is a valid email address
    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    // Validate if a number is of 10 digits and starts with 98
    public static boolean isValidPhoneNumber(String number) {
        return number != null && number.matches("^98\\d{8}$");
    }

    //  Validate if a password is composed of at least 1 capital letter, 1 number, and 1 symbol
    public static boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@_$!%*?&])[A-Za-z\\d@_$!%*?&]{8,25}$";
        return password != null && password.matches(passwordRegex);
    }

    // Validate if password and retype password match
    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }
    
    //Validate if the image type is within the allowed types.
    public static boolean isValidImageType(Part image){
    	if (image == null || image.getSize() == 0) {
            return true;
        }
    	return ALLOWED_TYPES.contains(image.getContentType()) ;
    }
    
  
    //Validate if the image size is within the max size.
    public static boolean isValidImageSize(Part image) {
    	if (image == null || image.getSize() == 0) {
            return true;
        }
        final long MAX_SIZE = 2 * 1024 * 1024; // 2 MB in bytes
        return image.getSize() <= MAX_SIZE;
    }

}