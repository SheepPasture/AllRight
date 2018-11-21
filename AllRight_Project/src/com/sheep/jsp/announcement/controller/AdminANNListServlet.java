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
import com.sheep.jsp.announcement.model.vo.PageInfo;

/**
 * Servlet implementation class AdminANNListServlet
 */
@WebServlet("/selectList.ad")
public class AdminANNListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminANNListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Announcement> alist = null;
		
		ANNService as = new ANNService();
		
		// -- 페이징 처리 (데이터를 일정량 끊어서 가져오는 기술) -- //
		
		int startPage; // 한 번에 표시되는 페이지의 첫 페이지 (1, 2, 3, 4, 5) --> 1
		int endPage;	// 한 번에 표시되는 페이지의 마지막 페이지 (1, 2, 3, 4, 5) --> 5
		int maxPage;	// 전체 페이지의 마지막 페이지 (21, 22)  --> 22
		int currentPage; // 현재 사용자가 위치한 페이지
		int limit;      // 한 번에 보여줄 페이지 수
		
		// 게시판은 1페이지부터 시작 한다.
		currentPage = 1;
		
		limit = 10; // 한 번에 보여줄 페이지 수 / 한 페이지에 표시할 게시글 수
		
		// 만약에 사용자가 현재 접속한 페이지의 정보를 가진다면
		// 해당 페이지의 정보를 받을 수 있어야 한다.
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 게시글 수 조회하기
		int listCount = as.getListCount();
		
		System.out.println("전체 게시글 수 : "+ listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = ((int)((double)currentPage / limit + 0.9) - 1 ) * limit + 1;
		
		endPage = startPage + limit -1; 
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
		alist = as.selectList(currentPage, limit);
		
		String page = "";

		if(alist != null){
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			page="/views/admin/BoardEdit.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("alist", alist);
			
		} else {
			
			page = "/views/common/adminErrorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패했습니다. 관리자에게 문의해주세요.");
			
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
