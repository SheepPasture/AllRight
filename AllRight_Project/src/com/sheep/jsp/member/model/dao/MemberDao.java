package com.sheep.jsp.member.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.vo.Member;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class MemberDao {
	
	private Properties prop;
	
	public MemberDao(){
		
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
		} finally{
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
			
			if(rset.next()){
				result = new Member();
				
				result.setUserNo(Integer.parseInt(rset.getString("userno")));
				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserName(rset.getString("username"));
				result.setEmail(rset.getString("email"));
				result.setUserLeave(rset.getString("userleave"));
				result.setUserDate(rset.getDate("userdate"));
				
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
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,m.getUserPwd());
			pstmt.setString(2,m.getUserName());
			pstmt.setString(3,m.getEmail());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectUserNo(Connection con, String userId){
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserId");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) result = Integer.parseInt(rset.getString("userno"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		return result;
		
	}

}
