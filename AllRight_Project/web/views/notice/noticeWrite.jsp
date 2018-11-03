<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

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
										<li><a href="../notice/noticeList.jsp" >공지사항</a></li>
										<li><a href="../community/communityList.jsp" >커뮤니티</a></li>
										<li><a href="../license/licenseinfo.jsp" >자격증정보</a></li>
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
				<div class="col-sm-2 sidenav">
					<p><a href="../notice/noticeList.jsp">공지사항</a></p>
					<p><a href="../community/communityList.jsp">커뮤니티</a></p>
					<p><a href="../license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<br>
					<h3 align="left">글쓰기</h3>
					  <div id="summernote"  class="col-sm-10" style="border: 1px solid tomato"></div>
					  
					  <script>
 					    $(document).ready(function() {
					        $('#summernote').summernote({
					        	height: 300,
					        	focus: true
					        });
					    }); 
					  </script>
				</div>
			</div>
			<br />
					<button type="submit">수정하기</button>
			 		<button type="submit">작성하기</button>
			 		<button type="button"><a href="../notice/noticeList.jsp" >되돌아가기</a></button>
		</div>

	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>