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


		String name[];
		// 기술사=0
		String name1[] = {"필기시험원서접수시작 일자 ", "필기시험원서접수종료 일자 ", "필기시험일자", "필기시험 합격(예정)자 발표일자 ",
				"응시자격 서류제출 및 필기시험 합격자 결정시작일자 ", "응시자격 서류제출 및 필기시험 합격자 결정종료일자 ", "면접시험원서접수시작 일자 ", "면접시험원서접수종료 일자 ",
				"면접시험시작일자 ", "면접시험종료일자", "합격자발표일자" };
		
		// 기능장=1
		String name2[] = {"필기시험원서접수시작 일자", "필기시험원서접수종료 일자 ", "필기시험일자", "필기시험 합격(예정)자 발표일자 ",
				"응시자격 서류제출 및 필기시험 합격자 결정시작일자", "응시자격 서류제출 및 필기시험 합격자 결정종료일자", "실기시험원서접수시작 일자 ", "실기시험원서접수종료 일자 ",
				"실기시험시작일자 ", "실기시험종료일자 ", "합격자발표일 " };
		// 3기사 산업기사=3
		String name3[] = {"필기시험원서접수시작일자", "필기시험원서접수종료일자", "필기시험일자", "필기시험합격(예정)자 발표일자", "응시자격 서류 제출 및 필기 시험합격자 결정시작일자",
				"응지사격 서류제출및 필기시험 합격자 결정종료일자", "실기시험원서접수시 작일자", "실기시험원서접수종 료일자", "실기시험시작일자", "실기시험종료일자", "합격자발표일자 " };
	
		// 기능사=6==XXXXXXXX
		String name4[] = { "필기시험원서접수시작 일자", "필기시험원서접수종료 일자", "필기시험일자 ", "필기시험 합격(예정)자 발표일자 ", "실기시험원서접수시작 일자 ",
				"실기시험원서접수종료 일자 ", "실기시험시작일자 ", "실기시험종료일자", "합격자발표일자 " };

		
		/*System.out.println(name1);*/
		
		String[] f;
		
		int k = 0;
		String date = "";
		for (int i = 0; i < l.size(); i++) {
			ArrayList type = new ArrayList();
			/*System.out.println(l);*/
			String t = l.get(i).getlType();
			/*	System.out.println(t);*/
			for (int j = 0; j < l.get(i).getlDate().length(); j += 8) {
				if (l.get(i).getlDate().contains("xx")){
					
					continue;
				}
				// 자격증 종류타입
				
				if (t.equals('0')){
					for(int a =0; a<name1.length; a++)type.add(name1[a]);
				}
					/*type.add(name1);*/
				/*	f=name1;*/
				else if (t.equals("1")){
					for(int a =0; a<name2.length; a++)type.add(name2[a]);
				}
					/*type.add(name2);*/
					/*f=name2;*/
				else if (t.equals("3")){
					for(int a =0; a<name3.length; a++)type.add(name3[a]);
				}
					/*type.add(name3);*/
					/*f=name3;*/
				else {
					for(int a =0; a<name4.length; a++)type.add(name4[a]);
				}
					/*type.add(name4);*/
					/*f=name4;*/

				info = new JSONObject();
			System.out.println(type.get(k));
		/*
				System.out.println(type.get(k));
*/
				String lname = l.get(i).getlName() + "-" + type.get(k);
				String ld = l.get(i).getlDate().substring(j, j + 8);
				date = ld.substring(0, 4).concat("-").concat(ld.substring(4, 6)).concat("-").concat(ld.substring(6, 8));

				// d-day

				long minus = 0;
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String first = sdf.format(today);


				String last = String.valueOf(date);
				/*
				 * System.out.println(last);//2018-11-10
				 */

				try {
					Date firstDate = sdf.parse(first);
					Date lastDate = sdf.parse(last); // sat nov 10 00:
					minus = (firstDate.getTime() - lastDate.getTime()) / (24 * 60 * 60 * 1000);
					/*System.out.println(lname + ":" + last + " : dday=" + minus);*/
					info.put("dday", minus);
					
				} catch (ParseException e) {

					e.printStackTrace();
				}

				info.put("title", lname);
				info.put("date", date);
				Array.add(info);
				
				
				k++;

			}

			k = 0;

		}

		

		result.put("list", Array);
		result.put("day", day);
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());
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