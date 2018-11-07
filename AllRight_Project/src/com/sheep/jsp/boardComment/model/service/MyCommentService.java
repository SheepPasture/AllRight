package com.sheep.jsp.boardComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.boardComment.model.dao.MyCommentDao;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import static com.sheep.jsp.common.JDBCTemplate.*;
public class MyCommentService {
	private MyCommentDao cDao = new MyCommentDao();
	
	public ArrayList<BoardComment> selectMyCommnetList(){
		ArrayList<BoardComment> list = null;
		Connection con = getConnection();
		list = cDao.selectList(con);
		
		close(con);
		
		return list;
	}

}
