<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.sheep.jsp.news.model.vo.*, java.util.*"%>
    
 <%
 	News n = (News)request.getAttribute("news");
 %>
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
					<h2 align="left">뉴스</h2>
					<table>
						<thead>
							<tr>
								<td>제목 : </td>
								<td colspan="3"><%= n.getNTITLE() %></td>
							</tr>
							<tr>
								<td>작성자 : </td>
								<td>관리자</td>
								<td>작성일 : </td>
								<td><%= n.getNDATE() %></td>
							</tr>
							<tr>
								<td>내용</td>
							</tr>
							<tr>
								<td colspan="4"><br>
									<span><%= n.getNCONTENT().charAt(0) %></span><%= n.getNCONTENT().substring(1) %>
								</td>
							</tr>
							<br>
							<div align="center">
								<button onclick="location.href='selectList.ne'">뉴스메뉴로 돌아가기</button>
								<button onclick="location.href='nUpView.no?nno=<%=n.getNNO()%>'"></button>
							</div>
							
						</thead>
						
					</table> 
				</div>
			</div>
		</div>
	
		<!-- FOOTER -->
		<footer>
				
		</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>