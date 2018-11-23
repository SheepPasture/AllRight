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
 * Servlet implementation class QuestionListServlet
 */
@WebServlet("/question.li")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionListServlet() {
        super();
      
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] answerList = request.getParameterValues("answerList[]");
		
		for(int i = 0; i < answerList.length; i++){
			System.out.println(answerList[i]);	
		}
		
		
//		for(String s : answerList){
//
//			System.out.println(s);
//		}
		
		ArrayList<Question> check = new ArrayList<Question>();
		check = new QuestionService().Qanswer();
		
		for(int i = 0; i < check.size(); i++){
			System.out.println(check.get(i).getqAnswer());	
		}
		
		String page = "";
		
		page = "/views/answer/answerDetail.jsp";
		request.setAttribute("check", check);
		request.setAttribute("answerList", answerList);

		request.getRequestDispatcher(page).forward(request, response);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
