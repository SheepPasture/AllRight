package com.sheep.jsp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sheep.jsp.licenseinfo.model.service.LicenseService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.service.MemberService;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.point.model.service.PointService;
import com.sheep.jsp.point.model.vo.Point;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/mLogin.me")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1001L;

	private static MemberLoginServlet instance = new MemberLoginServlet();

	public static MemberLoginServlet getInstance() {
		return instance;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("inputId");
		String userPwd = request.getParameter("inputPassword");
		String androidCheck = request.getParameter("android");

		PrintWriter out = response.getWriter();

		MemberService ms = new MemberService();

		PointService ps = new PointService();

		Member m = new Member(userId, userPwd);
		
		Point pt = null;
		ArrayList<LicenseInfo> li = new ArrayList<LicenseInfo>();
		
		LicenseService ls = new LicenseService();
		
		Object level = new Object();
		try {

			m = ms.selectMember(m);

			System.out.println("로그인 성공!");

			System.out.println("안드로이드 체크 : " + androidCheck);

			pt = ps.selectPoint(m.getUserNo());
			
			li=ls.selectMyLicenseInfo(m.getUserNo());
			
			for(int i =0; i<li.size();i++){
				
			}
			
			System.out.println(li);
			Date today = new Date(new java.util.Date().getTime());

			if (ms.checkDate(m.getUserNo()) == 1) {
				pt.setPoint(pt.getPoint() + 10);
				pt.setTotalPoint(pt.getTotalPoint() + 10);
				ps.addPoint(pt);
			}

			m.setFinalDate(today);

			ms.addFinalDate(m);

			
			System.out.println(m);
			level = ((pt.getTotalPoint() / 100) + 1);
			HttpSession session = request.getSession();
			
			
			int memberCount = ms.getMemberCount();
			
			
			session.setAttribute("member", m);
			session.setAttribute("point", pt);
			session.setAttribute("level", level);
			session.setAttribute("li", li);
			session.setAttribute("memberCount", memberCount);
			
			System.out.println(pt);
			System.out.println(li);
			System.out.println(m);
			System.out.println(level);
			if (androidCheck != null) {
				System.out.println("안드로이드에서 로그인을 시도합니다.");
				JSONObject jsonMember = new JSONObject();
				jsonMember.put("userNo", m.getUserNo());
				jsonMember.put("userName", m.getUserName());
				jsonMember.put("userid", m.getUserId());
				jsonMember.put("userDate", m.getUserDate());
				jsonMember.put("finaldate", m.getFinalDate());
				jsonMember.put("userEmail", m.getEmail());
				jsonMember.put("userPwd", m.getUserPwd());
				jsonMember.put("userpoint", pt.getPoint());
				jsonMember.put("usertotalpoint", pt.getTotalPoint());

				out.println(jsonMember.toJSONString());
				System.out.println("안드로이드 로그인 성공");
				out.close();

			} else if (m.getUserId().equals("admin")) {

				response.sendRedirect("admin.jsp");

			} else {

				response.sendRedirect("index.jsp");
			}
			
		} catch (MemberException e) {

			if (androidCheck != null) {
				out.println("fail");
				System.out.println("안드로이드 로그인 실패");

			} else {

				request.setAttribute("msg", "로그인 실패");

				request.setAttribute("exception", e);

				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
