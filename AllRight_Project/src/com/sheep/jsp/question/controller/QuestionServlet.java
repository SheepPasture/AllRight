package com.sheep.jsp.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.question.model.service.QuestionService;
import com.sheep.jsp.question.model.vo.Question;

/**
 * Servlet implementation class QuestionServlet
 */
@WebServlet("/question.qu")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Question> qs = new ArrayList<Question>();
		qs = new QuestionService().selectList();
		int qNo = 0;
		
		if(request.getParameter("qNo") != null){
			qNo = Integer.parseInt(request.getParameter("qNo"));
		}
		
		String page = "";
		
		if(qs != null){
		page = "/views/answer/answerPage.jsp";
		request.setAttribute("qs", qs);
		request.setAttribute("qNo", qNo);
		
		
		} else {
		System.out.println("실패");
			
		page = "/views/common/errorPage.jsp";
		
		
		
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		}
	
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
