package com.sheep.jsp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		ArrayList<LicenseInfo> li = (ArrayList<LicenseInfo>)session.getAttribute("li");
		System.out.println("li : " + li);
		
		String lNo[]=new String[2];
		lNo[0] = request.getParameter("licenseName");
		lNo[1] = request.getParameter("licenseName1");
		System.out.println(lNo[0]);
		System.out.println("wwww : "+lNo[1]);

		MemberService ms = new MemberService();
		
		System.out.println("2번");
		UserLicenseService us = new UserLicenseService();
		System.out.println("3번");
		int userNo=m.getUserNo();
		
		m.setUserPwd(pwd);
		m.setUserName(name);
		m.setEmail(email);
		
		int result;
		try {
			result = ms.updateMember(m,lNo);
			System.out.println("수정 성공");
			response.sendRedirect("views/myPage/myPageMain.jsp");
		
		} catch (Exception e) {
			System.out.println("수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
