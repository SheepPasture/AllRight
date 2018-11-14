package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.Messaging.SyncScopeHelper;

import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.userPoint.model.vo.UserPoint;

/**
 * Servlet implementation class MainMyListServlet
 */
@WebServlet("/mMylist.me")
public class MainMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainMyListServlet() {
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
		
		MypageService ms = new MypageService();
		plist = ms.selectMyPoint(userno);
		
		String page = "/views/myPage/myPageMain.jsp";
		if(plist.size()!=0){
			request.setAttribute("plist", plist);
			
			
			int point = plist.get(0).getTotalPoint();
			String level=String.valueOf((int)point/100);
			request.setAttribute("level", level);
		}else{
			request.setAttribute("msg", "포인트가 없습니다.");
		}
		
		System.out.println(plist);
		System.out.println(page);
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
