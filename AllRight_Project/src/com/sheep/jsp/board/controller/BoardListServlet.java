package com.sheep.jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.announcement.model.vo.Announcement;
import com.sheep.jsp.board.model.service.BoardService;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.board.model.vo.bPageInfo;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/selectList.bo")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bid = Integer.parseInt(request.getParameter("bid"));
		System.out.println("List bid: "+bid);
		
		ArrayList<Board> blist = new ArrayList<Board>();
		ArrayList<Announcement> select2ANN = new ArrayList<Announcement>();
		String androidCheck = request.getParameter("android");
		
		BoardService bs = new BoardService();
		
		PrintWriter out = response.getWriter();
		
		// -- 페이징 처리 (데이터를 일정량 끊어서 가져오는 기술) -- //
		int startPage; 
		int endPage;	
		int maxPage;	
		int currentPage;
		int limit;
		
		currentPage = 1;
		
		limit = 10; 
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 게시글 수 조회하기
		int listCount = bs.getListCount(bid);
		
		System.out.println("전체 게시글 수 : "+ listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9) - 1 ) * limit + 1;
		
		endPage = startPage + limit -1; 
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
		blist = bs.selectList(currentPage, limit, bid);
		select2ANN = bs.selectList();
		
		bs.seteCount(bid);
		
		String page = "";
		
		if(blist != null){
			
			bPageInfo bpi = new bPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			page="/views/board/boardList.jsp";
			request.setAttribute("bpi", bpi);
			request.setAttribute("blist", blist);
			request.setAttribute("select2ANN", select2ANN);
			// 안드로이드 전송값
			if(androidCheck != null){
				System.out.println("안드로이드에서 접근합니다");
				JSONArray arrBoard = new JSONArray();
				for(int i=0;i<blist.size();i++){
					
					JSONObject jsonBoard = new JSONObject();

					jsonBoard.put("bno", blist.get(i).getbNO());
					jsonBoard.put("btitle",blist.get(i).getbTitle());
					jsonBoard.put("bwriter",blist.get(i).getbWriter());
					jsonBoard.put("bcount",blist.get(i).getbCount());
					jsonBoard.put("bdate",blist.get(i).getbDate());
					
					arrBoard.add(jsonBoard);
				}
				
				System.out.println(arrBoard.get(0));
				out.println(arrBoard.toJSONString());
//				out.println("fail");
				out.close();
			}
			
		} else {
			if(androidCheck != null){
				out.close();
			}else{
				page = "/views/common/errorPage.jsp";
				request.setAttribute("msg", "게시판 조회에 실패했습니다. 관리자에게 문의해주세요.");

			}
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
