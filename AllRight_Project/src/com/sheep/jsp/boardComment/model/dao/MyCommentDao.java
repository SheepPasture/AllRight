package com.sheep.jsp.boardComment.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sheep.jsp.board.model.dao.MyBoardDao;
import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;

public class MyCommentDao {
	private Properties prop = null;
	
	public MyCommentDao(){
		prop = new Properties();
		
		String filePath = MyBoardDao.class
				.getResource("/config/member-query.properties").getPath();
		
		try {
		
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		
	}
	
	
	public ArrayList<BoardComment> selectList(Connection con, int userno) {
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

}
