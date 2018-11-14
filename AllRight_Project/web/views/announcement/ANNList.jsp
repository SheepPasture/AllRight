<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.announcement.model.vo.*" %>
 <% ArrayList<Announcement> alist = (ArrayList<Announcement>)request.getAttribute("alist"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
 %>
 
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
<!-- 	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> -->
<!-- 	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" /> -->
</head>
<body>
	
	<!-- PAGE -->
	<div id="page">
	
	<!-- HEADER -->
	<%@ include file ="/views/common/header.jsp" %>
	<!-- HEADER-END -->
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">커뮤니티</a></p>
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
  							<% for(Announcement a : alist){ %>
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
			<%-- 페이지 처리 --%>
			<br /><br />
			<div class="col-md-11 text-center" align="center">
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.ann?currentPage=1'"><<</button>
				<%  if(currentPage <= 1){  %>
				<button disabled><</button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.ann?currentPage=<%=currentPage - 1 %>'"><</button>
				<%  } %>
				
				<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){	
				%>
					<button disabled><%= p %></button>
				<%      }else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/selectList.ann?currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
					
				<%  if(currentPage >= maxPage){  %>
				<button disabled>></button>
				<%  }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.ann?currentPage=<%=currentPage + 1 %>'">></button>
				<%  } %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.ann?currentPage=<%= maxPage %>'">>></button>
			</div>
			
		 	<div class="col-sm-10 text-right">
				<button type="button"><a href="views/announcement/ANNInsertForm.jsp">작성하기</a></button>
			</div>
			
		</div>
	</div>
	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				console.log($(this).parent().children().eq(0).text());
				var ano = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/selectOne.ann?ano=" + ano;
			});
		});
	</script>
		
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>
