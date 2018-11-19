package com.sheep.jsp.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.myPage.model.service.MypageService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import com.sheep.jsp.member.model.vo.Member;

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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		int userno = m.getUserNo();
		
		
		System.out.println(userno);
		//게시판 및 댓글
		ArrayList<Board> blist = new ArrayList<Board>();
		ArrayList<BoardComment> clist= new ArrayList<BoardComment>();
		
		MypageService ms = new MypageService();
		
		//페이지
		int listCount = ms.selectbPage(userno);
		int startPage=1;
		int endPage;	
		int maxPage;	
		int currentPage=1;
		int limit=5;      
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("전체 게시글 수 : "+ listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1 ) * limit + 1;
		
		endPage = startPage + limit -1; 
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		System.out.println("userno = "+userno);
		System.out.println("listCount = "+listCount);
		blist = ms.selectMyList(userno,currentPage, limit);
		clist = ms.selectMyCommnetList(userno);
		
		String page="/views/myPage/viewBoard.jsp";
		System.out.println(blist);
		
		if(blist.size()!=0){
			request.setAttribute("blist", blist);
			request.setAttribute("listCount", listCount);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("currentPage", currentPage);
			
	
		}else{
			request.setAttribute("bmsg", "작성한 게시글이 없습니다.");
			
		}
		
		if(clist.size()!=0){
			request.setAttribute("clist", clist);
	
		}else{
			request.setAttribute("cmsg", "작성한 댓글이 없습니다.");
			
		}
		System.out.println("blist = " + blist);
		System.out.println("clist = " + clist);
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
