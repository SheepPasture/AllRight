package com.sheep.jsp.userAnswer.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.userAnswer.model.service.AnswerService;
import com.sheep.jsp.userAnswer.model.vo.UserAnswer;

/**
 * Servlet implementation class AnswerServlet
 */
@WebServlet("/qAnswer.qn")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tNo = Integer.parseInt(request.getParameter("tNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		int userAnswer = Integer.parseInt(request.getParameter("userAnswer"));
		String aCheck = request.getParameter("aCheck");
		
		UserAnswer a = new UserAnswer();
		
		a.settNo(tNo);
		a.setUserNo(userNo);
		a.setqNo(qNo);
		a.setUserAnswer(userAnswer);
		a.setaCheck(aCheck);
		
		AnswerService as = new AnswerService();
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
