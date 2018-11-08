package com.sheep.jsp.boardComment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.boardComment.model.service.MyCommentService;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class CommentMyListServlet
 */
@WebServlet("/CommentMyListServlet")
public class CommentMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentMyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BoardComment> list = new ArrayList<BoardComment>();
		
		MyCommentService mcs= new MyCommentService();
		list = mcs.selectMyCommnetList();
		String page = "";
		page = "/views/myPage/viewBoard.jsp";
		request.setAttribute("listComment", list);
		/*if(list !=null){
			page = "/views/myPage/viewBoard.jsp";
			request.setAttribute("listComment", list);
		}else{
			System.out.println("boardComment Error");
		}*/
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
