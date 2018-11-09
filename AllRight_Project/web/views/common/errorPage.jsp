<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage = "true"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	Exception e = (Exception)request.getAttribute("exception");
%>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
   
	
</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
		<!-- HEADER -->
		<header>
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="#">공지사항</a></p>
					<p><a href="#">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-center">
					<h2 align="left">에러 페이지</h2>
					
					<%if(e!= null) {%>
					
					<h3>에러명 :: <%= e.getMessage() %></h3>
					
					<% } %>
					
					<h4> <br /><br />
					에러가 계속 발생시 담당자에게 연락부탁드립니다.
					</h4>
				</div>
				<div class="col-sm-10 text-right">
					
				<div>
			</div>
		</div>
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>