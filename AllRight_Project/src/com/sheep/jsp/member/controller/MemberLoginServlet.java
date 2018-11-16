package com.sheep.jsp.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.point.model.service.PointService;
import com.sheep.jsp.point.model.vo.Point;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/mLogin.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1001L;
	
	
	 private static MemberLoginServlet instance = new MemberLoginServlet();

	    public static MemberLoginServlet getInstance() {
	        return instance;
	    }


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("inputId");
		String userPwd = request.getParameter("inputPassword");
		String androidCheck = request.getParameter("android");
		
		MemberService ms = new MemberService();
		
		PointService ps = new PointService();
		
		Member m = new Member(userId,userPwd);
		
		Point pt = null;

		Object level = new Object();
		try{
			
			m = ms.selectMember(m);
			
			System.out.println("로그인 성공!");
			
			pt = ps.selectPoint(m.getUserNo());
			
			Date today = new Date(new java.util.Date().getTime());

			if(ms.checkDate(m.getUserNo())==1){
				pt.setPoint(pt.getPoint()+10);
				pt.setTotalPoint(pt.getTotalPoint()+10);
				ps.addPoint(pt);
			}
			
			m.setFinalDate(today);
			
			ms.addFinalDate(m);

			
			level=((pt.getTotalPoint()/100)+1);
			HttpSession session = request.getSession();
			
			session.setAttribute("member",m);
			session.setAttribute("point", pt);
			session.setAttribute("level", level);
			
			if(androidCheck =="A"){
				response.sendRedirect("android.jsp");
			}else{
				response.sendRedirect("index.jsp");
			}
		} catch(MemberException e){
			
			request.setAttribute("msg", "로그인 실패");
			
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			
		} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
