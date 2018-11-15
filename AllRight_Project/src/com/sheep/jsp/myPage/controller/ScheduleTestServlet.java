package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.myPage.model.service.MypageService;

/**
 * Servlet implementation class ScheduleTestServlet
 */
@WebServlet("/sTest.sc")
public class ScheduleTestServlet extends HttpServlet {
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userno = 32;
		ArrayList<LicenseInfo> l = new ArrayList<LicenseInfo>();
	
		MypageService ms = new MypageService();
		l = ms.testSchdule(userno);
		String page="/views/myPage/schedule.jsp";

		
		if(l.size()!=0){
			request.setAttribute("l", l);
	
		}else{
			request.setAttribute("bmsg", "작성한 게시글이 없습니다.");
			
		}
		
		

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
