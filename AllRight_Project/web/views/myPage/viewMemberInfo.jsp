<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	Member m = (Member)session.getAttribute("member");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<div id = "main">
				회원 정보	
				아이디 : <%--= m.getUserId() --%> <br>
				이름 : <%--= m.getUserName() --%> <br>
				이메일 : <%--= m.getEmail --%> <br>
				관심자격증 : <%--= m.getSeloption --%> <br> 
				포인트	:	10/2000
				<button class="mUpdate" href="updateMember.jsp">정보 수정</button>
				</div>

				<script>
				
					 $('.mUpdate').click(function (){
						 $('#main').load($(this).attr('href')).show();
					 });
				</script>
				
</body>
</html>