package com.sheep.jsp.licenseinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sheep.jsp.licenseinfo.model.service.LicenseService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;

/**
 * Servlet implementation class LicenseViewServlet
 */
@WebServlet("/lView.li")
public class LicenseViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LicenseViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int lno = Integer.parseInt(request.getParameter("lno"));
		
		LicenseInfo lf = new LicenseService().selectOne(lno);
		
		System.out.println("SelectLno lno: "+ lno);
		System.out.println("LicenseInfo servelt: "+lf);
		
		String page = "";
		
		if(lf != null){
			page = "/views/licenseinfo/licenseView.jsp";
			request.setAttribute("licenseInfo", lf);
		} else{
			page="/views/common/errorPage.jsp";
			request.setAttribute("msg", "자격증 상세보기에 실패하였습니다. 관리자에게 문의바랍니다.");
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
