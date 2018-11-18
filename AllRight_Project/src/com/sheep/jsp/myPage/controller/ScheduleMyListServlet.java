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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		Member m = (Member) session.getAttribute("member");

		int userno = m.getUserNo();

		ArrayList<LicenseInfo> l = new ArrayList<LicenseInfo>();

		MypageService ms = new MypageService();
		l = ms.selectMySchedule(userno);
		/* String page="/views/myPage/scheduleTest.jsp"; */

		if (l.size() != 0) {
			request.setAttribute("l", l);

		} else {
			request.setAttribute("msg", "관심자격증이 없습니다.");

		}

		JSONObject result = new JSONObject();
		JSONObject info = null;
		JSONObject dayinfo = null;

		JSONArray Array = new JSONArray();
		JSONArray day = new JSONArray();
		// 1기술사
		String name[] = { "필기시험원서접수시작 일자 ", "필기시험원서접수종료 일자 ", "필기시험일자", "필기시험 합격(예정)자 발표일자 ",
				"응시자격 서류제출 및 필기시험 합격자 결정시작일자 ", "응시자격 서류제출 및 필기시험 합격자 결정종료일자 ", "면접시험원서접수시작 일자 ", "면접시험원서접수종료 일자 ",
				"면접시험시작일자", "면접시험종료일자", "합격자발표일자" };
		//3기사 산업기사
		String name1[] = { "필기시험원서접수시작일자","필기시험원서접수종료일자","필기시험일자","필기시험합격(예정)자 발표일자","응시자격 서류 제출 및 필기 시험합격자 결정시작일자","응지사격 서류제출및 필기시험 합격자 결정종료일자","실기시험원서접수시 작일자","실기시험원서접수종 료일자","실기시험시작일자","실기시험종료일자","합격자발표일자 "};
		//4.기능사 시험 시행일정 조회
		String name2[]={"필기시험원서접수시작 일자 ","필기시험원서접수종료 일자","필기시험일자","필기시험 합격(예정)자 발표일자","필기시험 합격(예정)자 발표일자","실기시험원서접수시작 일자","실기시험원서접수종료 일자","실기시험시작일자"};
		String name3[]={};
	
		//1 = 기술사 시험 시행 일정 조회		==>11개=회차/필기시험원서접수시작일자/필기시험원서접수종료일자/필기시험일자/필기시험 합격(예정)자 발표일자/ 응시자격 서류제출 및 필기시험 합격자 결정종료일자/응시자격 서류제출및 필기시험합격자 결정종료일자/ 면접시험우너서접수시작일자/면접시험원서접수종료일자/ 면접시험시작일자/면접 시험 종료 일자/합격자 발표일자
		//3= 기사,산업기사 시험 시행 일정조회	==>11개=회차/필기시험원서접수시작일자/필기시험원서접수종료일자/필기시험일자/필기시험합격(예정)자 발표일자/응시자격 서류 제출 및 필기 시험합ㄱㄱ자 결정시작일자./응지사격 서류제출및 필기시험 합격자 결정종료일자 /실기시험원서접수시 작일자/실기시험원서접수종 료일자 /실기시험시작일자/실기시험종료일자/합격자발표일자 
		//4= 기능사 시험 시행일정 조			==>9개 = 회차/필기시험원서접수시작 일자 /필기시험원서접수종료 일자 /필기시험일자/필기시험 합격(예정)자 발표일자/필기시험 합격(예정)자 발표일자/실기시험원서접수시작 일자	/실기시험원서접수종료 일자 	/실기시험시작일자 /////
		//6 = 종목별 시행 일정 조회.....
	
		int k = 0;
		String date = "";
		for (int i = 0; i < l.size(); i++) {
			/* System.out.println("lsize= " + l.size()); */

			for (int j = 0; j < l.get(i).getlDate().length(); j += 8) {
				/*
				 * System.out.println(i + ":" +"ldate길이 : " +
				 * l.get(i).getlDate().length());
				 */
				
				// 자격증 종류타입
				/*
				String no = l.get(i).getlNo();
				if(no=="1")name=name;
				else if(no=="2")name=name1;
				else if(no=="3")name=name2;
				else if(no=="4")name=name3;
				
				*/
				info = new JSONObject();
				/* System.out.println("k : " +k); */

				String lname = l.get(i).getlName() + "-" + name[k];
				String ld = l.get(i).getlDate().substring(j, j + 8);
				date = ld.substring(0, 4).concat("-").concat(ld.substring(4, 6)).concat("-")
						.concat(ld.substring(6, 8));
				/* System.out.println(lname + " : " + date); */
				
				// d-day 
				long minus = 0;
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String first = sdf.format(today);
				
				String last= String.valueOf(date); 
				/*System.out.println(last);//2018-11-10
				 */
				
				try {
					Date firstDate = sdf.parse(first); 
					Date lastDate =sdf.parse(last); //sat nov 10 00:
					minus =(firstDate.getTime()-lastDate.getTime())/(24*60*60*1000);
					System.out.println(lname+ ":" + last + " : " + minus);
					info.put("dday",minus);
					/*if(minus>=(-50)&&minus<0){ 
						System.out.println(lname + ":" + last + ":" + minus);
						dayinfo.put("dtitle", lname);
						dayinfo.put("ddate", last);
						dayinfo.put("dday", minus); 
						day.add(dayinfo); 
					}else{
						System.out.println("dday 없다");
					}*/
				
				} catch (ParseException e) {
				
				e.printStackTrace(); }

				
				info.put("title", lname);
				info.put("date", date);
				Array.add(info);
				k++;

			}

			k = 0;

		}
		
		/*long minus = 0;
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String first = sdf.format(today);
		
		String last= sdf.format(date); System.out.println(last);
		 
		
		try {
			Date firstDate = sdf.parse(first); 
			Date lastDate =sdf.parse(date); 
			minus =(firstDate.getTime()-lastDate.getTime())/(24*60*60*1000);
			System.out.println(lastDate + " : " + minus);
			
			if(minus>=(-50)&&minus<0){ 
				System.out.println(lastDate);
				dayinfo.put("dtitle", lname); dayinfo.put("ddate", date);
				dayinfo.put("dday", minus); day.add(dayinfo); 
			}else{
			
			}
		
		} catch (ParseException e) {
		
		e.printStackTrace(); }
*/		 

		
		

		result.put("list", Array);
		result.put("day", day);
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());

		/*
		 * HttpSession session = request.getSession(false);
		 * 
		 * 
		 * Member m = (Member)session.getAttribute("member");
		 * 
		 * int userno = m.getUserNo(); int userno=1; JSONObject result = new
		 * JSONObject(); JSONObject userInfo = null; JSONArray userArray = new
		 * JSONArray();
		 * 
		 * ArrayList<LicenseInfo> list = new ArrayList<LicenseInfo>();
		 * 
		 * 
		 * MypageService ms = new MypageService();
		 * 
		 * list = ms.selectMySchedule(userno);
		 * 
		 * String page="/views/myPage/schedule.jsp";
		 * 
		 * 
		 * if(list.size()!=0){ request.setAttribute("list", list); }else{
		 * request.setAttribute("msg", "관심 자격증이 없습니다.");
		 * 
		 * }
		 * 
		 * request.getRequestDispatcher(page).forward(request, response);
		 */

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