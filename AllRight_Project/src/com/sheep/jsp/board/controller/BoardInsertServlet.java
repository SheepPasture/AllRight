package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.point.model.service.PointService;
import com.sheep.jsp.point.model.vo.Point;



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
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String androidCheck = request.getParameter("android");
		
		PrintWriter out = response.getWriter();
		
		
		String bwriter=null;
		int userNo=0;
		
		HttpSession session = request.getSession(false);
		// 세션이 살아있는경우 (홈페이지에서 로그인)
		if (session != null) {
			Member member = (Member)session.getAttribute("member");
			
			bwriter = member.getUserName();
			userNo = member.getUserNo();
			
		// 안드로이드 접속의 경우
		} else if(androidCheck != null){
			System.out.println("안드로이드로 글쓰기를 시도합니다.");
			bwriter = request.getParameter("bwriter");
			userNo = Integer.parseInt(request.getParameter("userno"));
			
		}
		
		System.out.println("bid: " + bid);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("bwriter: " + bwriter);
		System.out.println("userNo: "+userNo);

		Board b = new Board();

		b.setbTitle(title);
		b.setbContent(content);
		b.setbWriter(bwriter);
		b.setUserNo(userNo);
		
		int result = new BoardService().insertBoard(b, bid);
		
		System.out.println("결과: " + result);
		
		if(result > 0){
			
			
			if(androidCheck != null){
				System.out.println("안드로이드 글쓰기 성공");
				out.println("success");
				out.close();
			}
			else{
				Point pt = new Point();
				PointService ps = new PointService();
				pt = ps.selectPoint(userNo);
				pt.setPoint(pt.getPoint() + 5);
				pt.setTotalPoint(pt.getTotalPoint() + 5);
				ps.addPoint(pt);
				session.setAttribute("point", pt);
				response.sendRedirect("selectList.bo?bid="+bid);
			}
		} else{
			request.setAttribute("msg", "게시물 작성 실패");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			if(androidCheck != null){
				System.out.println("안드로이드 글 쓰기 실패");
				out.println("fail");
				out.close();
			}
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
