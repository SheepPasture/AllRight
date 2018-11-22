<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member ,com.sheep.jsp.point.model.vo.Point, java.util.*"%>
<%
	Member m = (Member) session.getAttribute("member");
	Point p = (Point) session.getAttribute("point");
	int level = (int) session.getAttribute("level");

	/* String level=(String)session.getAttribute("level");   */
	/* UserPoint u = (UserPoint)session.getAttribute("UserPoint"); */
	/*  String level = (String)session.getAttribute("level");  */
%>
<!DOCTYPE html>
<head>
<!-- 	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> -->
</head>
<body>
	<div >
		<div style=" align: left">
			<%=m.getUserName()%>
			님 <br>
			<div style="display: inline-block">
				<label>포인트 :</label><%=p.getPoint()%><br>
			</div>
			<div style="display: inline-block; align: right; ">
				Lv.<%=level%>
			</div>

		</div>
		<hr>
		<p><%if(m!=null) {%>
			<a href="<%=request.getContextPath()%>/views/myPage/myPageMain.jsp">회원정보수정</a>
		</p>
		<p>
			<%-- <a href="<%=request.getContextPath()%>/sTest.sc">관심자격증 정보</a> --%>
			<a href="<%=request.getContextPath()%>/views/myPage/schedule.jsp">관심자격증 정보</a>
		</p>
		<p>
			<a href="<%=request.getContextPath()%>/bMyList.bo">게시글 관리</a>
		</p>
		<p>
			<a href="/allRight/views/myPage/viewTest.jsp">기출문제 관리</a>
		</p>
		<p>
			<a href="#">apk 다운로드</a>
		</p>
		<%}else{ %>
		<script>
		alert("로그인 사용자만 가능합니다.");
		
		</script>
		<%} %>
	</div>
</body>
</html>