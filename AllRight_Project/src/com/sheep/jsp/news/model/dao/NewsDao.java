package com.sheep.jsp.news.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

		String filePath = NewsDao.class.getResource("/config/news-query.properties").getPath();

		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}

	}

	public ArrayList<News> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<News> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try{
			
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<News>();
			
			while(rset.next()){
				News n = new News();
				
				n.setNNO(rset.getInt("nno"));
				n.setNTITLE(rset.getString("ntitle"));
				n.setNCOUNT(rset.getInt("ncount"));
				n.setNDATE(rset.getDate("ndate"));
				n.setNFILE(rset.getString("nfile"));
				
				list.add(n);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public News selectOne(Connection con, int nno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		News n = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				n = new News();
				
				n.setNNO(rset.getInt("NNO"));
				n.setNTITLE(rset.getString("NTITLE"));
				n.setNCONTENT(rset.getString(3));
				n.setNCOUNT(rset.getInt(4));
				n.setNDATE(rset.getDate(5));
				n.setNFILE(rset.getString(6));
			}
			
			System.out.println("news 한개 : " + n);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int updateCount(Connection con, int nno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCount");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}

	public int insertNews(Connection con, News n) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertNews");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getNTITLE());
			pstmt.setString(2, n.getNCONTENT());
			pstmt.setString(3, n.getNFILE());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int deleteNews(Connection con, int nno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteNews");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, nno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateNews(Connection con, News n) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateNews");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, n.getNTITLE());
			pstmt.setString(2, n.getNCONTENT());
			pstmt.setString(3, n.getNFILE());
			pstmt.setInt(4, n.getNNO());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		
		return listCount;
	}

	public ArrayList<News> selectList(Connection con) {
		
		ArrayList<News> poplist = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPopList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			poplist = new ArrayList<News>();
			
			while(rset.next()){
				
				News n = new News();
				
				n.setNNO(rset.getInt("nno"));
				n.setNTITLE(rset.getString("ntitle"));
				n.setNCOUNT(rset.getInt("ncount"));
				n.setNDATE(rset.getDate("ndate"));
				n.setNFILE(rset.getString("nfile"));
				
				poplist.add(n);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return poplist;
	}

	public ArrayList<News> selectFirstList(Connection con) {
		
		ArrayList<News> firstlist = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFirstList");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			firstlist = new ArrayList<News>();
			
			while(rset.next()){
				
				News n = new News();
				
				n.setNNO(rset.getInt("nno"));
				n.setNTITLE(rset.getString("ntitle"));
				n.setNCOUNT(rset.getInt("ncount"));
				n.setNDATE(rset.getDate("ndate"));
				n.setNFILE(rset.getString("nfile"));
				
				firstlist.add(n);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return firstlist;
	}

}
