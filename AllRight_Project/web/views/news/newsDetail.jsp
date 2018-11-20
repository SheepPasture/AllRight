<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.sheep.jsp.news.model.vo.*, java.util.*, com.oreilly.servlet.*"%>
    
 <%
 	News n = (News)request.getAttribute("news");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<style>
		.detail td{
			text-align : left;
			width:1000px;
			border-bottom : 1px solid lightgray;
			padding : 10px;
		}
	</style>
</head>
<html>
<body class="single is-preload">
	<!-- PAGE -->
	
	<div id="page">
	
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				
				
				<div class="col-sm-8 text-center">
					<h2 align="left">뉴스</h2>
					
					<div class= "outer">
						
						<table class="detail">
						<tr>
							<td colspan= "6" ><h3><%= n.getNTITLE() %></h3></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><label>관리자</label>
							<td>조회수</td>
							<td><label><%= n.getNCOUNT() %></label>
							<td>작성일</td>
							<td><label><%= n.getNDATE() %></label>
						</tr>
						<tr>
							<td colspan = "6">
								<div id="titleImgArea" align="center">
									<%if (n.getNFILE() != null) {%>
									<img id="titleImg" src="<%= request.getContextPath()%>/resources/newsUploadFiles/<%= n.getNFILE() %>">
									<% }  %>
									<!-- <img alt="" src="/allRight/resources/newsUploadFiles/newsImage1.jpg" /> -->
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<p id="contentArea"><%= n.getNCONTENT() %></p>
							</td>
						</tr>
						<tr>
							<td colspan = "6">
								<button onclick="location.href='selectList.ne'" class="btn btn-primary" style="float:right;">뉴스메뉴로 돌아가기</button>
								<%-- <form style="float:right;" method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/nDelete.ne?nno=<%=n.getNNO()%>">
								<button  class="btn btn-danger">삭제하기</button>
								</form>
								<button style="float:right; margin-right:5px;" onclick="location.href='<%= request.getContextPath()%>/nUpView.ne?nno='+<%=n.getNNO() %>" class="btn btn-warning">수정하기</button> --%>

								
							</td>
						</tr>
						</table>

					
								<br><br><br>
							</div>
							

					</div>
					
				</div>
			</div>
		</div>
	
	
	
	</div>
</body>
</html>
