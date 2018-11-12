package com.sheep.jsp.userTest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.userTest.model.vo.UserTest;
import com.sheep.jsp.userTest.model.vo.UserUtil;

/**
 * Servlet implementation class AnswerTestServlet
 */
@WebServlet("/answer.te")
public class AnswerTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerTestServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserTest> list = new UserUtil().getUserList();
		
		JSONObject userInfo = null;
		JSONArray result = new JSONArray();
		
		for(UserTest user : list){
			userInfo = new JSONObject();
			
			userInfo.put("tNo", user.gettNo());
			userInfo.put("userNo", user.getUserNo());
			userInfo.put("lNo", user.getlNo());
			
			result.add(userInfo);
			
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
