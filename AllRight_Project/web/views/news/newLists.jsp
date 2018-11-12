<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.news.model.vo.*, java.util.*"%>

<% 

	ArrayList<News> list = (ArrayList<News>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%>
<!DOCTYPE html>
<head>
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    

</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
		<!-- HEADER -->
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
					<table class="table table-hover" id="listArea">
						<thead>
							<tr>
								<th class="col-md-1 text-center">글번호</th>
								<th class="col-md-6 text-center">글제목</td>
								<th class="col-md-1 text-center">작성자</th>
								<th class="col-md-1 text-center">조회수</th>
								<th class="col-md-2 text-center">작성일</th>
							</tr>
						</thead>
						<tbody>
  							<% for(News n: list){ %>
						<tr>
							<td class="col-md-1"><%= n.getNNO() %></td>
							<td class="col-md-6 text-left"><%= n.getNTITLE() %></td>
							<td>관리자</td>
							<td><%= n.getNCOUNT() %></td>
							<td><%= n.getNDATE() %></td>
						</tr>
							<% } %> 
					</tbody>
					</table> 
				</div>
				
				<div class="col-md-11 text-center" align="center" >
				
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/selectList.ne?currentPage=1'"><<</button>
					<%	if(currentPage <= 1) {%>
					<button class="btn btn-default" disabled><</button>
					<% }else {%>
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/selectList.ne?currentPage=<%= currentPage - 1 %>'"><</button>
					<% } %>	
					
					<% for(int p = startPage; p <= endPage; p++) { 
							if(p == currentPage){ %>
							<button class="btn btn-default" disabled><%= p %></button>
					<%	} else { %>
							<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/selectList.ne?currentPage=<%= p%>'"><%= p %></button>
					<%	} %>
					<% } %>		
					
					<% if(currentPage >= maxPage) {%>	
					<button class="btn btn-default" disabled>></button>
					<% } else { %>
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/selectList.ne?currentPage=<%= currentPage + 1%>'">></button>
					<% } %>
					<button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/selectList.ne?currentPage=<%= maxPage%>'">>></button>
				</div>
				
				
				<div class="col-sm-10 text-right">
					<button class="btn btn-default" type="button"><a href="views/news/newWrite.jsp">작성하기</a></button>
				</div>
				
			</div>
			
			<br><br><br>
			<br><br><br>
		</div>
		
		<script>
			
			$(function(){
				$("#listArea td").mouseenter(function(){
					$(this).parent().css({"cursor":"pointer"});
				}).click(function(){
					
					var nno = $(this).parent().children().eq(0).text();
					location.href="<%=request.getContextPath()%>/selectOne.ne?nno=" + nno;
				});
			});
		</script>
	
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>
