package com.sheep.jsp.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.question.model.vo.Question;
import com.sheep.jsp.question.model.vo.UserQue;

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
		List<Question> list = new UserQue().getUserList();
		
		JSONObject queInfo = null;
		JSONArray result = new JSONArray();
		
		for(Question qs : list){
			queInfo = new JSONObject();
			
			queInfo.put("tNo", qs.gettNo());
			queInfo.put("qNo", qs.getqNo());
			queInfo.put("qContent", qs.getqContent());
			queInfo.put("qPre", qs.getqPre());
			queInfo.put("qAnswer", qs.getqAnswer());
			
			result.add(queInfo);
			
			response.setContentType("application/json; charset=UTF-8"); 
		}
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
