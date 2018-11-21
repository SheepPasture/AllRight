package com.sheep.jsp.announcement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.announcement.model.service.ANNService;
import com.sheep.jsp.announcement.model.vo.Announcement;

/**
 * Servlet implementation class ANNbeforeServlet
 */
@WebServlet("/abefore.ann")
public class ANNbeforeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ANNbeforeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		
		int nAno = new ANNService().beforeANN(ano);
		
		Announcement a = new ANNService().selectOne(nAno);

		System.out.println("ANNbeforeServlet ano: "+ano);
		System.out.println("ANNbeforeServlet nAno: "+nAno);
		System.out.println("ANNbeforeServlet a: "+a);
		
		String page = "";
		
		if(a != null){
			page = "/views/announcement/ANNDetail.jsp";
			request.setAttribute("announcement", a);
			
		} else{
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 이전 상세보기에 실패하였습니다. 관리자에게 문의바랍니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
