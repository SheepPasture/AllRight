<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"%>

<%-- <%
	Member m = (Member)session.getAttribute("member");

%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
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

 
<style>
	.outer{
		width:600px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	#idCheck, #ckZip, #goMain, #updateBtn, #deleteBtn {
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
	
	#idCheck:hover, #ckZip:hover, #updateBtn:hover, #goMain:hover, , #deleteBtn:hover {
		cursor:pointer;
	}
	td {
		text-align:right;
	}
	#ckZip, #updateBtn {
		background:lightgreen;
		color:black;
	}
	#updateBtn, #goMain, #deleteBtn {
		display:inline-block;
	}
</style>

</head>
<body>
	<!-- HEADER -->
	<%@ include file="/views/common/header.jsp" %>
	<!-- HEADER-END -->
		<%--  --%>
		<br>
			<div class="container-fluid text-center">    
			<div class="row content">
				<!-- NAV -->
				<div class="col-sm-2 sidenav"  style="display:inline-block; "  >
				<%@ include file="/views/common/myPageNav.jsp" %> 
				</div>
				<!-- NAV END-->
			<br>
			<div class="col-sm-2 sidenav"  style="display:inline-block; background:ivory"  >
				
			<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>
				
			</div> 
			<h1><small>기출문제 오답</small></h1>	
			  	<div id="showView" style="width:70%;height:100%; display:inline-block; ">
					<div src="viewMemberInfo.jsp">
						<table class="table table-hover">
 						
					
						</table>
					</div> 
				</div>
			
		</div>
	
	<div >

	</div>
</body>
</html>