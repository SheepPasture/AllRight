package com.sheep.jsp.member.model.service;

import static com.sheep.jsp.common.JDBCTemplate.close;
import static com.sheep.jsp.common.JDBCTemplate.commit;
import static com.sheep.jsp.common.JDBCTemplate.getConnection;
import static com.sheep.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.dao.MemberDao;
import com.sheep.jsp.member.model.vo.Member;

public class MemberService {
	
	
	private MemberDao mDao = new MemberDao();

	public int insertMember(Member m) throws MemberException {

		
		
		Connection con = getConnection();
		
		int result = mDao.insertMember(con,m);
		
		if(result>0) commit(con);
		else rollback(con);		
		
		close(con);
		System.out.println("");
		return result;
		
	}

}
