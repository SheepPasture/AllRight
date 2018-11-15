package com.sheep.jsp.licenseinfo.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import static com.sheep.jsp.common.JDBCTemplate.*;

public class LicenseDao {
	
	private Properties prop;
	
	public LicenseDao(){
		
		prop = new Properties();
		
		String filePath = LicenseDao.class.getResource("/config/license-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int deleteLicense(Connection con) {
		
		int result = 0;
		
		Statement stmt = null;
		
		String sql = prop.getProperty("deleteLicense");
		
		try {
			
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
	
		} finally {
			
			close(stmt);
		}
		
		return result;
	}

	public int insertLicense(Connection con, ArrayList<LicenseInfo> getApi) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertLicense");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < getApi.size(); i++){
				
				pstmt.setString(1, getApi.get(i).getlNo());
				pstmt.setString(2, getApi.get(i).getlName());
				pstmt.setString(3, getApi.get(i).getlCategory());
				
				result = pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<LicenseInfo> selectLicense(Connection con) {
		
		ArrayList<LicenseInfo> list = null;
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLicense");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<LicenseInfo>();
			
			while(rset.next()){
				
				LicenseInfo l = new LicenseInfo();
				
				l.setlNo(rset.getString(1));
				l.setlName(rset.getString(2));
				l.addlInfo(rset.getString(3));
				l.addlInfo(rset.getString(4));
				l.addlInfo(rset.getString(5));
				l.setlDate(rset.getString(6));
				l.setlCategory(rset.getString(7));
				l.setlCost(rset.getString(8));
				
				list.add(l);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<LicenseInfo> updateLicense(Connection con, ArrayList<LicenseInfo> list) {
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateLicense");
		
		//UPDATE LICENSEINFO SET LINFO1 = ?, LINFO2 = ?, LINFO3 = ?, LCOST = ? WHERE LNO = ?
	
		try {
			
			pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i < list.size(); i++){
//				int j = 2;
//				int k = 2;
//				
//				for(; j < list.get(i).getlInfo().size(); j++){
//					pstmt.setString(1, list.get(i).getlInfo().get(j+1));
//					
//				}
				
				pstmt.setString(1, list.get(i).getlInfo().get(0));
				pstmt.setString(2, list.get(i).getlInfo().get(1));
				pstmt.setString(3, list.get(i).getlInfo().get(2));
				pstmt.setString(4, list.get(i).getlCost());
				pstmt.setString(5, list.get(i).getlNo());
				
//				System.out.println("==========="+list.get(i).getlName()+"=============\n"+list.get(i).getlInfo().get(0));
//				
//				System.out.println(list.get(i).getlInfo().get(1));
//				
//				System.out.println(list.get(i).getlInfo().get(2));
				
			
				pstmt.executeUpdate();
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			
			close(pstmt);
		}
		
		return list;
	}

}