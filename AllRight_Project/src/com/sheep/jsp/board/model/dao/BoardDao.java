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

import com.sheep.jsp.announcement.model.vo.Announcement;
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

		ArrayList<Board> blist = null;
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
			
			blist = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
			/*	b.setbId(rset.getInt("bid"));
				b.setbNO(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbContent(rset.getString("bcontent"));
				b.setbWriter(rset.getString("userName"));
				b.setbCount(rset.getInt("bcount"));
				b.setbFile(rset.getString("bfile"));
				b.setbDate(rset.getDate("bdate"));
				b.seteCount(rset.getInt("ecount"));
				b.setReport(rset.getInt("report"));
				b.setbLike(rset.getInt("blike"));
				b.setUserNo(rset.getInt("userNo"));*/
				
				b.setbNO(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbWriter(rset.getString("userName"));
				b.setbCount(rset.getInt("bcount"));
				b.setbDate(rset.getDate("bdate"));
				b.setUserNo(rset.getInt("userNo"));
				
				blist.add(b);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return blist;
	
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
			pstmt.setInt(4, b.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public Board selectOne(Connection con, int bno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				
				b.setbNO(rset.getInt(2));
				b.setbTitle(rset.getString(3));
				b.setbContent(rset.getString(4));
				b.setbWriter(rset.getString(5));
				b.setbCount(rset.getInt(6));
				/*b.setbFile(rset.getString(7));*/
				b.setbDate(rset.getDate(8));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
		
	}

	public int updateCount(Connection con, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection con, int bno) {
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBoard");
		
		System.out.println("삭제 dao");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection con, Board b) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoard");
		
		System.out.println("업데이트dao오나료");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, b.getbNO());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Announcement> selectList2(Connection con) {
		
		ArrayList<Announcement> select2ANN = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("select2ANN");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			select2ANN = new ArrayList<Announcement>();
			
			while(rset.next()){
				
				Announcement a = new Announcement();
				
				a.setAtitle(rset.getString("atitle"));
				a.setAcount(rset.getInt("acount"));
				a.setAdate(rset.getDate("adate"));
				a.setAno(rset.getInt("ano"));
				
				select2ANN.add(a);
			}
						
		} catch ( SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		
		return select2ANN;
	}

	public ArrayList<Board> top5(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String sql = prop.getProperty("selectTop5");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				
				Board b = new Board();
				
				b.setbId(rset.getInt("BID"));
				b.setbNO(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbWriter(rset.getString("BWRITER"));
				b.seteCount(rset.getInt("ECOUNT"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int boardReport(Connection con, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardReport");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public int boardLike(Connection con, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardLike");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

}
