package com.medikhoj.util;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordUtil {
	private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";
	private static final int TAG_LENGTH_BIT = 128; // valid values: {128, 120, 112, 104, 96}
	private static final int IV_LENGTH_BYTE = 12;
	private static final int SALT_LENGTH_BYTE = 16;
	private static final Charset UTF_8 = StandardCharsets.UTF_8;

	// Generate secure random nonce (IV or salt)
	public static byte[] getRandomNonce(int numBytes) {
		byte[] nonce = new byte[numBytes];
		new SecureRandom().nextBytes(nonce);
		return nonce;
	}

	// Derive AES key from password (here, user's email is used)
	public static SecretKey getAESKeyFromPassword(char[] password, byte[] salt) {
		try {
			SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
			KeySpec spec = new PBEKeySpec(password, salt, 65536, 256);
			byte[] keyBytes = factory.generateSecret(spec).getEncoded();
			return new SecretKeySpec(keyBytes, "AES");
		} catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
			Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}

	// Encrypt password using userEmail
	public static String encrypt(String userEmail, String password) {
		try {
			byte[] salt = getRandomNonce(SALT_LENGTH_BYTE);
			byte[] iv = getRandomNonce(IV_LENGTH_BYTE);

			SecretKey key = getAESKeyFromPassword(userEmail.toCharArray(), salt);

			Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
			GCMParameterSpec spec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
			cipher.init(Cipher.ENCRYPT_MODE, key, spec);

			byte[] cipherText = cipher.doFinal(password.getBytes(UTF_8));

			// Combine IV + Salt + CipherText
			ByteBuffer byteBuffer = ByteBuffer.allocate(iv.length + salt.length + cipherText.length);
			byteBuffer.put(iv);
			byteBuffer.put(salt);
			byteBuffer.put(cipherText);

			return Base64.getEncoder().encodeToString(byteBuffer.array());
		} catch (Exception ex) {
			Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}

	// Decrypt password using userEmail
	public static String decrypt(String encryptedPassword, String userEmail) {
		try {
			byte[] decoded = Base64.getDecoder().decode(encryptedPassword.getBytes(UTF_8));
			ByteBuffer byteBuffer = ByteBuffer.wrap(decoded);

			byte[] iv = new byte[IV_LENGTH_BYTE];
			byteBuffer.get(iv);

			byte[] salt = new byte[SALT_LENGTH_BYTE];
			byteBuffer.get(salt);

			byte[] cipherText = new byte[byteBuffer.remaining()];
			byteBuffer.get(cipherText);

			SecretKey key = getAESKeyFromPassword(userEmail.toCharArray(), salt);

			Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
			GCMParameterSpec spec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
			cipher.init(Cipher.DECRYPT_MODE, key, spec);

			byte[] plainText = cipher.doFinal(cipherText);

			return new String(plainText, UTF_8);
		} catch (Exception ex) {
			Logger.getLogger(PasswordUtil.class.getName()).log(Level.SEVERE, null, ex);
			return null;
		}
	}
}
