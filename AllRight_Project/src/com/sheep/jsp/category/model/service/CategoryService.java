package com.sheep.jsp.category.model.service;

import static com.sheep.jsp.common.JDBCTemplate.close;
import static com.sheep.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.category.model.dao.CategoryDao;
import com.sheep.jsp.category.model.vo.Category;

public class CategoryService {
	
	private CategoryDao cDao = new CategoryDao();

	public ArrayList<Category> top5() {
		
		Connection con = getConnection();
		
		ArrayList<Category> clist = cDao.top5(con);
		
		close(con);
		
		return clist;
	}

}
