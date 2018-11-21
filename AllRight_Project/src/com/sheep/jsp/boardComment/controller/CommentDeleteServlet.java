package com.sheep.jsp.boardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.boardComment.model.service.BoardCommentService;

/**
 * Servlet implementation class CommentDeleteServlet
 */
@WebServlet("/deleteComment.bo")
public class CommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("코멘드딜리트서블릿");
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new BoardCommentService().deleteComment(cno);
		
		if(result > 0) {
			response.sendRedirect("selectOne.bo?bid="+bid+"&bno="+bno);
			System.out.println("댓글 삭제 성공!");
		} else {
			request.setAttribute("msg", "댓글 삭제 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
