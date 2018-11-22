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

import com.sheep.jsp.announcement.model.vo.Announcement;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import static com.sheep.jsp.common.JDBCTemplate.*;

public class LicenseDao {

	private Properties prop;

	public LicenseDao() {

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
		
		String sql2 = "DELETE FROM LICENSEDATE";

		try {

			stmt = con.createStatement();

			result = stmt.executeUpdate(sql);
			
			stmt.executeUpdate(sql2);

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

			for (int i = 0; i < getApi.size(); i++) {

				pstmt.setString(1, getApi.get(i).getlNo());
				pstmt.setString(2, getApi.get(i).getlName());
				pstmt.setString(3, getApi.get(i).getlCategory());

				char type = getApi.get(i).getlNo().charAt(0);

				if (type == '0') {
					pstmt.setString(4, "0");
				} else if (type == '1' || type == '2') {
					pstmt.setString(4, "1");
				} else if (type == '3') {
					pstmt.setString(4, "3");
				} else if (type == '6' || type == '7') {
					pstmt.setString(4, "6");
				} else {
					pstmt.setString(4, "9");
				}

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

			while (rset.next()) {

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

	public int updateLicense(Connection con, ArrayList<LicenseInfo> list) {
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateLicense");

		try {

			pstmt = con.prepareStatement(sql);

			for (int i = 0; i < list.size(); i++) {
				
				pstmt.setString(1, list.get(i).getlInfo().get(0));
				pstmt.setString(2, list.get(i).getlInfo().get(1));
				pstmt.setString(3, list.get(i).getlInfo().get(2));
				pstmt.setString(4, list.get(i).getlCost());
				pstmt.setString(5, list.get(i).getlNo());

				result = pstmt.executeUpdate();

			}

		} catch (SQLException e) {
	
			e.printStackTrace();

		} finally {

			close(pstmt);
		}

		return result;
	}

	public int insertDate(Connection con, ArrayList<String> date) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertDate");

		StringBuilder sb1 = new StringBuilder(date.get(0));
		
		StringBuilder sb2 = new StringBuilder(date.get(33));
		
		StringBuilder sb3 = new StringBuilder(date.get(77));
		
		StringBuilder sb4 = new StringBuilder(date.get(99));

		for(int i = 1; i < 33; i++){
			sb1.append(date.get(i));
		}
		
		for(int i = 34; i < 77; i++){
			sb2.append(date.get(i));
		}
		
		for(int i = 78; i < 99; i++){
			sb3.append(date.get(i));
		}
		
		for(int i = 100; i < 203; i++){
			sb4.append(date.get(i));
		}



		try {

			pstmt = con.prepareStatement(sql);

			for(int i = 0; i < 4; i++){
				
				if(i == 0){
					pstmt.setString(1, "0");
					pstmt.setString(2, sb1.toString());	
				} else if (i == 1){
					pstmt.setString(1, "1");
					pstmt.setString(2, sb2.toString());
				} else if (i == 2){
					pstmt.setString(1, "3");
					pstmt.setString(2, sb3.toString());
				} else {
					pstmt.setString(1, "6");
					pstmt.setString(2, sb4.toString());
				}
					
				result = pstmt.executeUpdate();
			}

			



		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(pstmt);
		}

		return result;

	}

	public ArrayList<LicenseInfo> selectLicenseInfo(Connection con) {
		ArrayList<LicenseInfo> list = null;

		Statement stmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("selectLicense");

		try {

			stmt = con.createStatement();

			rset = stmt.executeQuery(sql);

			list = new ArrayList<LicenseInfo>();

			while (rset.next()) {

				LicenseInfo l = new LicenseInfo();

				l.setlNo(rset.getString(1));
				l.setlName(rset.getString(2));
				l.addlInfo(rset.getString(3));
				l.addlInfo(rset.getString(4));
				l.addlInfo(rset.getString(5));
				l.setlCategory(rset.getString(6));
				l.setlCost(rset.getString(7));
				l.setlType(rset.getString(8));

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

	public ArrayList<LicenseInfo> selectMyLicenseInfo(Connection con, int userNo) {
	
		ArrayList<LicenseInfo> list = null;

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;

		String sql = prop.getProperty("selectMyLicense");

		try {

			pstmt=con.prepareStatement(sql);

			pstmt.setInt(1,userNo);

	
			rset = pstmt.executeQuery();
			list = new ArrayList<LicenseInfo>();

			while (rset.next()) {

				LicenseInfo l = new LicenseInfo();

				l.setlNo(rset.getString(1));
				l.setlCategory(rset.getString(2));
				l.setlName(rset.getString(3));

				list.add(l);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<LicenseInfo> selectMainList(Connection con) {
		
		ArrayList<LicenseInfo> llist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMainList");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			llist = new ArrayList<LicenseInfo>();
			
			while(rset.next()){
				LicenseInfo li = new LicenseInfo();
				
				li.setlName(rset.getString("lname"));
				li.setlCategory(rset.getString("lcategory"));
				
				llist.add(li);		
				
				System.out.println("selectMainList llist: "+llist);

			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return llist;
		
	}

	public int getLicenseCount(Connection con) {
		Statement stmt = null;
		int licenseCount = 0;
		ResultSet rset = null;
		
		String sql = prop.getProperty("licenseCount");
		
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				licenseCount = rset.getInt(1);
			}
			
			System.out.println("membercount:" + licenseCount);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally{
			close(rset);
			close(stmt);
		}
		
		
		return licenseCount;
	}

	public LicenseInfo selectOne(Connection con, int lno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LicenseInfo lf = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, lno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				lf = new LicenseInfo();
				
				lf.setlNo(rset.getString(1));
				lf.setlName(rset.getString(2));
				lf.setnInfo01(rset.getString(3));
				lf.setNlnfo02(rset.getString(4));
				lf.setNlnfo03(rset.getString(5));
				lf.setlCategory(rset.getString(6));
				lf.setlCost(rset.getString(7));
				lf.setlType(rset.getString(8));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return lf;
		
	}

}