package com.sheep.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.point.model.service.PointService;
import com.sheep.jsp.userLicense.model.vo.UserLicense;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1000L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("inputId");
		String pass = request.getParameter("inputPassword");	
		String name = request.getParameter("inputName");
		String email = request.getParameter("inputEmail");
		
		// 자격증 선택시 lno값
		String lNo[]=new String[2];
				lNo[0] = request.getParameter("licenseName");
				lNo[1] = request.getParameter("licenseName1");
				
		System.out.println("lno : " +lNo[0] + ":" + lNo[1]);	
		MemberService ms = new MemberService();
		PointService ps = new PointService();
		
		Member m = new Member(userId,pass,name,email);
		
		/*UserLicense u =new UserLicense();*/
		
		System.out.println(m);
		
		try{
			ms.insertMember(m,lNo);
			ps.insertPoint(userId);
			System.out.println("회원가입 성공");
	
			response.sendRedirect("index.jsp");
		} catch(Exception e){
			request.setAttribute("msg", "회원가입실패");
			request.setAttribute("exception",e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
