package com.sheep.jsp.member.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;

import com.sheep.jsp.member.model.dao.MemberDao;
import com.sheep.jsp.member.model.vo.Member;

public class MemberService {
	
	
	private MemberDao mDao = new MemberDao();

	public int insertMember(Member m) {

		
		
		Connection con = getConnection();
		
		int result = mDao.insertDao(con,m);
		
		if(result>0) commit(con);
		else rollback(con);		
		
		close(con);
		
		return result;
		
	}

}
