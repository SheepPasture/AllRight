<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.sheep.jsp.news.model.vo.*, java.util.*, com.oreilly.servlet.*"%>
    
 <%
 	News n = (News)request.getAttribute("news");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 수정 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<style>
		.detail td{
			text-align : left;
			width:1000px;
			border-bottom : 1px solid lightgray;
			padding : 10px;
		}
	</style>
</head>
<html>
<body class="single is-preload">
	<!-- PAGE -->
	
	<!-- PAGE -->
	<div id="page">
	
		<%@ include file ="/views/common/header.jsp" %>
		
		<%-- <% if(m != null && m.getUserId().equals("admin")) {%> --%>
		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">커뮤니티</a></p>
					<p><a href="/views/license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				
				<form id="updateForm"
				method="post" enctype="multipart/form-data">
				<div class="col-sm-8 text-left">
					<br>
					<h3 align="left">뉴스 수정 페이지</h3>
					<div class="form-group"> 
						<label for="subject">제목</label> 
						<input type="text" class="form-control" name ="subject" id="subject" value="<%= n.getNTITLE() %>"> 
						<input type="hidden" name="nno" value="<%= n.getNNO()%>">
					</div> 
					<%if(n.getNFILE() != null) {%>
					<div class="form-group"> 
						<label for="File">뉴스 기존 사진</label> 
						<a href = "<%= request.getContextPath()%>/nfdown.ne?path=<%=n.getNFILE()%>"><%= n.getNFILE() %></a> 
					</div> 
					<%} %>
					
					<div class="form-group"> 
						<label for="File">뉴스 새 사진</label> 
						<input type="file" id="File" name="file"> 
					</div> 
					
					<div class="form-group"> 
						<label for="content">뉴스 내용</label> 
						<textarea class="form-control" cols="60" rows="10" name="content" id="content" style="resize:none;"><%= n.getNCONTENT().replace("<br>", "\r\n") %></textarea> 
					</div> 
				</div>
			</div>
					
			 		<button type="submit" class="btn btn-success" onclick="complete();">수정완료</button>
			 		<button type="reset" class="btn btn-warning" onclick="back()">취소하기</button>
			 		<button class="btn btn-danger" onclick="deleteNews()">삭제하기</button>
			 		<br><br><br>
			 		</form>
			 		<script>
			 			
			 			function back(){
			 				location.href="/allRight/selectList.ne";
			 			}
			 			
			 			function complete(){
			 				$("#updateForm").attr("action","<%= request.getContextPath()%>/nUpdate.ne");
			 			}
			 			
			 			function deleteNews(){
			 				$("#updateForm").attr("action","<%= request.getContextPath()%>/nDelete.ne");
			 			}
			 		</script>
		</div>
					
	

</div>
</body>
</html>
