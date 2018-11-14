package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.board.model.vo.PageInfo;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Board> list = new ArrayList<Board>();
		
		System.out.println("list: " + list);
		
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
		
		list = bs.selectList(currentPage, limit);
		
		String page = "";

		if(list != null){
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			page="/views/Board/boardList.jsp";
			request.setAttribute("pi", pi);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
