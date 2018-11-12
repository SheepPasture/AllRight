package com.sheep.jsp.member.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

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
		
		return result;
		
	}

	public Member selectMember(Member m) throws MemberException {
		
		Connection con = getConnection();
		
		Member result = mDao.selectMember(con,m);

		System.out.println("보낸 값 : "+ m);
		
		
		if(result == null) throw new MemberException("회원정보가 없습니다.");
		
		System.out.println("받아온 값 : "+result);
		
		close(con);
		
		return result;
	}

}
