package com.sheep.jsp.member.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.userLicense.model.vo.UserLicense;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class MemberDao {

	private Properties prop;

	public MemberDao() {

		prop = new Properties();

		String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, Member m) throws MemberException {

		int result = 0;

		PreparedStatement pstmt = null;

		String Sql = prop.getProperty("insertMember");

		try {
			pstmt = con.prepareStatement(Sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getEmail());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member selectMember(Connection con, Member m) {

		Member result = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = new Member();

				result.setUserNo(rset.getInt("userno"));
				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserName(rset.getString("username"));
				result.setEmail(rset.getString("email"));
				result.setUserLeave(rset.getString("userleave"));
				result.setUserDate(rset.getDate("userdate"));
				result.setFinalDate(rset.getDate("finaldate"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int updateMember(Connection con, Member m) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("updateMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int selectUserNo(Connection con, String userId) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserId");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next())
				result = Integer.parseInt(rset.getString("userno"));

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int deleteMember(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	/*
	 * public int selectUserNo(Connection con, String userId){
	 * 
	 * int result = 0; PreparedStatement pstmt = null; ResultSet rset = null;
	 * String sql = prop.getProperty("selectUserId");
	 * 
	 * try { pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setString(1, userId);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * if(rset.next()) result = Integer.parseInt(rset.getString("userno"));
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally{ close(pstmt);
	 * }
	 * 
	 * 
	 * return result;
	 * 
	 * }
	 */

	public int addFinalDate(Connection con, Member m) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("addFinalDate");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, m.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int checkDate(Connection con, int userNo) {

		int result = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("checkDate");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			if (rset.next())
				result = rset.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	// 비밀번호 일치 여부
	public int confirmPassword(Connection con, Member m) {

		/* Member result = null; */
		int result = 0;
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("confirmPassword");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = 1;
				/*
				 * result = new Member();
				 * 
				 * result.setUserNo(Integer.parseInt(rset.getString("userno")));
				 * result.setUserId(m.getUserId());
				 * result.setUserPwd(m.getUserPwd());
				 * result.setUserName(rset.getString("username"));
				 * result.setEmail(rset.getString("email"));
				 * result.setUserLeave(rset.getString("userleave"));
				 * result.setUserDate(rset.getDate("userdate"));
				 * result.setFinalDate(rset.getDate("finaldate"));
				 * 
				 */ }

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 유저 관심자격증 수정
	public int updateUserLicense(Connection con, String bLNo, UserLicense u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserlicense");
	
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u.getlNo());
			pstmt.setInt(2, u.getUserNo());
			pstmt.setString(3, bLNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 회원가입시 관심자격증 추가
	public int insertUserLicense(Connection con,int userNo, String[] lNo )  throws MemberException {
		int result = 0;

		PreparedStatement pstmt = null;

		String Sql = prop.getProperty("insertUserLicense");
		try {
			pstmt = con.prepareStatement(Sql);

			for(int i = 0; i<lNo.length;i++){
				if(lNo[i]!=null){
				pstmt.setInt(1,userNo);
				pstmt.setString(2, lNo[i]);
				
				result = pstmt.executeUpdate();
				}
			}
		} catch (SQLException e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateUserLicense(Connection con, int userNo, String[] lNo) throws Exception{
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteUserlicense");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,userNo);
			result = pstmt.executeUpdate();
			
			
			sql = prop.getProperty("insertUserLicense");
			pstmt = con.prepareStatement(sql);
			if(lNo.length==1){
				pstmt.setInt(1, userNo);
				pstmt.setString(2, lNo[0]);
			}else{
				
				for(int i=0; i <lNo.length; i++){
					pstmt.setInt(1,userNo);
					pstmt.setInt(2,Integer.parseInt(lNo[i]));
				}
				
			
			}
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(pstmt);
		}

		return result;
	
		
	}

	public int getMemberCount(Connection con) {
		Statement stmt = null;
		int memberCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("memberCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				memberCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		
		return memberCount;
	}

}
