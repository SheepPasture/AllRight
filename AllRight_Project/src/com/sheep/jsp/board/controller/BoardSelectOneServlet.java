package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.service.BoardCommentService;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class BoardSelectOneServlet
 */
@WebServlet("/selectOne.bo")
public class BoardSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOneServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String androidCheck = request.getParameter("android");
		
		PrintWriter out = response.getWriter();
		
		Board b = new BoardService().selectOne(bid, bno);
		ArrayList<BoardComment> clist = new BoardCommentService().selectList(bno);
		
		System.out.println("selectOne b: "+b);
		System.out.println("selectOne clist: "+clist);
		
		String page = "";
		
		if(b != null){
			page = "/views/board/boardDetail.jsp";
			request.setAttribute("board", b);
			request.setAttribute("clist", clist);
			
			if(androidCheck !=null){
				System.out.println("안드로이드에서 게시물에 접근합니다.");
				JSONObject boardOne = new JSONObject();
				boardOne.put("btitle", b.getbTitle());
				boardOne.put("bcontent", b.getbContent());
				boardOne.put("bwriter", b.getbWriter());
				
				out.println(boardOne.toJSONString());
				System.out.println("게시물 전송 성공");
				out.close();
			}
			
		} else{
			if(androidCheck !=null){
				out.println("fail");
				System.out.println("안드로이드에 보내기 실패");
				out.close();
			}
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시물 상세보기 실패!");
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
