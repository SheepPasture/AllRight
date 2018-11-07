package com.sheep.jsp.userAnswer.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.userAnswer.model.dao.AnswerDao;
import com.sheep.jsp.userAnswer.model.vo.UserAnswer;

public class AnswerService {
	
	private AnswerDao aDao = new AnswerDao();
	
	public ArrayList<UserAnswer> selectList(){
		
		ArrayList<UserAnswer> list =  null;
		Connection con = getConnetion();
		
		list = aDao.selectList(con);
		
		return list;
		
	}

	private Connection getConnetion() {
		// TODO Auto-generated method stub
		return null;
	}

}
