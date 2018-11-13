package com.sheep.jsp.licenseinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.common.util.ParseApi;
import com.sheep.jsp.licenseinfo.model.dao.LicenseDao;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import static com.sheep.jsp.common.JDBCTemplate.*;

public class LicenseService {
	
	LicenseDao lDao = new LicenseDao();
	
	ParseApi pa = new ParseApi();
	
	public void deleteLicense() {
		
		Connection con = getConnection();
		
		int result = lDao.deleteLicense(con);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
	}

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

	public ArrayList<LicenseInfo> updateCost(ArrayList<LicenseInfo> list) {
		
		return pa.getCost(list);
	}

	public ArrayList<LicenseInfo> updateInfoData(ArrayList<LicenseInfo> list) {
		
		Connection con = getConnection();
		
		list = lDao.updateLicense(con, pa.getInfoList(list));
		
		close(con);
		
		return list;
		
	}
	
//	public ArrayList<LicenseInfo> updateLicense(ArrayList<LicenseInfo> list) {
//		
//		Connection con = getConnection();
//		
//		ParseApi pa = new ParseApi();
//		
//		list = lDao.updateLicense(con, pa.getCost(list));
//		
//		close(con);
//		
//		return list;
//	}
}
