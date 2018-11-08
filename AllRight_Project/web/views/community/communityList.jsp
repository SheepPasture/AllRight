<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>ALLRight</title>
    
	<!-- CSS -->
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
    
</head>
<body>

	<!-- PAGE -->
	<div id="page">

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
					<h2 align="left">IT Community</h2>
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
						<tr>
							<th class="col-md-1">1</th>
							<th class="col-md-6 text-center">글제목입니다.</th>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">78</th>
							<th class="col-md-1">2018-10-29</th>						
						</tr>
						<tr>
							<th class="md-1 ">2</th>
							<th class="col-md-6 text-center">글제목</th>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">351</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">3</th>
							<th class="col-md-6 text-center">글제목</th>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">104</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">4</th>
							<th class="col-md-6 text-center">글제목</th>
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
				<button type="button"><a href="<%= request.getContextPath()%>/views/community/communityInsertForm.jsp">작성하기</a></button>
			</div>
		<script>
			$(function(){
				$("#listArea td").mouseenter(function(){
					$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					//console.log($(this).parent().children().eq(0).text());
					var ano = $(this).parent().children().eq(0).text();
					location.href="<%=request.getContextPath()%>/selectOne.ann?ano=" + ano;
				});
			});
		</script>
			</div>
		</div>
	</div>
	
	</div>
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>