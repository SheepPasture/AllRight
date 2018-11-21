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
	
	public int getListCount(Connection con, int bid) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			rset = pstmt.executeQuery();
			if(rset.next())listCount = rset.getInt(1);
			System.out.println("getListCount dao: "+listCount);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}

	public ArrayList<Board> selectList(Connection con, int currentPage, int limit, int bid) {

		ArrayList<Board> blist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			
			blist = new ArrayList<Board>();
			
			while(rset.next()){
				Board b = new Board();
				
				b.setbNO(rset.getInt("bno"));
				b.setbTitle(rset.getString("btitle"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("bcount"));
				b.setbDate(rset.getDate("bdate"));
				
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

	public int insertBoard(Connection con, Board b, int bid) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setString(4, b.getbWriter());
			pstmt.setInt(5, b.getUserNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println("insertBoard dao: "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public Board selectOne(Connection con,  int bid, int bno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				
				b.setbId(rset.getInt(1));
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

	public int updateCount(Connection con, int bid, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
			System.out.println("updateCount dao: "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection con, int bid, int bno) {
	
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteBoard");
		
		System.out.println("삭제 dao");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
			
			System.out.println("deleteBoard dao: "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection con, Board b, int bid) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateBoard");
		
		System.out.println("업데이트dao오나료");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setInt(3, bid);
			pstmt.setInt(4, b.getbNO());
			
			result = pstmt.executeUpdate();
			
			System.out.println("updateBoard dao: "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	public ArrayList<Announcement> selectList(Connection con) {
		
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

	public int boardReport(Connection con, int bid, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardReport");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public int boardLike(Connection con, int bid, int bno) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardLike");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bid);
			pstmt.setInt(2, bno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Board> boardlistView(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String sql = prop.getProperty("boardlistView");
		
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
				
				b.setbNO(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public ArrayList<Board> boardrecentView(Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String sql = prop.getProperty("boardrecentView");
		
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
				
				b.setbNO(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public ArrayList<Board> boardcomView(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String sql = prop.getProperty("boardcomView");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);			
			list = new ArrayList<Board>();
			
			while(rset.next()){
				
				Board b = new Board();
				
				b.setbNO(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				
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

}
