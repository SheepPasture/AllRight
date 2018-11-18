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
 * Servlet implementation class CommentLikeServelt
 */
@WebServlet("/bcReport.bo")
public class CommentReportServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentReportServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cno = Integer.parseInt(request.getParameter("cno"));
		
		System.out.println("cno: " + cno);
		
		BoardComment bc = new BoardCommentService().BoardCommentReport(cno);
		
		System.out.println("bco: "+bc);
		
		String page = "";
		
		if(bc != null){
			page = "/views/board/boardDetail.jsp";
			request.setAttribute("BoardComment", bc);
			
		} else{
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 신고 실패!");
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
