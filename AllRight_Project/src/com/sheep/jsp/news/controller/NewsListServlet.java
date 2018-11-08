package com.sheep.jsp.news.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.news.model.service.NewsService;
import com.sheep.jsp.news.model.vo.News;

/**
 * Servlet implementation class NewsListServlet
 */
@WebServlet("/selectList.ne")
public class NewsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 뉴스 여러개를 받기 위한 리스트
		ArrayList<News> list = new ArrayList<News>();
		
		NewsService ns = new NewsService();
		
		list = ns.selectList();
		
		String page = "";
		
		if(list != null){
			
			page = "/views/news/newLists.jsp";
			request.setAttribute("list", list);
		} else {
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "뉴스 조회 실패");
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
