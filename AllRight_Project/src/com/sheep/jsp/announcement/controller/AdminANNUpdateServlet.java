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
 * Servlet implementation class AdminANNUpdateServlet
 */
@WebServlet("/annUpdate.ad")
public class AdminANNUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminANNUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int ano = Integer.parseInt(request.getParameter("ano"));

		System.out.println("업데이트서블릿");
		
		Announcement a = new Announcement();
		
		a.setAtitle(title);
		a.setAcontent(content);
		a.setAno(ano);
		
		int result = new ANNService().updateANN(a);
		
		if(result > 0){
			response.sendRedirect("annSelectOne.ad?ano=" + ano);
			System.out.println("업데이트");
		} else{
			request.setAttribute("msg", "공지사항 수정 실패!");
			request.getRequestDispatcher("views/common/adminErrorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
