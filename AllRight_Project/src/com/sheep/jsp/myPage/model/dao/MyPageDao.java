package com.sheep.jsp.myPage.model.dao;

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
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.userLicense.model.vo.UserLicense;


public class MyPageDao {
	private Properties prop = null;
	
	public MyPageDao(){
		prop = new Properties();
		
		String filePath = MyPageDao.class
				.getResource("/config/member-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	// 내 게시글 확인
	public ArrayList<Board> selectBList(Connection con, int userno) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,userno);
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
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	// 내 댓글 확인
	public ArrayList<BoardComment> selectCList(Connection con, int userno) {
		ArrayList<BoardComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectComment");

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset=pstmt.executeQuery();
			
			list = new ArrayList<BoardComment>();
		
			while(rset.next()){
			
				BoardComment bc = new BoardComment();
			
				bc.setbNo(rset.getInt("BNO"));
				bc.setbId(rset.getInt("BID"));
				bc.setcNo(rset.getInt("CNO"));
				bc.setcContent(rset.getString("CCONTENT"));
				bc.setcDate(rset.getDate("CDATE"));
				list.add(bc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		if(list==null)System.out.println("null"+list);
		
		return list;
	}
	
	// 관심 자격증 정보 확인
	public ArrayList<LicenseInfo> selectLList(Connection con, int userno) {
		ArrayList<LicenseInfo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectlInfo");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset=pstmt.executeQuery();
			
			list = new ArrayList<LicenseInfo>();
		
			while(rset.next()){
			
				LicenseInfo li = new LicenseInfo();
			
				li.setlName(rset.getString("LNAME"));
				li.setlDate(rset.getString("LDATE"));
				
				list.add(li);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
/*	// 관심자격증 번호
	public ArrayList<UserLicense> selectUserLicense(Connection con, int userno){
		ArrayList<UserLicense> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectUserLicense");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset=pstmt.executeQuery();
			
			list = new ArrayList<UserLicense>();
		
			while(rset.next()){
			
				UserLicense ul = new UserLicense();
			
				ul.setlNo(rset.getInt("USERNO"));
				ul.setUserNo(rset.getInt("LNO"));
				
				list.add(ul);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}
*/

}
