package com.sheep.jsp.popBoard.dao;

import static com.sheep.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class popBoardCountDao {

	private static popBoardCountDao instance;
	
	private popBoardCountDao(){ }
	
	public static popBoardCountDao getInstance() {
		
		if(instance == null) instance = new popBoardCountDao();
		return instance;
	}

	public int getPop1Count() {
		
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pop1Count = 0;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ECOUNT FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC) WHERE ROWNUM = 1");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop1Count = rs.getInt("ECOUNT");
				
				return pop1Count;
			
			
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
        
	}

	public int getPop2Count() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pop2Count = 0;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ECOUNT FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC) WHERE ROWNUM = 2");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop2Count = rs.getInt("ECOUNT");
				
				return pop2Count;
			
			
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}

	public int getPop3Count() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pop3Count = 0;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ECOUNT FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC) WHERE ROWNUM = 3");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop3Count = rs.getInt("ECOUNT");
				
				return pop3Count;
			
			
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}

	public int getPop4Count() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pop4Count = 0;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ECOUNT FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC) WHERE ROWNUM = 4");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop4Count = rs.getInt("ECOUNT");
				
				return pop4Count;
			
			
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}

	public int getPop5Count() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int pop5Count = 0;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ECOUNT FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC) WHERE ROWNUM = 5");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop5Count = rs.getInt("ECOUNT");
				
				return pop5Count;
			
			
		} catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
	}

}
