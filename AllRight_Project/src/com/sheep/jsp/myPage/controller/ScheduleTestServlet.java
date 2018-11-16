package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.myPage.model.service.MypageService;

/**
 * Servlet implementation class ScheduleTestServlet
 */
@WebServlet("/sTest.sc")
public class ScheduleTestServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ScheduleTestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userno = 32;
		ArrayList<LicenseInfo> l = new ArrayList<LicenseInfo>();

		MypageService ms = new MypageService();
		l = ms.testSchdule(userno);
		/* String page="/views/myPage/scheduleTest.jsp"; */

		if (l.size() != 0) {
			request.setAttribute("l", l);

		} else {
			request.setAttribute("bmsg", "작성한 게시글이 없습니다.");

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
		/* request.getRequestDispatcher(page).forward(request, response); */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
