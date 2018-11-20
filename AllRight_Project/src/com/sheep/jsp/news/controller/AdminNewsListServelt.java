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
import com.sheep.jsp.news.model.vo.PageInfo;

/**
 * Servlet implementation class AdminNewsListServelt
 */
@WebServlet("/newsSelectList.ad")
public class AdminNewsListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewsListServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 뉴스 여러개를 받기 위한 리스트
				ArrayList<News> list = new ArrayList<News>();
				ArrayList<News> poplist = new ArrayList<News>();
				ArrayList<News> firstlist = new ArrayList<News>();
				
				NewsService ns = new NewsService();
				
				//페이징처리
				int startPage;
				int endPage;
				int maxPage;
				int currentPage;
				int limit;
				
				currentPage = 1;
				
				limit = 10;
				
				if(request.getParameter("currentPage") != null){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				int listCount = ns.getListCount();
				
				System.out.println("전체 게시글 수 : " + listCount);
				
				maxPage = (int)((double)listCount / limit + 0.9);
				
				startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
				
				endPage = startPage + limit - 1;
				
				if(endPage > maxPage){
					endPage = maxPage;
				}
				
				list = ns.selectList(currentPage, limit);
				
				poplist = ns.selectList();
				
				firstlist = ns.selectFirstList();
				
				System.out.println("poplist : " + poplist);
				
				String page = "";
				
				if(list != null){
					
					PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
					
					page = "/views/admin/NewsEdit.jsp";
					request.setAttribute("pi", pi);
					request.setAttribute("list", list);
					request.setAttribute("poplist", poplist);
					request.setAttribute("firstlist", firstlist);
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
