<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member ,com.sheep.jsp.userPoint.model.vo.*, java.util.*"%>
<%
	Member m = (Member)session.getAttribute("member"); 
	/* UserPoint u = (UserPoint)session.getAttribute("UserPoint"); */
	/* 	String level = (String)request.getAttribute("level"); */
%>
<!DOCTYPE html>
<head>

</head>
<body>
			<div style="background:ivory;">
			<%= m.getUserName() %>
			<%-- <%= m.getUserId() %>
			<%=  %> --%>
			<%-- <%=level %> --%>
			</div>
			<p><a href="<%= request.getContextPath() %>/mMylist.me">회원정보수정</a></p>
			<p><a href="<%= request.getContextPath() %>/lMylist.li">관심자격증 정보</a></p>
			<p><a href="<%= request.getContextPath() %>/bMyList.bo" >게시글 관리</a></p>
			<p><a href="/allRight/views/myPage/viewTest.jsp">기출문제 관리</a></p>
</body>
</html>