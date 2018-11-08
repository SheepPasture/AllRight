<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>

<%
	/* Member m = (Member)session.getAttribute("member"); */
	Member m = (Member) request.getAttribute("member");
	LicenseInfo li = (LicenseInfo) request.getAttribute("lInfo");
%>
<!DOCTYPE html>
<head>

<title>ALLRight</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="/allRight/resources/css/flexslider.css" rel="stylesheet"
	type="text/css" />
<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet"
	type="text/css" />
<link href="/allRight/resources/css/animate.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">
<link href="/allRight/resources/css/style.css" rel="stylesheet"
	type="text/css" />

<!-- FONTS -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">


<script src="/allRight/resources/js/jquery.min.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/jquery.prettyPhoto.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/jquery.nicescroll.min.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/superfish.min.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/jquery.flexslider-min.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/owl.carousel.js"
	type="text/javascript"></script>
<script src="/allRight/resources/js/animate.js" type="text/javascript"></script>
<script src="/allRight/resources/js/jquery.BlackAndWhite.js"></script>
<script src="/allRight/resources/js/myscript.js" type="text/javascript"></script>
</head>
<body>

	<!-- PAGE -->
	<div id="page">

		<!-- HEADER -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- HEADER-END -->
		<br>
		<div class="container-fluid text-center">
			<div class="row content">
				<!-- NAV -->
				<div class="col-sm-2 sidenav" style="display: inline-block;">
					<%@ include file="/views/common/myPageNav.jsp"%>
				</div>
				<!-- NAV END-->
				<br>
				<article class="container">
					<div class="form-horizontal" id="showView"
						style="width: 70%; height: 100%;">

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">유저아이디</label>
							<div class="col-sm-6">
								<input class="form-control" id="inputEmail" type="text" readonly
									placeholder="아이디">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">이름</label>
							<div class="col-sm-6">
								<input class="form-control" id="inputEmail" type="text" readonly
									placeholder="아이디">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="inputEmail" type="text" readonly
									placeholder="아이디">
							</div>
						</div>
						<br>
						<div class="form-group" >
							<label class="col-sm-3 control-label" for="userId"><b>관심
									자격증</b></label>
							<div class="col-sm-6">
								<input class="form-control" id="userId" type="text" readonly
									placeholder="아이디값">
							</div>
						</div>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">포인트</label>
							<div class="col-sm-6">
								<input id="inputEmail" type="text">
							</div>
						</div>
						<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button>
					</div>
				</article>
			</div>
		</div>
	</div>
	<script>
		function mUpdate() {
			location.href = "/allRight/views/myPage/updateMember.jsp";
		}

		/* function changeInfo(){
			location.href="/myWeb/views/member/memberUpdateForm.jsp";
		} */
		/* 	/* 	$(function(){
					/* $('#showView').css("color","red"); 
					$('#s').css("color","red"); 
					
					console.log($('div:last'));
					$('.sidenav').children().click(function(){
					/* 	console.log($(this).children().attr('href')); 
						 console.log($(this));
						
							 $('#showView').load($(this).children().attr('href'),function(){
							 
						      $('#showView').show();
							}); 
						
						return false;
					});
					
			
				$('#mUpdate').click(function(){
					 $('#showView').load('updateMember.jsp');
				}) */

		/* }); */
	</script>

	<!-- FOOTER -->
	<footer> </footer>
	<!-- //FOOTER -->

</body>
</html>