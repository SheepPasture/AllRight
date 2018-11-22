package com.sheep.jsp.board.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.announcement.model.vo.Announcement;
import com.sheep.jsp.board.model.dao.BoardDao;
import com.sheep.jsp.board.model.vo.Board;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();

	public int getListCount(int bid) {

		Connection con = getConnection();
		
		int listCount = bDao.getListCount(con, bid);
		
		System.out.println("BoardService listCount: "+listCount);
		
		close(con);
		
		return listCount;
		
	}

	public int insertBoard(Board b, int bid) {

		Connection con = getConnection();
		
		int result = bDao.insertBoard(con, b, bid);
		
		System.out.println("insertBoard result: "+result);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public Board selectOne(int bid, int bno) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		Board b = bDao.selectOne(con, bid, bno);
		
		if(b!=null){
			result = bDao.updateCount(con, bid, bno);
			
			System.out.println("selectOne service: "+result);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
	}

	public int deleteBoard(int bid, int bno) {

		Connection con = getConnection();
		
		int result = bDao.deleteBoard(con, bid, bno);
		
		System.out.println("삭제 서비스");
		
		close(con);
		
		return result;
		
	}

	public int updateBoard(Board b, int bid) {

		Connection con = getConnection();
		
		int result = bDao.updateBoard(con, b, bid);
		
		System.out.println("updateBoard service: "+result);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Announcement> selectList(){

		ArrayList<Announcement> select2ANN = null;
		Connection con = getConnection();
		
		select2ANN = bDao.selectList(con);
		
		close(con);
		
		return select2ANN;
		
	}


	public Board boardReport(int bid, int bno) {

		Connection con = getConnection();
		int result = 0;
		
		Board b = bDao.selectOne(con, bid, bno);
		
		if(b!=null){
			result = bDao.boardReport(con, bid, bno);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
		
	}

	public Board boardLike(int bid, int bno) {

		Connection con = getConnection();
		int result = 0;
		
		Board b = bDao.selectOne(con, bid, bno);
		
		if(b!=null){
			result = bDao.boardLike(con, bid, bno);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
		
	}

	public ArrayList<Board> boardlistView(int currentPage, int limit) {

		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.boardlistView(con, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	public ArrayList<Board> selectList(int currentPage, int limit, int bid) {
		
		Connection con = getConnection();
		
		ArrayList<Board> blist = bDao.selectList(con, currentPage, limit, bid);
		
		close(con);
		
		return blist;
		
	}
	
	public ArrayList<Board> boardrecentView(int currentPage, int limit) {

	Connection con = getConnection();
		
		ArrayList<Board> list = bDao.boardrecentView(con, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	public ArrayList<Board> boardcomView() {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.boardcomView(con);
		
		close(con);
		
		return list;
		
	}

	public int getReportListCount() {
		
		Connection con = getConnection();
		
		int listCount = bDao.getReportListCount(con);
		
		close(con);
		return listCount;
	}

	public ArrayList<Board> selectReportList(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.selectReportList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public int boardLikeCount(int bid, int bno) {
		
		Connection con = getConnection();
		
		int boardLikeCount = bDao.boardLikeCount(con, bid, bno);
		
		System.out.println("BoardService boardLikeCount: "+boardLikeCount);
		
		close(con);
		
		return boardLikeCount;
		

	public int adminDeleteBoard(int bid, int bno) {
		Connection con = getConnection();
		
		int result = bDao.adminDeleteBoard(con, bid, bno);
		
		System.out.println("삭제 서비스");
		
		close(con);
		
		return result;

	}

}
