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
        	sql.append("SELECT ECOUNT FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 1");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop1Count = rs.getInt("ECOUNT");
				
			System.out.println("pop1Count: "+pop1Count);
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
        	sql.append("SELECT ECOUNT FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 2");
        
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
        	sql.append("SELECT ECOUNT FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 3");
        
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
        	sql.append("SELECT ECOUNT FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 4");
        
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
        	sql.append("SELECT ECOUNT FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 5");
        
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

	public String getpop1Board() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String pop1Board = null;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ETITLE FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 1");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop1Board = rs.getString("ETITLE");
				
				return pop1Board;
			
			
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

	public String getpop2Board() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String pop2Board = null;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ETITLE FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 2");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop2Board = rs.getString("ETITLE");
				
				return pop2Board;
			
			
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

	public String getpop3Board() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String pop3Board = null;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ETITLE FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 3");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop3Board = rs.getString("ETITLE");
				
				return pop3Board;
			
			
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

	public String getpop4Board() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String pop4Board = null;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ETITLE FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 4");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop4Board = rs.getString("ETITLE");
				
				return pop4Board;
			
			
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

	public String getpop5Board() {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String pop5Board = null;
        
        try {
        	StringBuffer sql = new StringBuffer();
        	sql.append("SELECT ETITLE FROM(SELECT ROWNUM RNUM, C.* FROM(SELECT * FROM CATEGORY ORDER BY ECOUNT DESC)C ) WHERE RNUM = 5");
        
        	conn = getConnection();
        
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				pop5Board = rs.getString("ETITLE");
				
				return pop5Board;
			
			
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
