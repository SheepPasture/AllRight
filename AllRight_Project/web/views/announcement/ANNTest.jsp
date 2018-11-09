<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>ALLRight</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	
	<!-- SUMMERNOTE -->
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script> 
  
  <style>
		
  </style>
  
</head>

<body>
		<%@ include file ="/views/common/header.jsp" %>

	<!-- PAGE -->
	<div id="page">

		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="../announcement/ANNList.jsp">공지사항</a></p>
					<p><a href="../community/communityList.jsp">커뮤니티</a></p>
					<p><a href="../license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">

				</div>
			</div>
		</div>		        
	</div>
</body>
</html>