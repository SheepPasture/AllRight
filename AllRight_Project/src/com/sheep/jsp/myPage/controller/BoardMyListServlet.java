package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class BoardMyListServlet
 */
@WebServlet("/bMyList.bo")
public class BoardMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*int userno = Integer.parseInt(request.getParameter("USERNO"));*/
		int userno=3;
		ArrayList<Board> blist = new ArrayList<Board>();
		ArrayList<BoardComment> clist= new ArrayList<BoardComment>();
		
		MypageService ms = new MypageService();
		

		blist = ms.selectMyList(userno);
		clist = ms.selectMyCommnetList(userno);
		
		String page="/views/myPage/viewBoard.jsp";

		
		if(blist.size()!=0){
			request.setAttribute("blist", blist);
	
		}else{
			request.setAttribute("bmsg", "작성한 게시글이 없습니다.");
			
		}
		
		if(clist.size()!=0){
			request.setAttribute("clist", clist);
	
		}else{
			request.setAttribute("cmsg", "작성한 댓글이 없습니다.");
			
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
