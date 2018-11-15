package com.sheep.jsp.point.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.sheep.jsp.point.model.vo.Point;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.sun.org.glassfish.external.statistics.annotations.Reset;

import static com.sheep.jsp.common.JDBCTemplate.*;

public class PointDao {
	
	
	private Properties prop;
	
	public PointDao(){
		
		prop = new Properties();
		
		String filePath = PointDao.class.getResource("/config/point-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	public int insertMember(Connection con, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;

		System.out.println("dao userNo :"+userNo);
		String pointSql = prop.getProperty("insertPoint");
		
		try {
			pstmt = con.prepareStatement(pointSql);

			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		
		
		return result;
	}

	public Point selectPoint(Connection con, int userNo) {

		Point result = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPoint");
		
		
		try {
			
			result = new Point();
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result.setUserNo(userNo);
				result.setPoint(Integer.parseInt(rset.getString("point")));
				result.setTotalPoint(Integer.parseInt(rset.getString("totalpoint")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int addPoint(Connection con, Point pt) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("addPoint");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,pt.getPoint());
			pstmt.setInt(2, pt.getTotalPoint());
			pstmt.setInt(3,pt.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		return result;
	}
	
	public int minusPoint(Connection con, Point pt){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("minusPoint");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pt.getPoint());
			pstmt.setInt(2, pt.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

}
