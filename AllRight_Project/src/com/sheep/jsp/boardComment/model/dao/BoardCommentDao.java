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

			pstmt.setInt(1, bco.getbNo());
			pstmt.setInt(2, bco.getUserNo());
			pstmt.setString(3, bco.getcContent());
			pstmt.setInt(4, bco.getcLevel());
			pstmt.setString(5, bco.getUserId());
/*			pstmt.setInt(6, bco.getRefcno());*/

			if(bco.getRefcno() > 0) {
				
				pstmt.setInt(6, bco.getRefcno());
				
			} else {
				
				pstmt.setNull(6, java.sql.Types.NULL);
			}
			
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
			
			System.out.println("보드코멘드dao: "+clist);
			
			while(rset.next()) {
				BoardComment comment = new BoardComment();
	
				comment.setcNo(rset.getInt("cno"));
				comment.setbNo(bno);
				comment.setUserNo(rset.getInt("userNo"));
				comment.setcPwd(rset.getInt("cPwd"));
				comment.setcContent(rset.getString("ccontent"));
				comment.setcDate(rset.getDate("cdate"));
				comment.setcLevel(rset.getInt("clevel"));
				comment.setReport(rset.getInt("report"));
				comment.setNickname(rset.getString("nickname"));
				comment.setUserId(rset.getString("userId"));
				comment.setRefcno(rset.getInt("refcno"));
				
				clist.add(comment);
				System.out.println("보드코멘트dao list완료");
				
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

				bco.setcNo(cno);
				bco.setUserId(rset.getString("userId"));
				bco.setbNo(rset.getInt("bno"));
				bco.setcContent(rset.getString("ccontent"));
				bco.setcDate(rset.getDate("cdate"));
				bco.setRefcno(rset.getInt("refcno"));
				bco.setcLevel(rset.getInt("clevel"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bco;
	}

	public int updateComment(Connection con, BoardComment bco) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bco.getcContent());
			pstmt.setInt(2, bco.getcNo());
			
			result = pstmt.executeUpdate();
		
			System.out.println("result: "+result);
			System.out.println("보드코멘트dao업데이트");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		return result;
	}

	
	public int deleteComment(Connection con, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteComment");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int boardCommentReport(Connection con, int cno) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("boardCommentReport");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}
}
