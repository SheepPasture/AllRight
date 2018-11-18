<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.board.model.vo.*,com.sheep.jsp.boardComment.model.vo.*, java.util.*"%>
<%
ArrayList<Board> bl = (ArrayList<Board>)request.getAttribute("blist");
ArrayList<BoardComment> cl = (ArrayList<BoardComment>)request.getAttribute("clist");
String bmsg = (String)request.getAttribute("bmsg");
String cmsg = (String)request.getAttribute("cmsg");
int listCount = (int)request.getAttribute("listCount");
int currentPage = (int)request.getAttribute("currentPage");
int maxPage = (int)request.getAttribute("maxPage");
int startPage = (int)request.getAttribute("startPage");
int endPage = (int)request.getAttribute("startPage");  

%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='/allRight/resources/js/moment.min.js'></script>
<script src='/allRight/resources/js/jquery.min.js'></script></head>
<body>
	<!-- HEADER -->
		<%@ include file="/views/common/header.jsp" %>
	<!-- HEADER-END -->

		<br>
			<div class="container-fluid text-center">    
			<div class="row content">
				<!-- NAV -->
				<div class="col-sm-2 sidenav"  style="display:inline-block; "  >
				<%@ include file="/views/common/myPageNav.jsp" %> 
				</div>
				<!-- NAV END-->
				<br>
			
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
						
						<tbody id ="bDetail">
						<%if(bl!=null){ %>
						 <% for(Board b : bl){ %>
						<tr>
							<td class="col-md-1"><%= b.getbNO() %></th>
							<td class="col-md-6 text-center"><%= b.getbTitle() %></td>
							<td class="col-md-1"><%= b.getbWriter() %></th>
							<td class="col-md-1"><%= b.getbCount() %></th>
							<td class="col-md-1"><%= b.getbDate() %></th>						
						</tr>
						<%}%> 
						<%}else{ %>
						<tr>
							<td colspan="5"><%=bmsg%></td>
						</tr>
						<%}%> 
						
						
					</table> 
					
					<div class="pagingArea" align="center">
						<button onclick="location.href='<%= request.getContextPath() %>/bMyList.bo?currentPage=1'"><<</button>
						<%  if(currentPage <= 1){  %>
						<button disabled><</button>
						<%  }else{ %>
						<button onclick="location.href='<%= request.getContextPath() %>/bMyList.bo?currentPage=<%=currentPage - 1 %>'"><</button>
						<%  } %>
						
						<% for(int pag = startPage; pag <= endPage; pag++){
								if(pag == currentPage){	
						%>
							<button disabled><%= pag %></button>
						<%      }else{ %>
							<button onclick="location.href='<%= request.getContextPath() %>/bMyList.bo?currentPage=<%= pag %>'"><%= pag %></button>
						<%      } %>
						<% } %>
							
						<%  if(currentPage >= maxPage){  %>
						<button disabled>></button>
						<%  }else{ %>
						<button onclick="location.href='<%= request.getContextPath() %>/bMyList.bo?currentPage=<%=currentPage + 1 %>'">></button>
						<%  } %>
						<button onclick="location.href='<%= request.getContextPath() %>/bMyList.bo?currentPage=<%= maxPage %>'">>></button>


					</div>
					
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
						<tbody id="cDetail">
						<% if(cl !=null){ %>
						 <%for(BoardComment l : cl){%>
						<tr>
							<td class="col-md-1"><%= l.getbNo() %></th>
							<td class="col-md-1"><%= l.getbId() %></td>
							<td class="col-md-1"><%= l.getcNo() %></th>
							<td class="col-md-6 text-center"><%= l.getcContent() %></th>
							<td class="col-md-1"><%= l.getcDate() %></th>						
						</tr>
						<%}%>  
							
						<%}else{%>
						<tr>
							<td colspan="5">작성한 댓글이 없습니다.</td>
						</tr>
						<%} %>
					</table> 

					</div> 
				</div>
				<script>
				$(function(){
						$("td").mouseout(function(){
							$(this).parent().removeAttr(css);
						}).click(function(){
							var bno = $(this).parent().children().eq(0).text();
							location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno;
						});
						
					<%-- 	$("#cDetail td").mouseout(function(){
							$(this).parent().removeAttr(css);
						}).click(function(){
							var bno = $(this).parent().children().eq(0).text();
							location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno;
						});
						 --%>
						
						
						
						
					});
				
				</script>
			
		</div>
	
	<div >

	</div>
</body>
</html>