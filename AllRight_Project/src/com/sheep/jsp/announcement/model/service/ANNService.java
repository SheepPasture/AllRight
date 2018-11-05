package com.sheep.jsp.announcement.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.announcement.model.dao.ANNDao;
import com.sheep.jsp.announcement.model.vo.Announcement;

import static com.sheep.jsp.common.JDBCTemplate.*;

public class ANNService {
	
	private ANNDao aDao = new ANNDao();

	public ArrayList<Announcement> selectList() {
		
		ArrayList<Announcement> list = null;
		
		Connection con = getConnection();
		
		list = aDao.selectList(con);
		System.out.println(list);
		
		close(con);
		
		return list;
	}

}
