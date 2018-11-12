<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.sheep.jsp.member.model.vo.*, java.util.*, com.oreilly.servlet.*"%>
    
 <%
 	Member m = (Member)request.getAttribute("member");
 %>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    <link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>

</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
		<%@ include file ="/views/common/header.jsp" %>
		
		<%-- <% if(m != null && m.getUserId().equals("admin")) {%> --%>
		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="../notice/noticeList.jsp">공지사항</a></p>
					<p><a href="../community/communityList.jsp">커뮤니티</a></p>
					<p><a href="../license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				
				<form action="<%= request.getContextPath()%>/nInsert.ne"
				method="post" enctype="multipart/form-data">
				<div class="col-sm-8 text-left">
					<br>
					<h3 align="left">뉴스 작성하기</h3>
					<div class="form-group"> 
						<label for="subject">제목</label> 
						<input type="text" class="form-control" name ="subject" id="subject" placeholder="제목을 입력하세요"> 
					</div> 
					<div class="form-group"> 
						<label for="File">뉴스 사진</label> 
						<input type="file" id="File" name="file"> 
					</div> 
					<div class="form-group"> 
						<label for="content">뉴스 내용</label> 
						<textarea class="form-control" cols="60" rows="10" name="content" id="content" style="resize:none;" placeholder="최대 3000자 이내로 입력하세요."></textarea> 
					</div> 
				</div>
			</div>
					
			 		<button type="submit" class="btn btn-success">등록하기</button>
			 		<button type="reset" class="btn btn-danger" onclick="back()">취소하기</button>
			 		<br><br><br>
			 		</form>
			 		<script>
			 			
			 			function back(){
			 				location.href="/allRight/selectList.ne";
			 			}
			 		</script>
		</div>
					
	

</div>

<%-- 
<% } else {
	request.setAttribute("msg","관계자 외에 접근이 불가능한 페이지입니다.");
	request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
} %> 
--%> 


	
</body>
</html>