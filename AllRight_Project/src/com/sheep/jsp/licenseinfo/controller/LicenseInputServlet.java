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
		
		new LicenseService().deleteLicense();
		
		int result = new LicenseService().insertLicense(pa.getApi());
		
		if(result > 0){
			// 성공적으로 자격증 저장
			
			System.out.println("자격증 저장 성공!");
			
			// 생성된 테이블에 응시료 업데이트를 위한 모든 내용 가져오기
			ArrayList<LicenseInfo> list = new LicenseService().selectLicense();
			
			// 가져온 리스트로 응시료 업데이트 실행
			System.out.println("응시료 업데이트 중... 잠시 기다려주세요!");
			list = new LicenseService().updateCost(list);
			System.out.println("응시료 업데이트 완료!");
			
			// 응시료까지 포함된 list로 자격증 정보까지 업데이트 실행
			System.out.println("자격증 정보 업데이트 중... 잠시 기다려주세요!");
			list = new LicenseService().updateInfoData(list);
			System.out.println("자격증 정보 업데이트 완료!");
			
//			if(result2 > 0) System.out.println("응시료 업데이트 성공!");
//			else System.out.println("응시료 업데이트 실패!");
			
			
		} else {
			
			// 실패
			System.out.println("자격증 저장 실패!");
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
