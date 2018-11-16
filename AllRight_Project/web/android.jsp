<%@page import="com.sheep.jsp.member.controller.MemberLoginServlet"
		import="com.sheep.jsp.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Member m = (Member)session.getAttribute("member");

   int userNO = m.getUserNo();

   System.out.println(m);

   // 안드로이드로 전송
   out.println(userNO);
%>