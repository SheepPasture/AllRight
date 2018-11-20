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
		int blistCount = ms.selectbPage(userno);
		int clistCount = ms.selectcPage(userno);
		int bstartPage=1,cstartPage=1;
		int bendPage,cendPage;	
		int bmaxPage,cmaxPage;	
		int bcurrentPage=1,ccurrentPage=1;
		int limit=5;      
		
		bcurrentPage = 1;
		ccurrentPage = 1;
		
		if(request.getParameter("bcurrentPage") != null){
			bcurrentPage = Integer.parseInt(request.getParameter("bcurrentPage"));
		}
		System.out.println("전체 게시글 수 : "+ blistCount);
		
		bmaxPage = (int)((double)blistCount / limit + 0.9);
		bstartPage = ((int)((double)bcurrentPage / limit + 0.9) - 1 ) * limit + 1;
		
		bendPage = bstartPage + limit -1; 
		
		if(bendPage > bmaxPage){
			bendPage = bmaxPage;
		}
		
		if(request.getParameter("ccurrentPage") != null){
			ccurrentPage = Integer.parseInt(request.getParameter("ccurrentPage"));
		}
		System.out.println("전체 게시글 수 : "+ clistCount);
		
		cmaxPage = (int)((double)clistCount / limit + 0.9);
		cstartPage = ((int)((double)ccurrentPage / limit + 0.9) - 1 ) * limit + 1;
		
		cendPage = cstartPage + limit -1; 
		
		if(cendPage > cmaxPage){
			cendPage = cmaxPage;
		}
		
		/*System.out.println("userno = "+userno);
		System.out.println("listCount = "+listCount);*/
		blist = ms.selectMyList(userno,bcurrentPage, limit);
		clist = ms.selectMyCommnetList(userno,ccurrentPage,limit);
		
		String page="/views/myPage/viewBoard.jsp";
		System.out.println(blist);
		
		if(blist.size()!=0){
			request.setAttribute("blist", blist);
			request.setAttribute("listCount", blistCount);
			request.setAttribute("startPage", bstartPage);
			request.setAttribute("endPage", bendPage);
			request.setAttribute("maxPage", bmaxPage);
			request.setAttribute("currentPage", bcurrentPage);
			
	
		}else{
			request.setAttribute("bmsg", "작성한 게시글이 없습니다.");
			request.setAttribute("listCount", 1);
			request.setAttribute("startPage", 1);
			request.setAttribute("endPage", 1);
			request.setAttribute("maxPage", 1);
			request.setAttribute("currentPage", 1);
		}
		
		if(clist.size()!=0){
			request.setAttribute("clist", clist);
			request.setAttribute("clistCount", clistCount);
			request.setAttribute("cstartPage", cstartPage);
			request.setAttribute("cendPage", cendPage);
			request.setAttribute("cmaxPage", cmaxPage);
			request.setAttribute("ccurrentPage", ccurrentPage);
	
		}else{
			request.setAttribute("cmsg", "작성한 댓글이 없습니다.");
			request.setAttribute("clistCount", 1);
			request.setAttribute("cstartPage", 1);
			request.setAttribute("cendPage", 1);
			request.setAttribute("cmaxPage", 1);
			request.setAttribute("ccurrentPage", 1);
			
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
