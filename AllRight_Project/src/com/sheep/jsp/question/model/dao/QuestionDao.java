package com.sheep.jsp.question.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.sheep.jsp.common.JDBCTemplate.*;
import com.sheep.jsp.question.model.vo.Question;


public class QuestionDao {
	private Properties prop = new Properties();

	
	public QuestionDao(){
		prop = new Properties();
	
	String filePath = QuestionDao.class.getResource("/config/question-query.properties").getPath();
	
	try {
		
		prop.load(new FileReader(filePath));
		
	} catch (IOException e) {
		e.printStackTrace();
		
	}
	
}
	
	public ArrayList<Question> selectList(Connection con) {
		
		ArrayList<Question> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			list = new ArrayList<Question>();
			
			while(rset.next()){
				Question qs = new Question();
				qs.settNo(rset.getInt("tno"));
				qs.setqNo(rset.getInt("qno"));
				qs.setqContent(rset.getString("qcontent"));
				qs.setqPre(rset.getString("qpre"));
				qs.setqAnswer(rset.getInt("qanswer"));
				
				list.add(qs);
				
				System.out.println("qs 확인");
			}
			
		} catch (SQLException e){
			e.printStackTrace();
			
			System.out.println("?");
		
		} finally {
		
			close(rset);
			close(stmt);
		}
		return list;
	}

	


}
