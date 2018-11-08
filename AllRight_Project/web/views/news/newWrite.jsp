<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
    
	


</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
		<%@ include file ="/views/common/header.jsp" %>
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="../notice/noticeList.jsp">공지사항</a></p>
					<p><a href="../community/communityList.jsp">커뮤니티</a></p>
					<p><a href="../license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<br>
					<h3 align="left">글쓰기</h3>
					<div class="form-group"> 
						<label for="subject">Title</label> 
						<input type="text" class="form-control" name ="subject" id="subject" placeholder="Enter title"> 
					</div> 
					<div class="form-group"> 
						<label for="File">File input</label> 
						<input type="file" id="File"> 
					</div> 
					<div class="form-group"> 
						<label for="content">Comment:</label> 
						<textarea class="form-control" rows="10" name="content" id="content"></textarea> 
					</div> 
				</div>
			</div>
					<button type="submit">수정하기</button>
			 		<button type="submit">작성하기</button>
			 		<button type="button"><a href="../notice/noticeList.jsp" >되돌아가기</a></button>
		</div>
					<!-- <div class="row">
		 				<form method="post" action="writeAction.jsp">
						<table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
					 		<thead>
								<tr>
									<th colspan="1" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기 양식</th>
								</tr>		 		
					 		</thead>
					 		<tbody>
					 			<tr>
					 				<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" maxlength="50"></td>
					 			</tr>
					 			<tr>	
					 				<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px"></textarea> </td>
					 			</tr>	
					 		</tbody>
			 			</table>
			 			<button type="button">수정하기</button>
				 		<button type="button">작성하기</button>
						</form>
		 			</div> -->

	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>