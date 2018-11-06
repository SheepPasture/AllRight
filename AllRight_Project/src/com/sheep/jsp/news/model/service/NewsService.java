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


}
