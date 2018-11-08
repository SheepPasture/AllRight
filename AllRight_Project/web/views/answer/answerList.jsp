<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
  <style>
    header {
        position:relative;
        height:120px;
        background-color:#fff;
    }
    .logo {float:left;}
    .logo a {
	text-transform:uppercase;
	line-height:120px;
	font-size:26px;
	color:#333;
    }
    .logo a span {
	/* display:inline-block; */
	/* font-family: 'Roboto', sans-serif; */
	/* padding-right:18px;  */ 
    }
    .logo a span.b1 {font-weight:900;}
    .logo a span.b2 {font-weight:700;}
    .logo a span.b3 {font-weight:400;}
    .logo a span.b4 {font-weight:300;}
    .logo a span.b5 {font-weight:100;}
    #search-form input {
    width:42px;
    height: 40px;
	margin:0;
	padding:11px 0;
	text-transform:none;
	font-weight:300;
	line-height:20px;
	font-size: 13px;
	color: #999;	
	background: none;
	border: 0;
	box-shadow: none;	 
	transition: all 0.3s ease-in-out; 
	-webkit-transition: all 0.3s ease-in-out;
    }
    #search-form input:focus {
	    width:140px;
	    padding: 11px 20px 11px 0;
	}
	.logo a {font-size:22px;}
	
#search-form form {
	position:relative;
	height:40px;
	margin:40px 0 20px 19px;
	padding-left:60px;
	border-left:1px solid #ccc;
	font-family: FontAwesome;
	}
	#search-form form:before {
		content: "\f002";
		position:absolute;
		left:29px;
		top:-2px;
		height:40px;
		line-height:40px;
		font-size:15px;
		color:#cccc;
	}
	
	    .menu_block {
		position:fixed;
		z-index:9999;
		left:0;
		top:0;
		right:0;
		height:120px;
		width:100%;
		background-color:#fff;
		box-shadow:0 2px 3px rgba(0,0,0,0.1);
	}
	
	.navmenu ul li {
		position:relative;
		display:inline-block;
	}
	.navmenu ul li a {
		display:block;
		margin:0 0 0 -3px;
		padding:50px 20px;
		text-transform:uppercase;
		font-weight:900;
		line-height:20px;
		font-size:16px;
		color:#666;
		transition: all 0.3s ease-in-out; 
		-webkit-transition: all 0.3s ease-in-out;
	}
	.navmenu li:hover a,
	.navmenu li.active a {
		color:#333;
	}
	/* Sub menu */
	.sub-menu ul {
		display: none;
		position: absolute;
		z-index: 9990;
		width: 180px;
		left: 50%;
		top: 100%;
		padding: 0;
		margin: 0 0 0 -90px;
	}
	.sub-menu.last ul {right:0; left:auto;}
	.sub-menu ul:before {
		content:'';
		position:absolute;
		left:50%;
		top:-6px;
		margin-left:-5px;
		width: 0;
		height: 0;
		border-left: 6px solid transparent;
		border-right: 7px solid transparent;
		border-bottom: 6px solid #1c1c1c;
	}
	.sub-menu ul li  {
		margin:0;
		padding:0;
		width:100%;
		border-top: 0;
	}
	.sub-menu ul li a {
		position:relative;
		margin:0;
		padding: 15px 5px 14px 21px;
		font-weight:400;
		text-align:left;
		font-size:12px;
		color:#999 !important;
		background:#1c1c1c;
		border-bottom:1px solid #282828;
	}
	.sub-menu ul li:last-child a {border-bottom:0;}
	.sub-menu ul li.active a, .sub-menu ul li a:hover {color:#fff !important; background:#161616;}
    </style>
    
    <script>
        function calculateScroll() {
	var contentTop      =   [];
	var contentBottom   =   [];
	var winTop      =   $(window).scrollTop();
	var rangeTop    =   200;
	var rangeBottom =   500;
	$('.navmenu').find('.scroll_btn a').each(function(){
		contentTop.push( $( $(this).attr('href') ).offset().top );
		contentBottom.push( $( $(this).attr('href') ).offset().top + $( $(this).attr('href') ).height() );
	})
	$.each( contentTop, function(i){
		if ( winTop > contentTop[i] - rangeTop && winTop < contentBottom[i] - rangeBottom ){
			$('.navmenu li.scroll_btn')
			.removeClass('active')
			.eq(i).addClass('active');			
		}
	})
};
jQuery(document).ready(function() {
	//MobileMenu
	if ($(window).width() < 768){
		jQuery('.menu_block .container').prepend('<a href="javascript:void(0)" class="menu_toggler"><span class="fa fa-align-justify"></span></a>');
		jQuery('header .navmenu').hide();
		jQuery('.menu_toggler, .navmenu ul li a').click(function(){
			jQuery('header .navmenu').slideToggle(300);
		});
	}
	
		
	// if single_page
	if (jQuery("#page").hasClass("single_page")) {			
	}
	else {
		$(window).scroll(function(event) {
			calculateScroll();
		});
		$('.navmenu ul li a, .mobile_menu ul li a, .btn_down').click(function() {  
			$('html, body').animate({scrollTop: $(this.hash).offset().top - 80}, 1000);
			return false;
		});
	};
});
/* Superfish */
jQuery(document).ready(function() {
	if ($(window).width() >= 768){
		$('.navmenu ul').superfish();
	}
});
        
        </script>



</head>
<body>
<div align="center"><!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->
<%@ include file="/views/common/header.jsp" %>

<table style="margin-bottom:5px; width:100%; border:solid 0px #ccc; background:beige;" cellspacing="0" cellpadding="0">
		<tr>
			<td style="padding:15px 0px; width:120px; font-family:tahoma; text-align:center;">
		<div id="testing" style="display:none;">
			</td>
			<td>	
		<div id="top" style="padding:12px 0px; text-align:left;"><!--PC 리본메뉴, 문제집중뷰 시작.-->
		<form name='form' method='post' action='/q/index.php' 
		style='margin:0px;'>
		<select id='menu_top_select' name='bigCode' onchange='bigOptChange(this.form)'>
		<option value=''>응시 분야를 선택하세요.</option>
		<option value='10'>기능·기술 [기사]</option>
		<option value='11'>기능·기술 [산업기사]</option>
		<option value='12'>기능·기술 [기능사]</option>
		<option value='15'>기능·기술 [미용사]</option>
		<option value='18'>서비스 [멀티미디어]</option>
		<option value='19'>서비스 [텔레마케팅]</option>
		<option value='20'>사무 [컴퓨터활용능력]</option>
		<option value='21'>사무 [워드프로세서]</option>
		<option value='25'>판매 [전자상거래운용사]</option>
		<option value='30'>회계 [전산회계운용사]</option>
		<option value='70'>공인 [PC정비사]</option>
		<option value='75'>공인 [네트워크관리사]</option>
		</select>&nbsp;
		</form>
		<script type="text/javascript"></script>	
	 <div style="margin-top:10px; height:125px;"><!--구글검색, 애드센스, 기사퍼스트 링크 영역 시작.-->
	 <div style="float:left;">
	 <div id="google_search" style="height:30px;"><!--구글검색 (전체 웹 검색)-->
	 <form action="http://www.google.co.kr" id="cse-search-box" target="_blank">
			<div>
				<input type="hidden" name="cx" value="partner-pub-1981615758276157:4489152794" />
				<input type="hidden" name="ie" value="UTF-8" />
				<input type="text" name="q" size="54" />
				<input type="submit" name="sa" value="검색" />
			</div>
			</form>
			<script type="text/javascript" src="http://www.google.co.kr/coop/cse/brand?form=cse-search-box&amp;lang=ko"></script>
	</div></div></div></div></td></tr>
</table>
		
	
	<div style='margin-bottom:5px; padding:18px 0px; font-size:11pt; font-weight:bold; color:#55f; border:1px solid #ccc; background:#f8f8f8; text-align:center; border-radius:12px;'>
	아래는 종목별 바로가기 목차입니다.</div><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<br>
					
					<div class="col-sm-20 text-center">
						<div style=><h3>기능·기술 분야 [기능사 등급]</h3></div>
						<button type="button"><a href="../answer/answerInsertForm.jsp">정보처리기능사</a></button>
						<button type="button"><a href="#">정보기기운용기능사</a></button>
						<button type="button"><a href="#">한식조리기능사</a></button>
						<button type="button"><a href="#">제빵기능사</a></button>
					</div>
</div><!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->					
</body>
</html>