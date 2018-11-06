<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.announcement.model.vo.*" %>
 <% ArrayList<Announcement> list = (ArrayList<Announcement>)request.getAttribute("list"); %>
 
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	 <!-- CSS -->
	<link href="../../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../../resources/css/owl.carousel.css" rel="stylesheet">
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css" /> 

	<!-- CSS -->
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
   
	
</head>
<body>
	
	<!-- PAGE -->
	<div id="page">
	
	<!-- HEADER -->
	<%@ include file ="../common/header.jsp" %>
	<!-- HEADER-END -->
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="#">공지사항</a></p>
					<p><a href="#">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-center">
					<h2 align="left">공지사항</h2>
					<table class="table table-hover" id="listArea">
					<thead>
						<tr>
							<th class="col-md-1">글번호</th>
							<th class="col-md-6 text-center">글제목</th>
							<th class="col-md-1">작성자</th>
							<th class="col-md-1">조회수</th>
							<th class="col-md-1">작성일</th>
						</tr>
					</thead>
					<tbody>
  							<% for(Announcement a: list){ %>
						<tr>
							<td class="col-md-1"><%= a.getAno() %></td>
							<td class="col-md-6 text-center"><%= a.getAtitle()%></td>
							<td>관리자</td>
							<td><%= a.getAcount() %></td>
							<td><%= a.getAdate() %></td>
						</tr>
							<% } %> 
					</tbody>
				</table>  
			</div>
		 	<div class="col-sm-10 text-right">
				<button type="button"><a href="<%= request.getContextPath()%>/views/announcement/ANNInsertForm.jsp">작성하기</a></button>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>