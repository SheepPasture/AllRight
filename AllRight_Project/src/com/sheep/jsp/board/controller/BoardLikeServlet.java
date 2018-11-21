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
import com.sheep.jsp.boardComment.model.service.BoardCommentService;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/bLike.bo")
public class BoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Board b = new BoardService().boardLike(bid, bno);
		ArrayList<BoardComment> clist = new BoardCommentService().selectList(bno);
		
		System.out.println("b: "+b);
		System.out.println("c:" +clist);
		
		String page = "";
		
		if(b != null){
			page = "/views/board/boardDetail.jsp";
			request.setAttribute("board", b);
			request.setAttribute("clist", clist);
			
		} else{
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "추천 실패!");
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
