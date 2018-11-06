<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.news.model.vo.*, java.util.*"%>

<% ArrayList<News> list = (ArrayList<News>)request.getAttribute("list"); %>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
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
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

	
	<script src="../../resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="../../resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="../../resources/js/superfish.min.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../../resources/js/owl.carousel.js" type="text/javascript"></script>
	<script src="../../resources/js/animate.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.BlackAndWhite.js"></script>
	<script src="../../resources/js/myscript.js" type="text/javascript"></script>
	
</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
		<!-- HEADER -->
		<%@ include file ="/views/common/header.jsp" %>
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="#">공지사항</a></p>
					<p><a href="#">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-center">
					<h2 align="left">뉴스</h2>
					<table class="table table-hover" >
						<thead>
							<tr>
								<th class="col-md-1">글번호</th>
								<th class="col-md-6 text-center">글제목</td>
								<th class="col-md-1">작성자</th>
								<th class="col-md-1">조회수</th>
								<th class="col-md-1">작성일</th>
							</tr>
						</thead>
						<tbody>
  							<% for(News n: list){ %>
						<tr>
							<td class="col-md-1"><%= n.getNNO() %></td>
							<td class="col-md-6 text-center"><%= n.getNTITLE() %></td>
							<td>관리자</td>
							<td><%= n.getNCOUNT() %></td>
							<td><%= n.getNDATE() %></td>
						</tr>
							<% } %> 
					</tbody>
					</table> 
				</div>
				<div class="col-sm-10 text-right">
					<button type="button"><a href="views/news/newWrite.jsp">작성하기</a></button>
				<div>
			</div>
		</div>
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>