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
		JSONArray Array = new JSONArray();
		String name[] = { "필기시험원서접수시작 일자 ", "필기시험원서접수종료 일자 ", "필기시험일자", "필기시험 합격(예정)자 발표일자 ",
				"응시자격 서류제출 및 필기시험 합격자 결정시작일자 ", "응시자격 서류제출 및 필기시험 합격자 결정종료일자 ", "면접시험원서접수시작 일자 ", "면접시험원서접수종료 일자 ",
				"면접시험시작일자", "면접시험종료일자", "합격자발표일자" };
		int k = 0;
		
			for (int i = 0; i < l.size(); i++) {
				/*System.out.println("lsize= " + l.size());*/
				

				for(int j =0; j<l.get(i).getlDate().length();j+=8){
					/*System.out.println(i + ":" +"ldate길이 : " + l.get(i).getlDate().length());*/
					info = new JSONObject();	
					/*System.out.println("k : " +k);*/
					
					String lname = l.get(i).getlName()+"-"+name[k];
					String ld = l.get(i).getlDate().substring(j,j+8);
					String date= ld.substring(0,4).concat("-").concat(ld.substring(4, 6)).concat("-").concat(ld.substring(6,8)); 
					System.out.println(lname + " : " + date);
					
					info.put("title", lname);
					info.put("date", date);
					Array.add(info);
					/*System.out.println(Array);*/
					k++;
					
						
				}
				
				k=0;
				
				
			}
		
		result.put("list", Array);
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());	
		
		
		
		
		
	/*	HttpSession session = request.getSession(false);
		
		
		Member m = (Member)session.getAttribute("member");
		
		int userno = m.getUserNo();
		int userno=1;
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
		
		request.getRequestDispatcher(page).forward(request, response);*/
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}