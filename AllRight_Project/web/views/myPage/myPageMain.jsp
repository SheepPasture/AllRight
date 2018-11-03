<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
	<meta charset="utf-8">
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
										<li><a href="views/notice/noticeList.jsp" >공지사항</a></li>
										<li><a href="views/community/communityList.jsp" >커뮤니티</a></li>
										<li><a href="license/licenseinfo.jsp" >자격증정보</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div><!-- //MENU -->
				</div><!-- //MENU BLOCK -->
			</div><!-- //CONTAINER -->
		</header><!-- //HEADER -->
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav" >
					<p><a href="updateMember.jsp">정보수정</a></p>
					<p><a href="schedule.jsp">일정관리</a></p>
					<p><a href="viewboard.jsp">게시글 관리</a></p>
					<p><a href="viewTest.jsp">기출문제 관리</a></p>
				</div>
			
				
			</div>
			<div id = showView style="display:inline-block; background-color: '#FFFFF0';">asdasd</div>
		</div>
		
		<script>
			$(function(){
				$('.sidenav').click(function(){
					console.log($('.sidenav').val());
					$('#showView').load($(this).attr('href'),function(){

					      $('#showView').show();
				});
					return false;
			});
		

   		});

   
		</script>	
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div> 
</body>
</html>