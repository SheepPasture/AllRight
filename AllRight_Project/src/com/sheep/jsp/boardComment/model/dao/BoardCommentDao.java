package com.sheep.jsp.boardComment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.boardComment.model.vo.BoardComment;

import static com.sheep.jsp.common.JDBCTemplate.*;

public class BoardCommentDao {
	
	private Properties prop = new Properties();
	
	public BoardCommentDao(){
		
		String filePath = BoardCommentDao.class.getResource("/config/comment-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
	}

	public int insertComment(Connection con, BoardComment bco) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		System.out.println(bco);
		try {
		
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bco.getUserId());
			pstmt.setString(2, bco.getcContent());
			pstmt.setDate(3, bco.getcDate());
/*			pstmt.setInt(4, bco.getUserNo());
			pstmt.setInt(5, bco.getcLevel());*/
			
/*			if(bco.getRefcno() > 0) {
				
				pstmt.setInt(4, bco.getRefcno());
				
			} else {
				
				pstmt.setNull(4, java.sql.Types.NULL);
			}
			pstmt.setInt(5, bco.getcLevel());*/
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);	
		}
		
		return result;
	}

	public ArrayList<BoardComment> selectList(Connection con, int bno) {
		ArrayList<BoardComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<BoardComment>();
			
			while(rset.next()) {
				BoardComment comment = new BoardComment();
	
				comment.setUserId(rset.getString("userid"));
				comment.setcContent(rset.getString("ccontent"));
				comment.setcDate(rset.getDate("cdate"));
				
				clist.add(comment);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}
	

	public BoardComment selectOne(Connection con, int cno) {
		BoardComment bco = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				bco = new BoardComment();

				bco.setUserId(rset.getString("userid"));
				bco.setcContent(rset.getString("ccontent"));
				bco.setcDate(rset.getDate("cdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bco;
	}

/*	public int updateComment(Connection con, BoardComment bco) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bco.getCcontent());
			pstmt.setInt(2, bco.getCno());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	/*
	public int deleteComment(Connection con, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}*/
}
