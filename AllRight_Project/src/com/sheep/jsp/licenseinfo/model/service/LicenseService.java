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
		
		return result;
	}

	public ArrayList<LicenseInfo> selectLicense() {
		
		ArrayList<LicenseInfo> list = null;
		
		Connection con = getConnection();
		
		list = lDao.selectLicense(con);
		
		close(con);
		
		return list;
	}

	public int updateLicense(ArrayList<LicenseInfo> list) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		ParseApi pa = new ParseApi();
		
		result = lDao.updateLicense(con, pa.getCost(list), list);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	
	

}
