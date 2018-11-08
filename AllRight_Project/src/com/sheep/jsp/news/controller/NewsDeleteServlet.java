package com.sheep.jsp.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.sheep.jsp.news.model.service.NewsService;

/**
 * Servlet implementation class NewsDeleteServlet
 */
@WebServlet("/nDelete.ne")
public class NewsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)){
			
			request.setAttribute("msg", "multipart로 사용하셔야 합니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/newsUploadFiles";
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath);
		
		int nno = Integer.parseInt(mrequest.getParameter("nno"));
		
		int result = new NewsService().deleteNews(nno);
		
		if(result > 0) {
			
			response.sendRedirect("selectList.ne");
		} else{
			
			request.setAttribute("msg", "뉴스 삭제 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
