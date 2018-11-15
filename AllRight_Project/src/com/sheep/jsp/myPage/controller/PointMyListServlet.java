package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.point.model.service.PointService;
import com.sheep.jsp.userPoint.model.vo.UserPoint;

/**
 * Servlet implementation class PointMyListServlet
 */
@WebServlet("/pMyList.po")
public class PointMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PointMyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		int userno = m.getUserNo();
		ArrayList<UserPoint> plist = new ArrayList<UserPoint>();
		
		PointService ms = new PointService();
		plist = ms.selectMyPoint(userno);
		if(plist.size()!=0){
			int level = ((plist.get(0).getTotalPoint())/100)+1;
			request.setAttribute("plist", plist);
			request.setAttribute("level", level);
	
		}else{
			request.setAttribute("cmsg", "포인트가 없숩니다");
			
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
