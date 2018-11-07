<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
</head>
<html>
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
					<h2 align="left">공지사항</h2>
					
					<div class="tableArea col-sm-10 text-center" style="border: 1px solid tomato">
						<table>
							<tr>
								<th class="col-md-1">글번호</th>
								<th class="col-md-6 text-center">글제목</td>
								<th class="col-md-1">작성자</th>
								<th class="col-md-1">조회수</th>
								<th class="col-md-1">작성일</th>
							</tr>
						</table>
					</div>
					
				</div>
				
				<div class="col-sm-10 center">
					<button type="button"><a href="<%= request.getContextPath() %>/selectList.ann">돌아가기</a></button>
				<div>
			</div>
		</div>
	
		<!-- FOOTER -->
		<footer>
				
		</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>