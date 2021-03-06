package com.sheep.jsp.myPage.model.service;

import static com.sheep.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sheep.jsp.board.model.vo.Board;
import com.sheep.jsp.boardComment.model.vo.BoardComment;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;
import com.sheep.jsp.myPage.model.dao.MyPageDao;
import com.sheep.jsp.point.model.dao.PointDao;
import com.sheep.jsp.userLicense.model.vo.UserLicense;


public class MypageService {
	private MyPageDao mDao = new MyPageDao();

	//내 게시글 확인
	public ArrayList<Board> selectMyList(int userno,int currentPage, int limit) {
		
		ArrayList<Board> list = null;
		
		Connection con = getConnection();
		list = mDao.selectBList(con,userno,currentPage, limit);
		
		close(con);
		
		return list;
		
	}
	// 내 댓글 확인
	public ArrayList<BoardComment> selectMyCommnetList(int userno,int currentPage, int limit){
		
		ArrayList<BoardComment> list = null;
		Connection con = getConnection();
		list = mDao.selectCList(con,userno, currentPage,  limit);
		
		close(con);
		
		return list;
	}
	// 관심 자격증 정보
	public ArrayList<LicenseInfo> selectMySchedule(int userno) {
		
		ArrayList<LicenseInfo> list = null;
		Connection con = getConnection();
		list = mDao.selectLList(con,userno);
		
		close(con);
		return list;
	}
	public ArrayList<LicenseInfo> testSchdule(int userno) {
		ArrayList<LicenseInfo> list = null;
		Connection con = getConnection();
		list = mDao.testlist(con,userno);
		
		close(con);
		return list;
	}
	// 게시글 수
	public int selectbPage(int userno) {
		
		Connection con = getConnection();
		int result = mDao.selectbPage(con,userno);
		close(con);
		
		
		return result;
	}
	public int selectcPage(int userno) {
		Connection con = getConnection();
		int result = mDao.selectcPage(con,userno);
		close(con);
		
		
		return result;
	}
	
	
	
}
