<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.sheep.jsp.member.model.vo.Member"%>
    <%
    
	String id = request.getParameter("inputId");
	String pwd = request.getParameter("inputPwd");
	
	Member m = new Member(id,pwd);
	
	
	System.out.println(m);
%>