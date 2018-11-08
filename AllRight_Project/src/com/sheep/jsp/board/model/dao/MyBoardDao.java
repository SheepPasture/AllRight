package com.sheep.jsp.board.model.dao;

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


public class MyBoardDao {
	private Properties prop = null;
	
	public MyBoardDao(){
		prop = new Properties();
		
		String filePath = MyBoardDao.class
				.getResource("/config/member/member-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
	}
	public ArrayList<Board> selectList(Connection con, int userno) {
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

}
