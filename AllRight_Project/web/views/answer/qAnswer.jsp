<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myWeb/resources/js/jquery-3.3.1.min.js"></script>
<title>문제 정답</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<% if(m != null && m.getUserId().equals("admin")) { %>
	<div class="outer">
	<br>
	<h2 align="center">정보처리기사 필기 (2018년 1회 기출문제) 응시</h2>
	<div class="tableArea">	
		<form action="<%= request.getContextPath() %>/qAnswer.qn" method="post">
		<table>
			<tr>
				<td>번호</td>
				<td colspan="3"><input type="text" size="40" name="title" /></td>
			</tr>	     
			<tr>
				<td>내용</td>
				<td></td>
			</tr>
			
		
		
		
		</table>
		
		
		
		
		</form>
		</div>
</body>
</html>