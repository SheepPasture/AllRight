package com.sheep.jsp.licenseinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.common.util.ParseApi;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;


@WebServlet("/lInput.do")
public class LicenseInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LicenseInputServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<LicenseInfo> al = new ArrayList<LicenseInfo>();
		
		ArrayList<LicenseInfo> al2 = new ArrayList<LicenseInfo>();
		
		ArrayList<LicenseInfo> al3 = new ArrayList<LicenseInfo>();
		
		al.addAll(new ParseApi().getApiName());
		
		al2.addAll(new ParseApi().getApiCategory());
		
		al3.addAll(new ParseApi().getApiInfo());		
		
		System.out.println(al3.get(0).getlName());
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
