package com.sheep.jsp.member.model.service;

import static com.sheep.jsp.common.JDBCTemplate.close;
import static com.sheep.jsp.common.JDBCTemplate.commit;
import static com.sheep.jsp.common.JDBCTemplate.getConnection;
import static com.sheep.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;

import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.member.exception.MemberException;
import com.sheep.jsp.member.model.dao.MemberDao;
import com.sheep.jsp.member.model.vo.Member;
import com.sheep.jsp.userLicense.model.vo.UserLicense;

public class MemberService {

	private MemberDao mDao = new MemberDao();

	public int insertMember(Member m,String[] lNo) throws MemberException {

		Connection con = getConnection();

		int result = mDao.insertMember(con, m);
		int userNo = mDao.selectUserNo(con, m.getUserId());
		
		/*UserLicense u =new UserLicense();
		u.setUserNo(userNo);
		u.setlNo(lNo[0]);*/
		mDao.insertUserLicense(con, userNo,lNo);
		
		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}

	public Member selectMember(Member m) throws MemberException {

		Connection con = getConnection();

		Member result = mDao.selectMember(con, m);

		if (result == null)
			throw new MemberException("회원정보가 없습니다.");

		close(con);

		return result;
	}

	public int addFinalDate(Member m) {

		Connection con = getConnection();

		int result = mDao.addFinalDate(con, m);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	public int updateMember(Member m,String[] lNo) throws Exception {
		Connection con = getConnection();
		int result = mDao.updateMember(con, m);
		mDao.updateUserLicense(con, m.getUserNo(),lNo);
		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}

	public int deleteMember(String userId) {
		Connection con = getConnection();
		int result = mDao.deleteMember(con, userId);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}

	public int checkDate(int userNo) {

		Connection con = getConnection();

		int result = mDao.checkDate(con, userNo);

		close(con);

		return result;

	}

	// 비밀번호 일치 여부
	public int confirmPassword(Member m) /* throws MemberException */ {
		Connection con = getConnection();

		int result = mDao.confirmPassword(con, m);
		/* if(result == null) throw new MemberException("비밀번호가 일치하지않습니다."); */

		close(con);

		return result;

	}

	public int updateUserLicense(String beforeLNo, UserLicense u) {
		System.out.println("55번");
		Connection con = getConnection();

		int result = mDao.updateUserLicense(con, beforeLNo, u);
		close(con);
		System.out.println("55555555555555번");
		return result;
	}

	// 회원가입 자격증 추가
/*	public int insertUserLicense(UserLicense u) throws MemberException{
		Connection con = getConnection();

		int result = mDao.insertUserLicense(con, u);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}*/

	public int getMemberCount() {
		Connection con = getConnection();
		
		int memberCount = mDao.getMemberCount(con);
		
		close(con);
		
		return memberCount;
	}
	public ArrayList<Member> selectAll() {
		Connection con = getConnection();
		ArrayList<Member> result = new ArrayList<Member>();
		result =mDao.selectAllMember(con);

		return result;
	}

}
