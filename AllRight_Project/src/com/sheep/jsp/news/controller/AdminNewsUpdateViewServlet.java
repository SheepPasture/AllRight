package com.sheep.jsp.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.news.model.service.NewsService;
import com.sheep.jsp.news.model.vo.News;

/**
 * Servlet implementation class AdminNewsUpdateViewServlet
 */
@WebServlet("/nUpView.ad")
public class AdminNewsUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int nno = Integer.parseInt(request.getParameter("nno"));
		
		System.out.println("뉴스업데이트뷰서블릿");
		
		News n = new NewsService().selectOne(nno);
		
		String page = "";
		if(n != null){
			
			page = "/views/admin/newsUpdate.jsp";
			request.setAttribute("news", n);
		} else{
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "뉴스 수정 실패!");
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
