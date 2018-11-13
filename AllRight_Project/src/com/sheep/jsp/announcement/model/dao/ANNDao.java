package com.sheep.jsp.announcement.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.announcement.model.vo.Announcement;

public class ANNDao {

	private Properties prop = new Properties();
	
	public ANNDao(){
		
		String filePath = ANNDao.class.getResource("/config/ANN-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Announcement> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Announcement> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1, 마지막 행 번호
			// 2, 첫 행 번호
			
			int startRow = (currentPage -1) * limit + 1; // 1 -> 1, 2 -> 11
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Announcement>();
			
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
			close(pstmt);
		}

		return list;
	}

	public Announcement selectOne(Connection con, int ano) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Announcement a = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ano);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				a = new Announcement();
				
				a.setAno(rset.getInt(1));
				a.setAtitle(rset.getString(2));
				a.setAcount(rset.getInt(3));
				a.setAcontent(rset.getString(4));
				a.setAdate(rset.getDate(5));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return a;
		
	}

	public int updateCount(Connection con, int ano) {
		
		PreparedStatement pstmt = null;
		int result = 0;
	
		String sql = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateANN(Connection con, Announcement a) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateANN");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
/*			pstmt.setString(1, a.getAtitle());
			pstmt.setString(2, a.getAcontent());*/
			pstmt.setInt(3, a.getAno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {	
			close(pstmt);
		}
		System.out.println(a.getAtitle() + ", " + a.getAcontent() + ", " + a.getAno());
		System.out.println("resut dao:"+result);
		
		return result;
		
	}

	public int deleteNews(Connection con, int ano) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteANN");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ano);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public int insertANN(Connection con, Announcement a) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertANN");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, a.getAtitle());
			pstmt.setString(2, a.getAcontent());
			
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
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

}
