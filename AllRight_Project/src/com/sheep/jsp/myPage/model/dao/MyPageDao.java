package com.sheep.jsp.myPage.model.dao;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public ArrayList<Board> selectBList(Connection con, int userno,  int currentPage, int limit) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectBoard");
		
		try {
			pstmt=con.prepareStatement(sql);
			
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1,userno);

			pstmt.setInt(2,userno);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			System.out.println("dao - userno " + userno + " :" + endRow+":"+startRow );
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			System.out.println(userno);
			while(rset.next()){
				/*System.out.println(userno+"sdasd");*/
				Board b = new Board();
				b.setbNO(rset.getInt("BNO"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
			list.add(b);
			/*System.out.println(b);
			System.out.println("55555");
			System.out.println(list);*/
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
	public ArrayList<BoardComment> selectCList(Connection con, int userno, int currentPage, int limit) {
		ArrayList<BoardComment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectComment");

		try {
			pstmt=con.prepareStatement(sql);
			int startRow = (currentPage -1) * limit + 1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1,userno);
			pstmt.setInt(2,userno);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			
			rset = pstmt.executeQuery();
			
			
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
		String sql = prop.getProperty("myLdate");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset=pstmt.executeQuery();
			
			list = new ArrayList<LicenseInfo>();
		
			while(rset.next()){
			
				LicenseInfo li = new LicenseInfo();
			
				li.setlName(rset.getString("LNAME"));
				li.setlDate(rset.getString("LDATE"));
				li.setlCategory(rset.getString("LCATEGORY"));
				li.setlType(rset.getString("LTYPE"));
				
				/*long minus=0;
				Date today = new Date(); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String first = sdf.format(today);
				String last= rset.getString("LDATE");
				
				try {
					Date firstDate = sdf.parse(first);
					Date lastDate = sdf.parse(last);
					minus = (firstDate.getTime()-lastDate.getTime())/(24*60*60*1000);
					li.setdDay(String.valueOf(minus));
				} catch (ParseException e) {
					
					e.printStackTrace();
				}*/
				
				
				
				/*long minus=0;
				for(int i =0; i<list.size();i++){
					String last = list.get(i).getlDate();
					try {
						Date firstDate = sdf.parse(first);
						Date lastDate = sdf.parse(last);
						
						minus = (firstDate.getTime()-lastDate.getTime())/(24*60*60*1000);
						dayArr.add(minus);
						System.out.println(minus);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
				}
				
				li.setdDay(dDay);*/
				
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
	public ArrayList<LicenseInfo> testlist(Connection con, int userno) {
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
	public int selectbPage(Connection con, int userno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectBPage");
		
	
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, userno);
				rset=pstmt.executeQuery();
				while(rset.next()){
					result = rset.getInt(1);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
		
		return result;
	}
	public int selectcPage(Connection con, int userno) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("selectCPage");
		
	
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, userno);
				rset=pstmt.executeQuery();
				while(rset.next()){
					result = rset.getInt(1);
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
		
		return result;
	}
	
	


}
