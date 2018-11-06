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
		
		close(con);
		
		return list;
	}
	
	public Announcement selectOne(int ano){
		
		Connection con = getConnection();
		
		int result = 0;
		
		Announcement a = aDao.selectOne(con, ano);
		
		if( a!=null){
			result = aDao.updateCount(con, ano);
			
			if(result>0) commit(con);
			else rollback(con);
		}
		close(con);
		
		return a;
	}

}
