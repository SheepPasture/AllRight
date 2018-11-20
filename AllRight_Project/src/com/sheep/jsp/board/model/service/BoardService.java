package com.sheep.jsp.board.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.announcement.model.dao.ANNDao;
import com.sheep.jsp.announcement.model.vo.Announcement;
import com.sheep.jsp.board.model.dao.BoardDao;
import com.sheep.jsp.board.model.vo.Board;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();

	public int getListCount() {

		Connection con = getConnection();
		
		int listCount = bDao.getListCount(con);
		
		close(con);
		
		return listCount;
		
	}

	public int insertBoard(Board b) {

		Connection con = getConnection();
		
		int result = bDao.insertBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public Board selectOne(int bno) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		Board b = bDao.selectOne(con, bno);
		
		if(b!=null){
			result = bDao.updateCount(con, bno);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
	}

	public int deleteBoard(int bno) {

		Connection con = getConnection();
		
		int result = bDao.deleteBoard(con, bno);
		
		System.out.println("삭제 서비스");
		
		close(con);
		
		return result;
		
	}

	public int updateBoard(Board b) {

		Connection con = getConnection();
		
		int result = bDao.updateBoard(con, b);
		
		System.out.println("업데이트서비스완료");
		
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

	public ArrayList<Board> top5() {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.top5(con);
		
		close(con);
		
		return list;
	}

	public Board boardReport(int bno) {

		Connection con = getConnection();
		int result = 0;
		
		Board b = bDao.selectOne(con, bno);
		
		if(b!=null){
			result = bDao.boardReport(con, bno);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
		
	}

	public Board boardLike(int bno) {

		Connection con = getConnection();
		int result = 0;
		
		Board b = bDao.selectOne(con, bno);
		
		if(b!=null){
			result = bDao.boardLike(con, bno);
			
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

}
