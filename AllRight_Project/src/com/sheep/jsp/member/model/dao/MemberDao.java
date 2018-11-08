package com.sheep.jsp.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.vo.Member;

import static com.sheep.jsp.common.JDBCTemplate.*;

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

	public int insertDao(Connection con, Member m) throws MemberException {

		int result = 0;
		
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			con.prepareStatement(sql);
			
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

}
