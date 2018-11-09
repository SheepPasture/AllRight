package com.sheep.jsp.news.controller;

import java.io.File;
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
 * Servlet implementation class NewsUpdateServlet
 */
@WebServlet("/nUpView.ne")
public class NewsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg", "multipart/form-data로 전송해야만 합니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
		
		int maxSize = 1024*1024*10;
		
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/newsUploadFiles";
		
		MultipartRequest mrequest = new MultipartRequest(
				request,
				savePath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		NewsService ns = new NewsService();
		
		int nno = Integer.parseInt(mrequest.getParameter("nno"));
		
		News n = ns.selectOne(nno);
		
		String title = mrequest.getParameter("subject");
		String content = mrequest.getParameter("content");
		String file = mrequest.getFilesystemName("file");
		
		n.setNTITLE(title);
		n.setNCONTENT(content);
		
		if(file != null){
			
			File originFile = new File(savePath + "/" + n.getNFILE());
			
			originFile.delete();
			
			n.setNFILE(file);
		}
		
		int result = ns.updateNews(n);
		
		String page = "";
		
		if(result > 0){
			
			page = "/views/news/newsDetail.jsp";
			request.setAttribute("news", n);
			
		} else{
			
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "뉴스 수정 실패");
			
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
