package com.sheep.jsp.board.model.dao;

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

import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.news.model.dao.NewsDao;

public class BoardDao {

	private Properties prop = null;
	
	public BoardDao(){
		
		prop = new Properties();
		
		String filePath = BoardDao.class.getResource("/config/board-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
			
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
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

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit) {

		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setbId(rset.getInt("bid"));
				b.setbNO(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("bwriter"));
				b.setbCount(rset.getInt("bcount"));
				b.setbFile(rset.getString("bfile"));
				b.setbDate(rset.getDate("bdate"));
				b.seteCount(rset.getInt("ecount"));
				b.setReport(rset.getInt("report"));
				b.setbLike(rset.getInt("blike"));
				b.setUserNo(rset.getInt("userNo"));
				
				list.add(b);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}

	public int insertBoard(Connection con, Board b) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

}
