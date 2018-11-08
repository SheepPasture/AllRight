package com.sheep.jsp.board.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.board.model.dao.MyBoardDao;

public class MypageService {
	private MyBoardDao bDao = new MyBoardDao();


	public ArrayList<Board> selectMyList(int userno) {
		
		ArrayList<Board> list = null;
		
		Connection con = getConnection();
		list = bDao.selectList(con,userno);
		
		close(con);
		
		return list;
		
	}
		
}
