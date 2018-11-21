package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;

/**
 * Servlet implementation class boardlistViewServlet
 */
@WebServlet("/boardlistView.bo")
public class boardlistViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardlistViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bid = Integer.parseInt(request.getParameter("bid"));
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
		
		int listCount = bs.getListCount(bid);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1 ) * limit + 1;
		
		endPage = startPage + limit -1; 
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
		ArrayList<Board> list = bs.boardlistView(currentPage, limit);
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
