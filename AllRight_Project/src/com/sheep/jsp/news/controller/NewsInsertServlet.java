package com.sheep.jsp.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sheep.jsp.news.model.service.NewsService;
import com.sheep.jsp.news.model.vo.News;

/**
 * Servlet implementation class NewsInsertServlet
 */
@WebServlet("/nInsert.ne")
public class NewsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsInsertServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 10MB
		int maxSize = 1024 * 1024 * 10;
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "enctype을 통한 multipart 전송이 필요합니다.");
			request.getRequestDispatcher("/views/common/errorPage/jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/newsUploadFiles";
		
		MultipartRequest mrequest = new MultipartRequest(
				request,
				savePath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		String title = mrequest.getParameter("subject");
		String content = mrequest.getParameter("content").replace("\r\n", "<br>");
		String fileName = mrequest.getFilesystemName("file");
		
		//한줄 띄어쓰기 처리
		//content = content.replaceAll("\r\n", "<br>");
		
		News n = new News();
		
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("filename : " + fileName); 
		
		n.setNTITLE(title);
		n.setNCONTENT(content);
		n.setNFILE(fileName);
		
		int result = new NewsService().insertNews(n);
		
		if(result > 0){
			response.sendRedirect("selectList.ne");
		} else{
			request.setAttribute("msg", "뉴스 작성 실패");
			
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
