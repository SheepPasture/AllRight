package com.sheep.jsp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberAllServlet
 */
@WebServlet("/mAll.me")
public class MemberAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> m = new ArrayList<Member>();
		JSONObject result = new JSONObject();
		JSONObject info = null;
		JSONArray Array = new JSONArray();
		MemberService ms = new MemberService();
	
		m=ms.selectAll();
		System.out.println(m);
		System.out.println("------");
		System.out.println(m.get(0).getUserId());
		System.out.println("------");
		System.out.println(m.size());
		for (int i = 0; i < m.size(); i++) {
			String id = m.get(i).getUserId();
			String email = m.get(i).getEmail();
			info = new JSONObject();
			info.put("uid", id);
			info.put("uemail", email);
			
			Array.add(info);
			
		}
		result.put("list", Array);
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
