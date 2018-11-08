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