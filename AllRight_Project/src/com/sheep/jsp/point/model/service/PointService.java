package com.sheep.jsp.point.model.service;

import static com.sheep.jsp.common.JDBCTemplate.close;
import static com.sheep.jsp.common.JDBCTemplate.commit;
import static com.sheep.jsp.common.JDBCTemplate.getConnection;
import static com.sheep.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.sheep.jsp.member.model.dao.MemberDao;
import com.sheep.jsp.point.model.dao.PointDao;
import com.sheep.jsp.point.model.vo.Point;

public class PointService {

	PointDao pDao = new PointDao();

	public int insertPoint(String userId) {

		Connection con = getConnection();
		
		MemberDao mDao = new MemberDao();
		
		
		System.out.println("유저아이디 : "+userId);
		
		int userNo = mDao.selectUserNo(con, userId);
		
		System.out.println("유저번호(서비스) : "+userNo);
		
		int result = pDao.insertMember(con,userNo);
		
		if(result>0) commit(con);
		else rollback(con);		
		
		close(con);
		
		return result;
		
		
	}
	
	public Point selectPoint(int userNo){
		
		Connection con = getConnection();

		Point result = pDao.selectPoint(con,userNo);
		
		close(con);
		
		return result;
	}
	
	
	
}
