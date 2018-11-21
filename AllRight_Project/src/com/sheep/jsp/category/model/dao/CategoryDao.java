package com.sheep.jsp.category.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.category.model.vo.Category;

public class CategoryDao {
	
	private Properties prop = null;
	
	public CategoryDao(){
		
		prop = new Properties();
		
		String filePath = CategoryDao.class.getResource("/config/category-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	public ArrayList<Category> top5(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Category> clist = null;
		
		String sql = prop.getProperty("selectTop5");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			clist = new ArrayList<Category>();
			
			while(rset.next()){
				
				Category c = new Category();
				
				c.setEid(rset.getInt("EID"));
				c.setEtitle(rset.getString("ETITLE"));
				c.setEcount(rset.getInt("ECOUNT"));
				
				clist.add(c);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		return clist;
	}

}
