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
 * Servlet implementation class ANNupdateServlet
 */
@WebServlet("/aUpdate.ann")
public class ANNUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ANNUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ano = Integer.parseInt(request.getParameter("ano"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
/*		Announcement a = new Announcement();*/
		
		ANNService as = new ANNService();
		Announcement a = as.selectOne(ano);
		
		a.setAtitle(title);
		a.setAcontent(content);
		a.setAno(ano);
		
		int result = as.updateANN(a);
		
		String page = "";
		
		if(result > 0){
			page = "/views/announcement/ANNDetail.jsp";
			request.setAttribute("announcement", a);
		} else{
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 수정 실패");
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
