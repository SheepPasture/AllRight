package com.sheep.jsp.news.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.news.model.dao.NewsDao;
import com.sheep.jsp.news.model.vo.News;

public class NewsService {

	private NewsDao nDao = new NewsDao();
	
	public ArrayList<News> selectList(){
		
		ArrayList<News> list = null;
		
		Connection con = getConnection();
		
		list = nDao.selectList(con);
		
		close(con);
		
		return list;
		
	}

	public News selectOne(int nno) {
		
		//뉴스 상세 보기 조회시
		
		Connection con = getConnection();
		
		int result = 0;
		
		News n = nDao.selectOne(con, nno);
		
		if(n != null){
			result = nDao.updateCount(con, nno);
			
			if(result > 0 ) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return n;
	}

	public int insertNews(News n) {
		
		Connection con = getConnection();
		
		int result = nDao.insertNews(con, n);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


}
