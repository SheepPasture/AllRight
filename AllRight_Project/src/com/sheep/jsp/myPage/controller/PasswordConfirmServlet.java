package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;

/**
 * Servlet implementation class PasswordConfirmServlet
 */
@WebServlet("/pConfirm.me")
public class PasswordConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("password");

	
		MemberService ms = new MemberService();
		
		Member m = new Member(userId,pwd);
		JSONObject result = new JSONObject();
		JSONObject info = new JSONObject();
		String page="";
		int num = ms.confirmPassword(m);
		
		
		if(num >0){
			System.out.println("일치하다");
			response.sendRedirect("views/myPage/updateMember.jsp");
			
		}else{
			System.out.println("일치하지않다.");
			result.put("msg", "일치하지 않다");
			response.setContentType("application/json");
			/*response.getWriter().print(result.toJSONString());*/
		}
		
	/*	try {
			m = ms.confirmPassword(m);
			System.out.println(m);
			
			if(m!=null){
				response.setCharacterEncoding("UTF-8");
				System.out.println("있음");
				System.out.println(m.getUserId());
				info.put("result", m.getUserNo());
				 page = "/views/myPage/updateMember.jsp";
				 request.getRequestDispatcher(page).forward(request, response);
				 response.sendRedirect(page);
				 response.sendRedirect("/index.jsp");
			}else{
				info.put("result", 0);	
			}
	
		} catch (MemberException e) {
		}*/
		/*result.put("list", info);
		response.setContentType("application/json");*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
