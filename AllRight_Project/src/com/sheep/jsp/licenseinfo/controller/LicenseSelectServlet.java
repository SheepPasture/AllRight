package com.sheep.jsp.licenseinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sheep.jsp.licenseinfo.model.service.LicenseService;
import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;

/**
 * Servlet implementation class LicenseSelectServlet
 */
@WebServlet("/lSelect.li")
public class LicenseSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LicenseSelectServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LicenseInfo li = new LicenseInfo();

		LicenseService ls = new LicenseService();

		ArrayList<LicenseInfo> al = ls.selectLicenseInfo();
		JSONObject result = new JSONObject();
		
		JSONArray lArray = new JSONArray();
		JSONObject lInfo = null;
		JSONObject cInfo = null;
		JSONArray list = new JSONArray();
		
		TreeSet tset = new TreeSet();
		
		for (int i = 0; i < al.size(); i++) {
			String str =al.get(i).getlCategory(); 
			if(str.equals(" ")){
				String str2="-기타항목-";
				/*System.out.println("---안되.??..-");*/
				str=str.trim().concat(str2);
				/*System.out.println(str);*/
			}
			/*if(al.get(i).getlCategory().equals(" "))al.get(i).getlCategory().contains("-기타항목-");*/
			/*System.out.println(str);*/
			tset.add(str);
			lInfo = new JSONObject();
			lInfo.put("lno",al.get(i).getlNo());
			lInfo.put("category", str);
			lInfo.put("name", al.get(i).getlName());
			lArray.add(lInfo);
	
		}
		Iterator iter = tset.iterator();
		while(iter.hasNext()){
			cInfo = new JSONObject();
			cInfo.put("listName", iter.next());
			list.add(cInfo);
	/*		System.out.println(list);*/
		}
		
		
		
	/*	System.out.println(list);
		System.out.println(tset);
		list.add(tset);*/
		/*System.out.println(tset);*/
		/*String str[] = null;
		*/
		
		/*System.out.println(tset);
		Iterator iter = tset.iterator();
		System.out.println(iter);*/
		/*while(iter.hasNext()){
			Object obj = iter.next();
			System.out.println(obj);
	
		}*/

	/*	ArrayList<Object> list = new ArrayList<Object>(new HashSet<Object>((Collection<? extends Object>) lInfo.get("category")));
		*/
		result.put("lArray", lArray);
		result.put("list", list);
		
		response.setContentType("application/json");
		response.getWriter().print(result.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
