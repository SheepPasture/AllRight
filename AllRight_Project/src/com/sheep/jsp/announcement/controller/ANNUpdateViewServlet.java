package com.sheep.jsp.announcement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.announcement.model.service.ANNService;
import com.sheep.jsp.announcement.model.vo.Announcement;

/**
 * Servlet implementation class ANNUpdateViewServlet
 */
@WebServlet("/aUpView.ann")
public class ANNUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ANNUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		Announcement a = new ANNService().updateView(ano);
		
		String page = "";
		
		if(a!=null){
			page="views/announcement/ANNUpdate.jsp";
			request.setAttribute("announcement", a);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지 수정 실패!");
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
