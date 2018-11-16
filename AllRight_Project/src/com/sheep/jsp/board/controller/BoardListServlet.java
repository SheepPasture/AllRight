package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.announcement.model.service.ANNService;
import com.sheep.jsp.announcement.model.vo.Announcement;
import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.board.model.vo.bPageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/selectList.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Board> blist = new ArrayList<Board>();
		ArrayList<Announcement> select2ANN = new ArrayList<Announcement>();
		
		System.out.println("blist: " + blist);
		
		BoardService bs = new BoardService();
		
		// -- 페이징 처리 (데이터를 일정량 끊어서 가져오는 기술) -- //
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
		
		// 전체 게시글 수 조회하기
		int listCount = bs.getListCount();
		
		System.out.println("전체 게시글 수 : "+ listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1 ) * limit + 1;
		
		endPage = startPage + limit -1; 
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
		blist = bs.selectList(currentPage, limit);
		select2ANN = bs.selectList2();
		
		System.out.println("Select2ann: "+select2ANN);
		
		String page = "";

		if(blist != null){
			
			bPageInfo pi = new bPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			page="/views/board/boardList.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("blist", blist);
			request.setAttribute("select2ANN", select2ANN);
			
		} else {
			
		/*	page = "/views/common/errorPage.jsp";*/
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
