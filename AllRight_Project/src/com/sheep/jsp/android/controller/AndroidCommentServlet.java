package com.sheep.jsp.android.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.boardComment.model.service.BoardCommentService;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

/**
 * Servlet implementation class AndroidCommentServlet
 */
@WebServlet("/aComment.and")
public class AndroidCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AndroidCommentServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));

		ArrayList<BoardComment> clist = new BoardCommentService().selectList(bno);

		PrintWriter out = response.getWriter();

		// if(androidCheck != null){
		// System.out.println("안드로이드에서 접근합니다");
		// JSONArray arrBoard = new JSONArray();
		// for(int i=0;i<blist.size();i++){
		//
		// JSONObject jsonBoard = new JSONObject();
		//
		// jsonBoard.put("bno", blist.get(i).getbNO());
		// jsonBoard.put("btitle",blist.get(i).getbTitle());
		// jsonBoard.put("bwriter",blist.get(i).getbWriter());
		// jsonBoard.put("bcount",blist.get(i).getbCount());
		// jsonBoard.put("bdate",blist.get(i).getbDate());
		//
		// arrBoard.add(jsonBoard);
		// }
		//
		// System.out.println(arrBoard.get(0));
		// out.println(arrBoard.toJSONString());
		//// out.println("fail");
		// out.close();

		// comment.setcNo(rset.getInt("cno"));
		// comment.setbNo(bno);
		// comment.setUserNo(rset.getInt("userNo"));
		// comment.setcPwd(rset.getInt("cPwd"));
		// comment.setcContent(rset.getString("ccontent"));
		// comment.setcDate(rset.getDate("cdate"));
		// comment.setcLevel(rset.getInt("clevel"));
		// comment.setReport(rset.getInt("report"));
		// comment.setNickname(rset.getString("nickname"));
		// comment.setUserId(rset.getString("userId"));
		// comment.setRefcno(rset.getInt("refcno"));

		System.out.println("안드로이드에서 댓글에 접근합니다.");
		JSONArray arrComment = new JSONArray();
		if (clist != null) {
			for (int i = 0; i < clist.size(); i++) {

				JSONObject jsonComment = new JSONObject();

				jsonComment.put("cno", clist.get(i).getcNo());
				jsonComment.put("bno", clist.get(i).getbNo());
				jsonComment.put("userno", clist.get(i).getUserId());
				jsonComment.put("cpwd", clist.get(i).getcPwd());
				jsonComment.put("ccontent", clist.get(i).getcContent());
				jsonComment.put("cdate", clist.get(i).getcDate());
				jsonComment.put("clevel", clist.get(i).getcLevel());
				jsonComment.put("report", clist.get(i).getReport());
				jsonComment.put("nickname", clist.get(i).getNickname());
				jsonComment.put("userid", clist.get(i).getUserId());
				jsonComment.put("refcno", clist.get(i).getRefcno());

				arrComment.add(jsonComment);

			}
			out.println(arrComment.toJSONString());
			System.out.println("안드로이드에서 댓글 보내기 종료");
			out.close();
		} else{
			System.out.println("댓글이 읍서요");
			out.println("fail");
			out.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
