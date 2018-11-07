<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.announcement.model.vo.*" %> 
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- CSS -->
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
		<%@ include file ="../common/header.jsp" %>

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
				<div class="col-sm-8 text-center">
				<h2 align="left">자격증정보</h2>
				<div class="container">
					 <ul id="myTab8" class="nav nav-tabs nav-justified" role="tablist"> 
						<li role="presentation" class="disabled"><a href="#home8" id="home-tab8" role="tab" data-toggle="tab" aria-controls="home8" aria-expanded="false">Home</a></li>
						<li role="presentation" class="active"><a href="#profile8" role="tab" id="profile-tab8" data-toggle="tab" aria-controls="profile8" aria-expanded="true">Profile</a></li>
						<li role="presentation" class="dropdown"> <a href="#dropdown8" role="tab" id="myTabDrop8" data-toggle="tab" aria-controls="dropdown8" aria-expanded="true">Dropdown </a></li>
					<div id="myTabContent8" class="tab-content"> 
						<div role="tabpanel" class="tab-pane fade" id="home8" aria-labelledby="home-tab8"> 
							<p>Home content</p>
							<p>Home content</p>
							<p>Home content</p>
							<p>Home content</p>
							<p>Home content</p>
							<p>Home content</p>
						</div> 
						<div role="tabpanel" class="tab-pane fade active in" id="profile8" aria-labelledby="profile-tab8"> <p>Profile content</p> </div>
						<div role="tabpanel" class="tab-pane fade" id="dropdown8" aria-labelledby="myTabDrop8"> <p>Dropdown content</p> </div>  
					</div>
				</div>
				
				</div>
			</div>
		</div>		        
	</div>
</body>
</html>