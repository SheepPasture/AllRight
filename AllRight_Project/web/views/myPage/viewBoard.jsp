<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.board.model.vo.*,com.sheep.jsp.boardComment.model.vo.*, java.util.*"%>
<%
ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
ArrayList<BoardComment> lc = (ArrayList<BoardComment>)request.getAttribute("listComment"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
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
	<!-- HEADER -->
	
		<%@ include file="/views/common/header.jsp" %>
	<!-- HEADER-END -->
		<%--  --%>
		<br>
			<div class="container-fluid text-center">    
			<div class="row content">
				<div class="col-sm-2 sidenav"  style="display:inline-block; "  >
					<p><a id="s" href="/allRight/views/myPage/myPageMain.jsp">회원정보수정</a></p>
					<p><a href="/allRight/views/myPage/schedule.jsp">관심자격증 정보</a></p>
					<p><a href="<%= request.getContextPath() %>/bMyList.bo" >게시글 관리</a></p>
					<p><a href="/allRight/views/myPage/viewTest.jsp">기출문제 관리</a></p>
				</div>
				<br>
				<div class="col-sm-2 sidenav"  style="display:inline-block; background:ivory"  >
				
			<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>
				
				 </div> 
			
			  	<div id="showView" style="width:70%;height:100%; display:inline-block; ">
					<div src="viewMemberInfo.jsp">
						<table class="table table-hover">
 					<h1><small>게시글 확인</small></h1>	
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
						 <% for(Board b : list){ %>
						<tr>
							<td class="col-md-1"><%= b.getbNO() %></th>
							<td class="col-md-6 text-center"><%= b.getbTitle() %></td>
							<td class="col-md-1"><%= b.getbWriter() %></th>
							<td class="col-md-1"><%= b.getbCount() %></th>
							<td class="col-md-1"><%= b.getbDate() %></th>						
						</tr>
						<%}%> 
						<tr>
						<td>
						</tr>
						
					</table> 
					<hr>
					<h1><small>댓글 확인</small></h1>	
					<table class="table table-hover">
						<thead>
						
							<tr>
								<th class="col-md-1">분야</th>
								<th class="col-md-1">글번호</td>
								<th class="col-md-1">댓글번호</th>
								<th class="col-md-6 text-center">댓글내용</th>
								<th class="col-md-1">작성일</th>
							</tr>
						</thead>
						<tbody>
						<%--  <%for(BoardComment l : lc){%>
						<tr>
							<th class="col-md-1"><%= l.getbNo() %></th>
							<th class="col-md-1"><%= l.getbId() %></td>
							<th class="col-md-1"><%= l.getcNo() %></th>
							<th class="col-md-6 text-center"><%= l.getcContent() %></th>
							<th class="col-md-1"><%= l.getcDate() %></th>						
						</tr>
						<%}%>   --%>
					
						
					</table> 

					</div> 
				</div>
			
		</div>
	
	<div >

	</div>
</body>
</html>