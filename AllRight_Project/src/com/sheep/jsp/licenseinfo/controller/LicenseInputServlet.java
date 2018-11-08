package com.sheep.jsp.licenseinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.common.util.ParseApi;
import com.sheep.jsp.licenseinfo.model.service.LicenseService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;


@WebServlet("/lInput.do")
public class LicenseInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LicenseInputServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ParseApi pa = new ParseApi();
		
		int result = new LicenseService().insertLicense(pa.getApi());
		
		if(result > 0){
			// 성공적으로 자격증 저장
			
			System.out.println("자격증 저장 성공!");
		} else {
			// 실패
			System.out.println("자격증 저장 실패!");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
