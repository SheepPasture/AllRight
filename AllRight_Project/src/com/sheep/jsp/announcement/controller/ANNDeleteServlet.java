package com.sheep.jsp.announcement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.announcement.model.service.ANNService;

/**
 * Servlet implementation class ANNDeleteServlet
 */
@WebServlet("/aDelete.ann")
public class ANNDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ANNDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		try {
			
			new ANNService().deleteANN(ano);

			response.sendRedirect("selectList.ann");
			
		} catch (Exception e) {
			request.setAttribute("msg", "공지사항 삭제 에러!!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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