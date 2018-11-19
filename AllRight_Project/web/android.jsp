<%@page import="javax.swing.Action"%>
<%@page import="com.sheep.jsp.member.controller.MemberLoginServlet"
		import="com.sheep.jsp.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*    Member m = (Member)request.getAttribute("member");

   int userNO = m.getUserNo();

   System.out.println(m);

   // 안드로이드로 전송
   out.println(userNO);*/
   
   String inputId = request.getParameter("inputId");
   String inputPassword = request.getParameter("inputPassword");
   String android = request.getParameter("android");   
   
   request.setAttribute("inputId", inputId);
   request.setAttribute("inputPassword",inputPassword);
   request.setAttribute("android", android);
   request.getRequestDispatcher("mLogin.me").forward(request, response);
   
   
   Member m = (Member)request.getAttribute("member");
   
   System.out.println(m);
   
 %>