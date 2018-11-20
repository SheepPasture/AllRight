package com.sheep.jsp.member.encrypt;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper{
	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {
		
		String value = "";
		
		if (name != null && (name.equals("inputPassword")||(name.equals("password")))){
			value = getSHA512(super.getParameter(name));
			
		} else {
			value = super.getParameter(name);
			
		}
		return value;
	}

	private static String getSHA512(String password){
		String result = null;
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = password.getBytes(Charset.forName("UTF-8"));
			
			md.update(bytes);
			
			result = Base64.getEncoder().encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
