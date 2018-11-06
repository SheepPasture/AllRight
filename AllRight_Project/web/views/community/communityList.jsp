<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<!-- CSS -->
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

	
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/superfish.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/owl.carousel.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/animate.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.BlackAndWhite.js"></script>
	<script src="/allRight/resources/js/myscript.js" type="text/javascript"></script>
	
</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
	
		<%@ include file="/views/common/header.jsp" %>
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="#">공지사항</a></p>
					<p><a href="#">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-center">
					<h2 align="left">IT Community</h2>
					<table class="table table-hover">
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
							<th class="col-md-1">1</th>
							<th class="col-md-6 text-center">글제목입니다.</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">78</th>
							<th class="col-md-1">2018-10-29</th>						
						</tr>
						<tr>
							<th class="md-1 ">2</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">351</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">3</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">104</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">4</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">15</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						</tbody>
					</table> 
				</div>
				<div class="col-sm-10 text-center">
					<select id="searchCondition" name="searchCondition">
						<option value="">.    - - - </option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="search" id="keyword" placeholder="키워드를 입력하세요!"> 
					<button type="button" onclick="search();">검색하기</button>
					<button type="button"><a href="<%= request.getContextPath() %>/views/noticeWrite/noticeWrite.jsp">작성하기</a></button>
				<div>
			</div>
		</div>
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>