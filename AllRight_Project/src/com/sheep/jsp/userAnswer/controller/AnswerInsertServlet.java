package com.sheep.jsp.userAnswer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.userAnswer.model.service.AnswerService;
import com.sheep.jsp.userAnswer.model.vo.UserAnswer;

/**
 * Servlet implementation class AnswerInsertServlet
 */
@WebServlet("/Insert.an")
public class AnswerInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<UserAnswer> list = new ArrayList<UserAnswer>();
		
		AnswerService as =  new AnswerService();
		
		list = as.selectList();
		
		String page = "";
		
		if(list != null){
			
			page = "views/answer/answerInsertForm.jsp";
			request.setAttribute("list", list);
			
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "요청실패");
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
