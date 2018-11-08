<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<!-- CSS -->
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<!-- <link href="/allRight/resources/css/flexslider.css" rel="stylesheet" type="text/css" />
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
	body
	{
			background-image: url('/views/resorces/images/bono.jpg');
		}
	.breadcrumbs_block h2 {
		margin-bottom:15px;
		line-height:80px;
		font-size:80px;
		color:#000;
	}
	.breadcrumbs_block p {
		margin:0;
		line-height:34px;
		font-size:26px;
		color:#999;
	}
		.breadcrumbs_block {padding:50px 0;}
	
		.breadcrumbs_block {padding:50px 0;}
		.breadcrumbs_block h2 {font-size:60px; line-height:64px;}
		.breadcrumbs_block p {font-size:21px; line-height:24px;}
	
		.breadcrumbs_block {padding:40px 0;}
		.breadcrumbs_block h2 {font-size:50px; line-height:54px;}
		.breadcrumbs_block p {font-size:16px; line-height:20px;}
		.center {text-align:center;}
	</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%@ include file= "/views/common/header.jsp" %>
	
	<!-- 회원가입 상단부 -->
		<section class="breadcrumbs_block clearfix parallax">
			<div class="container center">
				<h2>회원가입</h2>
				<p>AllRight은 무료로 사용이 가능합니다.</p>
			</div>
		</section>
		<!-- 회원가입 중단부  -->
		<form id="insertForm" action ="<%=request.getContextPath()%>/mInsert.me" method="post">
		
		<table align="center">
		
			<tr>
				<td width="120px">* 아이디 </td>
				<td><input type="text" name="userId" id="userId" required="required"></td>
				<td><button id="idCheck">중복확인</button></td>
			</tr>
			<tr>
					<td>* 비밀번호</td>
					<td><input type="password" id="userPwd" name="userPwd" required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" id="userPwd2" name="userPwd2" required="required"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" maxlength="5" name="userName" required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이메일 </td>
					<td><input type="email" name="email" required="required"></td>
					<td></td>
				</tr>
				
		</table>
		<br>
		<div align="center">
		   <script src="https://www.google.com/recaptcha/api.js?" async defer></script><div class="g-recaptcha" data-sitekey="6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"></div>
		<noscript>
        <div style="width: 302px; height: 352px;">
        <div style="width: 302px; height: 352px; position: relative;">
        <div style="width: 302px; height: 352px; position: absolute;">
        <iframe src="https://www.google.com/recaptcha/api/fallback?k=6Lcvw_gSAAAAAH3zOofJBJOFLpmjx7Vq3hxnYIRw"
        frameborder="0" scrolling="no"
        style="width: 302px; height:352px; border-style: none;" >
        </iframe>
        </div>
        <div style="width: 250px; height: 80px; position: absolute; border-style: none;
        bottom: 21px; left: 25px; margin: 0px; padding: 0px; right: 25px; ">
        <textarea id="g-recaptcha-response" name="g-recaptcha-response"
        class="g-recaptcha-response"
        style="width: 250px; height: 80px; border: 1px solid #c1c1c1;
        margin: 0px; padding: 0px; resize: none;" value="">
        </textarea>
        </div>
        </div>
        </div>
        </noscript>
        </div>
		<br>
		 <div align="center"><button class="btn btn-primary btn-block" type="submit" style="width: 300px;">AllRight 회원 가입</button></div>
		</form>
		<script>
		function join() {
			$("#insertForm").submit();
		}
		
		$("#insertForm").submit(function(event){
			if($("#userPwd").val() == "" || $("#userId").val() == "") alert("아이디나 비밀번호는 필수 값입니다.");
			else if($('#userPwd').val() != $('#userPwd2').val()) alert("비밀번호 확인 값과 다릅니다.");
			else return;
			event.preventDefault();
		});
		</script>
</body>
</html>