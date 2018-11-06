package com.sheep.jsp.licenseinfo.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.licenseinfo.model.dao.LicenseDao;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;

public class LicenseService {
	
	LicenseDao lDao = new LicenseDao();

	public int insertLicense(ArrayList<LicenseInfo> apiNo, ArrayList<LicenseInfo> apiName,
			ArrayList<LicenseInfo> apiCategory) {
		
		int result = 0;
		
		Connection con = getConnection();
		
		result = lDao.insertLicense(con, apiNo, apiName, apiCategory);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
