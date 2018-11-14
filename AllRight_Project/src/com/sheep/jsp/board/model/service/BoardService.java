package com.sheep.jsp.board.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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

	public ArrayList<Board> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	public int insertBoard(Board b) {

		Connection con = getConnection();
		
		int result = bDao.insertBoard(con, b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

}
