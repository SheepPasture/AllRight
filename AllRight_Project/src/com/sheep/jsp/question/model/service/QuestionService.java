package com.sheep.jsp.question.model.service;

import static com.sheep.jsp.common.JDBCTemplate.close;
import static com.sheep.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.question.model.dao.QuestionDao;
import com.sheep.jsp.question.model.vo.Question;

public class QuestionService {
	
	private QuestionDao qDao = new QuestionDao();
	
	public ArrayList<Question> selectList(){
		
		ArrayList<Question> list = null;
	
		Connection con = getConnection();
	
		list = qDao.selectList(con);
	
		close(con);
	
		return null;
	}
	

}
