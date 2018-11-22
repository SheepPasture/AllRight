package com.sheep.jsp.popBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.popBoard.dao.popBoardCountDao;

/**
 * Servlet implementation class popBoardServlet
 */
@WebServlet("/pboard.po")
public class popBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public popBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		popBoardCountDao dao = popBoardCountDao.getInstance();
		
		int pop1Count = dao.getPop1Count();
		int pop2Count = dao.getPop2Count();
		int pop3Count = dao.getPop3Count();
		int pop4Count = dao.getPop4Count();
		int pop5Count = dao.getPop5Count();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("pop1Count", pop1Count);
		session.setAttribute("pop2Count", pop2Count);
		session.setAttribute("pop3Count", pop3Count);
		session.setAttribute("pop4Count", pop4Count);
		session.setAttribute("pop5Count", pop5Count);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
