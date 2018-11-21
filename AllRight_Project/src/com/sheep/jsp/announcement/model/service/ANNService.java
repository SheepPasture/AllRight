package com.sheep.jsp.announcement.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.announcement.model.dao.ANNDao;
import com.sheep.jsp.announcement.model.vo.Announcement;


public class ANNService {
	
	private ANNDao aDao = new ANNDao();
	
	public int getListCount() {

		Connection con = getConnection();
		
		int listCount = aDao.getListCount(con);
		
		close(con);
		
		return listCount;
		
	}

	public ArrayList<Announcement> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();

		ArrayList<Announcement> list = aDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}
	
	public Announcement selectOne(int ano){
		
		Connection con = getConnection();
		
		int result = 0;
		
		Announcement a = aDao.selectOne(con, ano);
		
		System.out.println("ano" +ano);
		System.err.println("con" + con);
		
		if(a!=null){
			result = aDao.updateCount(con, ano);

			if(result>0) commit(con);
			else rollback(con);

		}

		close(con);
		
		return a;

	}

	public Announcement updateView(int ano) {

		Connection con = getConnection();
		
		Announcement a = aDao.selectOne(con, ano);
		
		close(con);
		
		return a;
		
	}

	public int updateANN(Announcement a) {

		System.out.println("업데이트서비스");
		
		Connection con = getConnection();
		
		int result = aDao.updateANN(con, a);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int deleteANN(int ano) {

		Connection con = getConnection();
		
		int result = aDao.deleteNews(con, ano);
		
		close(con);
		
		return result;
		
	}

	public int insertANN(Announcement a) {

		Connection con = getConnection();
		
		int result = aDao.insertANN(con, a);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int beforeANN(int ano) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		result = aDao.beforeANN(con, ano);
		
		close(con);
		
		return result;
		
	}

	public int afterANN(int ano) {

		Connection con = getConnection();
		
		int flist = 0;
		
		flist = aDao.afterANN(con, ano);
		
		close(con);
		
		return flist;
		
	}

}
