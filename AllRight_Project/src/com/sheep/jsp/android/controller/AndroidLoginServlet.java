package com.sheep.jsp.android.controller;

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
 * Servlet implementation class AndroidLoginServlet
 */
@WebServlet("/aLogin.and")
public class AndroidLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AndroidLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("inputId");
		String userPwd = request.getParameter("inputPassword");
		
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
			response.sendRedirect("/android.jsp");
			
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
