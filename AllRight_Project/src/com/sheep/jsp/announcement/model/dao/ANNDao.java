package com.sheep.jsp.announcement.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.announcement.model.vo.Announcement;

public class ANNDao {

	private Properties prop = null;
	
	public ANNDao(){
		
		System.out.println("dao");
		
		prop = new Properties();
		
		String filePath = ANNDao.class.getResource("/config/ANN-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Announcement> selectList(Connection con) {
		
		System.out.println("selectList");
		
		ArrayList<Announcement> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Announcement>();
			
			System.out.println("Sel");
			
			while(rset.next()){
				Announcement a = new Announcement();
				
				a.setAno(rset.getInt("ano"));
				a.setAtitle(rset.getString("atitle"));
				a.setAcount(rset.getInt("acount"));
				a.setAdate(rset.getDate("adate"));
				
				list.add(a);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("annDAo");
		
		return list;
	}

}
