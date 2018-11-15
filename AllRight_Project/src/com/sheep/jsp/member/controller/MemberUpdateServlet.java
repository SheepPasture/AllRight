package com.sheep.jsp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;

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
	/*	String license = request.getParameter("userLi");*/
		System.out.println(pwd);
		/*System.out.println(name);
		System.out.println(email);
		*/
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		MemberService ms = new MemberService();
		
		String userId=request.getParameter("userId");
		m.setUserPwd(pwd);
		m.setUserName(name);
		m.setEmail(email);
		
		int result = ms.updateMember(m);
		
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
