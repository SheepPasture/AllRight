package com.sheep.jsp.news.model.dao;

import static com.sheep.jsp.common.allRightTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.news.model.vo.News;

public class NewsDao {
	
	private Properties prop = null;

	public NewsDao() {
		prop = new Properties();

		String filePath = NewsDao.class.getResource("/config/notice-query.properties").getPath();

		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}

	}

	public ArrayList<News> selectList(Connection con) {
		
		ArrayList<News> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try{
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<News>();
			
			while(rset.next()){
				News n = new News();
				
				n.setNNO(rset.getInt("nno"));
				n.setNTITLE(rset.getString("ntitle"));
				n.setNCONTENT(rset.getString("ncontent"));
				n.setNCOUNT(rset.getInt("ncount"));
				n.setNDATE(rset.getDate("ndate"));
				n.setNFILE(rset.getString("nfile"));
				
				list.add(n);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			
			close(rset);
			close(stmt);
		}
		return list;
	}

}
