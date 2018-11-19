package com.sheep.jsp.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;



/**
 * Servlet implementation class NewsInsertServlet
 */
@WebServlet("/bInsert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String bwriter = request.getParameter("userName");
		int userNo = Integer.parseInt(request.getParameter("userNo"));

		Board b = new Board();
		
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("bwriter: " + bwriter);
		System.out.println("userNo: "+userNo);

		b.setbTitle(title);
		b.setbContent(content);
		b.setbWriter(bwriter);
		b.setUserNo(userNo);
		
		int result = new BoardService().insertBoard(b);
		
		System.out.println("결과: " + result);
		
		if(result > 0){
			response.sendRedirect("selectList.bo");
		} else{
			request.setAttribute("msg", "게시물 작성 실패");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
