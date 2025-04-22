package com.medikhoj.util;

import java.security.MessageDigest;

public class PasswordUtil {
	 public static String hashPassword(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] bytes = md.digest(password.getBytes());
	            StringBuilder sb = new StringBuilder();
	            for (byte b : bytes) {
	                sb.append(String.format("%02x", b));
	            }
	            return sb.toString();
	        } catch (Exception e) {
	            throw new RuntimeException("Error while hashing", e);
	        }
	    }
	 
	 
	 public static boolean verifyPassword(String inputPassword, String storedPassword) {
		    // Hash the input password using the same hashing method
		    String hashedInputPassword = hashPassword(inputPassword);
		    
		    
		    System.out.println(hashedInputPassword);
		    System.out.println(storedPassword);
		    
		    // Compare the hashed input password with the stored password
		    return hashedInputPassword.equals(storedPassword);
		}

}
