package com.sheep.jsp.popBoard.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionIdListener;
import javax.servlet.http.HttpSessionListener;

import com.sheep.jsp.popBoard.dao.popBoardCountDao;

/**
 * Application Lifecycle Listener implementation class boardPopListener
 *
 */
@WebListener
public class boardPopListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		// TODO Auto-generated method stub
		
		// 세션이 새로 생성되면 execute() 실행한다.
        if(sessionEve.getSession().isNew()){
            execute(sessionEve);
        }
		
	}
	
	private void execute(HttpSessionEvent sessionEve){
		
		popBoardCountDao dao = popBoardCountDao.getInstance();
		
		try{
		
		String pop1Board = dao.getpop1Board();
		String pop2Board = dao.getpop2Board();
		String pop3Board = dao.getpop3Board();
		String pop4Board = dao.getpop4Board();
		String pop5Board = dao.getpop5Board();
		
		int pop1Count = dao.getPop1Count();
		int pop2Count = dao.getPop2Count();
		int pop3Count = dao.getPop3Count();
		int pop4Count = dao.getPop4Count();
		int pop5Count = dao.getPop5Count();
		
		
		System.out.println("인기 게시판 : " + pop1Count + " "+ pop2Count + " "+ pop3Count + " "+ pop4Count + " "+ pop5Count);
		HttpSession session = sessionEve.getSession();
		
		session.setAttribute("pop1Board", pop1Board);
		session.setAttribute("pop2Board", pop2Board);
		session.setAttribute("pop3Board", pop3Board);
		session.setAttribute("pop4Board", pop4Board);
		session.setAttribute("pop5Board", pop5Board);
		
		
		session.setAttribute("pop1Count", pop1Count);
		session.setAttribute("pop2Count", pop2Count);
		session.setAttribute("pop3Count", pop3Count);
		session.setAttribute("pop4Count", pop4Count);
		session.setAttribute("pop5Count", pop5Count);
		
		} catch (Exception e){
			System.out.println("===== 게시판 카운터 오류 =====\n");
            e.printStackTrace();
		}
		
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	
	//HttpSession session = request.getSession();
	
}
