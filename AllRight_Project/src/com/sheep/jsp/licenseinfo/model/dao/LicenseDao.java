package com.sheep.jsp.licenseinfo.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} finally {
			
			close(pstmt);
		}
		
		
		return result;
	}

}
