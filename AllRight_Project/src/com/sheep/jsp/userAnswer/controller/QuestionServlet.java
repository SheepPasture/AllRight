package com.sheep.jsp.userAnswer.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.userAnswer.model.vo.Question;
import com.sheep.jsp.userAnswer.model.vo.UserTest;

/**
 * Servlet implementation class QuestionServlet
 */
@WebServlet("/test.do")
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
		List<Question> list = new UserTest().getQuestion();
		
		JSONObject testInfo = null;
		JSONArray result = new JSONArray();
		
		
		for(Question test : list){
			testInfo = new JSONObject();
			testInfo.put("qNo", test.getqNo());
			testInfo.put("qContent", test.getqContent());
			testInfo.put("qPre", test.getqPre());
			testInfo.put("qAnswer", test.getqAnswer());
			
			result.add(testInfo);
			
		}
		
		System.out.println("확인@");
		
		response.setContentType("application/json); charset=UTF-8");
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
