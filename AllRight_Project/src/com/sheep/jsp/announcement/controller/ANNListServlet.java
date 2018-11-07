package com.sheep.jsp.announcement.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.announcement.model.service.ANNService;
import com.sheep.jsp.announcement.model.vo.Announcement;

/**
 * Servlet implementation class ANNLIstServlet
 */
@WebServlet("/selectList.ann")
public class ANNListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ANNListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Announcement> list = new ArrayList<Announcement>();
		
		ANNService as = new ANNService();
		
		list = as.selectList();
		
		String page = "";

		if(list != null){
			
			page = "/views/announcement/ANNList.jsp";
			request.setAttribute("list", list);
			
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패했습니다. 관리자에게 문의해주세요.");
			
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
