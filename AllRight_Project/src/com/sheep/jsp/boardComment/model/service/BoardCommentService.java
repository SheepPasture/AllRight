package com.sheep.jsp.boardComment.model.service;

import com.sheep.jsp.boardComment.model.dao.BoardCommentDao;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class BoardCommentService {

	private BoardCommentDao bcDao = new BoardCommentDao();
	
	public ArrayList<BoardComment> selectList(int bno){

		Connection con = getConnection();
		
		ArrayList<BoardComment> clist = bcDao.selectList(con, bno);
		
		close(con);
		
		return clist;
		
	}
	
	public int insertComment(BoardComment bco) {
		
		Connection con = getConnection();
		
		int result = bcDao.insertComment(con, bco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public BoardComment selectOne(int cno) {
		Connection con = getConnection();
		
		BoardComment bco = bcDao.selectOne(con, cno);
		
		close(con);
		
		return bco;
	}

	/*	public int updateComment(BoardComment bco) {
		Connection con = getConnection();
		
		int result = bcDao.updateComment(con, bco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int deleteComment(int cno) {
		Connection con = getConnection();
		
		int result = bcDao.deleteComment(con, cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}*/

}
