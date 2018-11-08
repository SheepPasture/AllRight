package com.sheep.jsp.licenseinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.common.util.ParseApi;
import com.sheep.jsp.licenseinfo.model.dao.LicenseDao;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import static com.sheep.jsp.common.JDBCTemplate.*;

public class LicenseService {
	
	LicenseDao lDao = new LicenseDao();

	public int insertLicense(ArrayList<LicenseInfo> getApi) {
		
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = lDao.insertLicense(con, getApi);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		updateCost();
		
		return result;
	}
	
	public void updateCost(){
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = lDao.updateCost(con);
		
		if(result > 0) {
			
			System.out.println("업데이트 성공!");
			commit(con);
			
		} else {
			
			System.out.println("업데이트 실패!");
			rollback(con);
		}
		
		close(con);
		
	}
	
	

}
