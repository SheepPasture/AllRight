package com.sheep.jsp.news.model.service;

import java.util.ArrayList;

import com.sheep.jsp.news.model.dao.NewsDao;
import com.sheep.jsp.news.model.vo.News;

public class NewsService {

	private NewsDao dao = new NewsDao();
	
	public ArrayList<News> selectList(){
		
		ArrayList<News> list = null;
		
		return list;
		
	}
}
