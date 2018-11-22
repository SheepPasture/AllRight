package com.sheep.jsp.popBoard.controller;

import javax.servlet.http.HttpSession;

import com.sheep.jsp.popBoard.dao.popBoardCountDao;

public class popBoardListener {
	
	popBoardCountDao dao = popBoardCountDao.getInstance();
	
	
		int pop1Count = dao.getPop1Count();
		int pop2Count = dao.getPop2Count();
		int pop3Count = dao.getPop3Count();
		int pop4Count = dao.getPop4Count();
		int pop5Count = dao.getPop5Count();
		
		//HttpSession session = request.getSession();
		
	
}


