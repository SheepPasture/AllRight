package com.sheep.jsp.boardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.boardComment.model.service.BoardCommentService;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/insertComment.bo")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String cContent = request.getParameter("replyContent");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		int cLevel = Integer.parseInt(request.getParameter("clevel"));
		
		BoardComment bco = new BoardComment();
		bco.setbId(bid);
		bco.setbNo(bno);
		bco.setUserNo(userNo);
		bco.setcContent(cContent);
		bco.setcLevel(cLevel);
		bco.setUserId(userName);
		
		System.out.println("bno : "+bno);
		
		int result = new BoardCommentService().insertComment(bco);
		
		if(result > 0){
			response.sendRedirect(request.getContextPath()+"/selectOne.bo?bid="+bid+"&bno="+bno);
			System.out.println("댓글 작성 성공!");
		} else {
			request.setAttribute("msg", "댓글 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
