package com.sheep.jsp.userAnswer.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.userAnswer.model.vo.UserAnswer;

public class AnswerDao {
	
	private Properties prop = null;
	
	public AnswerDao(){
		prop = new Properties();	
		
		String filePath = AnswerDao.class.getResource("/config/answer-query.properties").getPath();
		
		try{
			
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
	public ArrayList<UserAnswer> selectList(Connection con) {
		
		ArrayList<UserAnswer> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<UserAnswer>();
			
			while(rset.next()){
				UserAnswer ua = new UserAnswer();
				ua.settNo(rset.getInt("tno"));
				ua.setUserNo(rset.getInt("userno"));
				ua.setqNo(rset.getInt("qno"));
				ua.setUserAnswer(rset.getInt("useranswer"));
				ua.setaCheck(rset.getString("acheck"));
				
				list.add(ua);
				
				System.out.println("ua");
	
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			
			System.out.println("예외 발생");
		} finally {
			
			close(rset);
			close(stmt);
		}
		return list;
	}

}
