package com.sheep.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.licenseinfo.model.service.LicenseService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.userLicense.model.service.UserLicenseService;
import com.sheep.jsp.userLicense.model.vo.UserLicense;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mUpdate.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pwd = request.getParameter("password");
		String name = request.getParameter("userName");
		String email =request.getParameter("email");
		
		String afterLNo = request.getParameter("licenseName");
		
		System.out.println("afterLNo" + afterLNo);
		System.out.println("1번");
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		/*UserLicense u = (UserLicense)session.getAttribute("UserLicense");*/
		UserLicense u =new UserLicense();
		/*String beforeLNo = u.getlNo();*/
		String beforeLNo = "0490";
		MemberService ms = new MemberService();
		System.out.println("2번");
		UserLicenseService us = new UserLicenseService();
		System.out.println("3번");
		int userNo=m.getUserNo();
		m.setUserPwd(pwd);
		m.setUserName(name);
		m.setEmail(email);
		
		u.setUserNo(userNo);
		u.setlNo(afterLNo);
		
		System.out.println("4번");
		int lresult = ms.updateUserLicense(beforeLNo,u);
		System.out.println("5번");
		if(lresult !=0)System.out.println("성공");
		else System.out.println("실패");
		int result = ms.updateMember(m);
		System.out.println("6번");
		if(result!=0){
			System.out.println("수정 성공");
			response.sendRedirect("views/myPage/myPageMain.jsp");
		}else{
			System.out.println("수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
