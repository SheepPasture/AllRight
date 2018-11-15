package com.sheep.jsp.userPoint.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.myPage.model.dao.MyPageDao;
import com.sheep.jsp.userPoint.model.vo.UserPoint;

public class UserPointDao {
	private Properties prop = null;
	
	public UserPointDao(){
		prop = new Properties();
		
		String filePath = MyPageDao.class
				.getResource("/config/point-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	// 내 포인트 확인	
	public ArrayList<UserPoint> selectPList(Connection con, int userno) {
		ArrayList<UserPoint> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPoint");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset=pstmt.executeQuery();
			list = new ArrayList<UserPoint>();
			
			while(rset.next()){
				UserPoint u = new UserPoint();
				u.setPoint(rset.getInt("POINT"));
				u.setTotalPoint(rset.getInt("TOTALPOINT"));
				list.add(u);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
}
