package com.sheep.jsp.userAnswer.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.userAnswer.model.dao.AnswerDao;
import com.sheep.jsp.userAnswer.model.vo.UserAnswer;

public class AnswerService {
	
	private AnswerDao aDao = new AnswerDao();

	public ArrayList<UserAnswer> selectList() {
		// 기출문제 리스트
		
		ArrayList<UserAnswer> list = null;
		
		Connection con = getConnection();
		
		list = aDao.selectList(con);
		
		close(con);
		
		return null;
	}

}
