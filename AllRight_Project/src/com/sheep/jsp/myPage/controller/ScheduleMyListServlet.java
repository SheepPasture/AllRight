package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Upstream, based on origin/master
		
		HttpSession session = request.getSession(false);
		
		
		Member m = (Member)session.getAttribute("member");
		
		int userno = m.getUserNo();
	/*	int userno=1;*/
=======
		/*int userno = Integer.parseInt(request.getParameter("USERNO"));*/

	
		int userno=1;
>>>>>>> 07c02a2 commit request
		JSONObject result = new JSONObject();
		JSONObject userInfo = null;
		JSONArray userArray = new JSONArray();
		
		ArrayList<LicenseInfo> list = new ArrayList<LicenseInfo>();
		
	
		MypageService ms = new MypageService();

		list = ms.selectMySchedule(userno);
<<<<<<< Upstream, based on origin/master

=======
		/*System.out.println(list);*/
>>>>>>> 07c02a2 commit request
		String page="/views/myPage/schedule.jsp";
<<<<<<< Upstream, based on origin/master
		
		
=======

>>>>>>> 07c02a2 commit request
		if(list.size()!=0){
			request.setAttribute("list", list);
<<<<<<< Upstream, based on origin/master
=======
	
>>>>>>> 07c02a2 commit request
		}else{
			request.setAttribute("msg", "관심 자격증이 없습니다.");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
