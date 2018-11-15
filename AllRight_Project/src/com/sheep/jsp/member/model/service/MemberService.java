package com.sheep.jsp.member.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;

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

		
		if(result == null) throw new MemberException("회원정보가 없습니다.");
		
		
		close(con);
		
		return result;
	}
	
	public int addFinalDate(Member m){
		
		Connection con = getConnection();
		
		int result = mDao.addFinalDate(con,m);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection con = getConnection();
		int result =mDao.updateMember(con,m);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
		
	}

	public int deleteMember(String userId) {
		Connection con = getConnection();
		int result =mDao.deleteMember(con,userId);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	public int checkDate(int userNo){
		
		Connection con = getConnection();
		
		int result = mDao.checkDate(con,userNo);
		
		close(con);
		
		return result;
		
	}

}
