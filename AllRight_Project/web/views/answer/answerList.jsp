<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"%>
    
<%
	Member m = (Member)session.getAttribute("member");
 %>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<!-- CSS -->
	<link href="../../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../../resources/css/owl.carousel.css" rel="stylesheet">
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css" />
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	
 	
	<script src="../../resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="../../resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="../../resources/js/superfish.min.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="../../resources/js/owl.carousel.js" type="text/javascript"></script>
	<script src="../../resources/js/animate.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.BlackAndWhite.js"></script>
	<script src="../../resources/js/myscript.js" type="text/javascript"></script>
	
	
</head>
<body>
 	<!-- PAGE -->
	<div id="page">
	
		<!-- HEADER -->
		<header>
			
			<!-- MENU BLOCK -->
			<div class="menu_block">
			
				<!-- CONTAINER -->
				<div class="container clearfix">
					
					<!-- LOGO -->
					<div class="logo pull-left">
                        <a href="../../index.jsp" ><span class="b1">A</span><span class="b2">L</span><span class="b2">L</span>
                            <span class="b3">R</span><span class="b4">I</span><span class="b4">G</span>
                            <span class="b4">H</span><span class="b5">T</span></a>
					</div><!-- //LOGO -->
					
					<!-- SEARCH FORM -->
					<div id="search-form" class="pull-right">
						<form method="get" action="#">
							<input type="text" name="Search" value="Search" onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
						</form>
					</div><!-- SEARCH FORM -->
					
					<!-- MENU -->
					<div class="pull-right">
						<nav class="navmenu center">
							<ul>
								<li class="first active scroll_btn"><a href="../../index.jsp" >홈페이지</a></li>
								<li class="scroll_btn"><a href="../notice/noticeList.jsp" >공지사항</a></li>
								<li class="scroll_btn"><a href="../community/communityList.jsp" >커뮤니티</a></li>
								<li class="scroll_btn"><a href="../license/licenseinfo.jsp" >자격증정보</a></li>
								<li class="scroll_btn"><a href="../news/newLists.jsp" >뉴스</a></li>
								<li class="scroll_btn last"><a href="../myPage/myPageMain.jsp" >마이페이지</a></li>
								<li class="sub-menu">
									<a href="javascript:void(0);" >게시판</a>
									<ul>
										<li><a href="views/answer/answerNum.jsp" >문제번호</a></li>
										<li><a href="views/answer/answerUser.jsp" >유저답안</a></li>
										<li><a href="views/answer/answerWrongAnswer.jsp" >오답체크</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div><!-- //MENU -->
				</div><!-- //MENU BLOCK -->
			</div><!-- //CONTAINER -->
		</header><!-- //HEADER -->
		
		
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
		
	
	<div style='margin-bottom:5px; padding:18px 0px; font-size:11pt; font-weight:bold; color:#55f; border:1px solid #ccc; background:#f8f8f8; text-align:center; border-radius:12px;'>아래는 종목별 바로가기 목차입니다.
		</div><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<br>				
					<div class="col-sm-20 text-center">
						<div style=><h3>기능·기술 분야 [기능사 등급]</h3></div>
						<button type="button"><a href="../answer/answerInsertForm.jsp">정보처리기능사</a></button>
						<button type="button"><a href="#">정보기기운용기능사</a></button>
						<button type="button"><a href="#">한식조리기능사</a></button>
						<button type="button"><a href="#">제빵기능사</a></button>
					<div>
					
					
						
						
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	
 </div>
</body>
</html> 
