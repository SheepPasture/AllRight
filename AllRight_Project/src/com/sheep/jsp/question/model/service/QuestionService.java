package com.sheep.jsp.question.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;
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
		
		if(list != null){ commit(con);
		rollback(con);
			
		}
		close(con);
	
		return list;
	}
	
	public ArrayList<Question> answer(){
		
		ArrayList<Question> check = null;
		
		Connection con = getConnection();
		
		check = QuestionDao.answer(con);
		
		if(check != null){ commit(con);
		rollback(con);
		
		}
		close(con);
		
		return check;
		
	}

}
