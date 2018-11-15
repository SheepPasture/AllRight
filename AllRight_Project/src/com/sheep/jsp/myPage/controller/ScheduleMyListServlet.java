package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.userLicense.model.vo.*;



/**
 * Servlet implementation class VeiwMySchedule
 */
@WebServlet("/lMylist.li")
public class ScheduleMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleMyListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		
		Member m = (Member)session.getAttribute("member");
		
		int userno = m.getUserNo();
	/*	int userno=1;*/
		JSONObject result = new JSONObject();
		JSONObject userInfo = null;
		JSONArray userArray = new JSONArray();
		
		ArrayList<LicenseInfo> list = new ArrayList<LicenseInfo>();
		
	
		MypageService ms = new MypageService();

		list = ms.selectMySchedule(userno);

		String page="/views/myPage/schedule.jsp";
		
		
		if(list.size()!=0){
			request.setAttribute("list", list);
		}else{
			request.setAttribute("msg", "관심 자격증이 없습니다.");
			
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