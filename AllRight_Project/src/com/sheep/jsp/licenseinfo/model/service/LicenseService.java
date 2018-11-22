package com.sheep.jsp.licenseinfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.announcement.model.vo.Announcement;
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

	public int updateInfoData(ArrayList<LicenseInfo> list) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = lDao.updateLicense(con, pa.getInfoList(list));
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int insertDate(ArrayList<String> date) {
		
		int result = 0;
		Connection con = getConnection();
		
		result = lDao.insertDate(con, date);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<LicenseInfo> selectLicenseInfo() {
		
		ArrayList<LicenseInfo> list = null;
		
		Connection con = getConnection();
		
		list = lDao.selectLicenseInfo(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<LicenseInfo> selectMyLicenseInfo(int userNo) {
		ArrayList<LicenseInfo> list = null;
		
		Connection con = getConnection();
		
		list = lDao.selectMyLicenseInfo(con,userNo);
		
		close(con);
		
		return list;
	}

	public ArrayList<LicenseInfo> selectMainLicense() {
		
		Connection con = getConnection();

		ArrayList<LicenseInfo> llist = lDao.selectMainList(con);
		
		close(con);
		
		System.out.println("selectMainList service: "+llist);
		
		return llist;
		
	}

}
