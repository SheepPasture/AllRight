<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
 <link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 
	
	<!-- calendar -->
	<!-- <link href='/allRight/resources/css/fullcalendar.min.css' rel='stylesheet' />
	<link href='/allRight/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
	<script src='/allRight/resources/js/moment.min.js'></script> 
	<script src='/allRight/resources/js/jquery.min.js'></script> 
	<script src='/allRight/resources/js/fullcalendar.min.js'></script>
	 -->

	<!-- style -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	
   	<link href="html/image_slider/css/style.css" rel="stylesheet" type="text/css" />
   	<link href = "https://fonts.googleapis.com/css?family= Open + Sans "rel = "stylesheet">
   	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
   	
   	<!-- CSS  -->
   	
	<link href="/allRight/resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">

	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	

	<!-- JQuery -->

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

    
<!-- HEADER -->
<header>
			
    <!-- MENU BLOCK -->
    <div class="menu_block">
    
        <!-- CONTAINER -->
        <div class="container clearfix">
            
            <!-- LOGO -->
            <div class="logo pull-left">
                <a href="<%= request.getContextPath() %>/index.jsp" ><span class="b1">A</span><span class="b2">L</span><span class="b2">L</span><span class="b3">R</span><span class="b4">I</span><span class="b4">G</span><span class="b4">H</span><span class="b5">T</span></a></a>
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
                        <li class="sub-menu activ" >
                        	<a href="<%= request.getContextPath() %>/selectList.ann">공지사항</a>
                        	<ul>
                        	<li><a href="<%= request.getContextPath() %>/selectList.ann">공지사항</a></li>
                        	<li><a href="<%= request.getContextPath() %>/selectList.ne">뉴스</a></li>
                        	</ul>
                        </li>
                        <li class="sub-menu activ">
							<a href="javascript:void(0)">커뮤니티</a>
							<ul>
								<li class="active"><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">게시판</a>
								</li>
								<li><a href="<%= request.getContextPath() %>/views/licenseinfo/licenseinfoList.jsp">자격증 정보</a></li>
							</ul>
						</li>
                        <li class="sub-menu active">
                            <a href="javascript:void(0)">마이페이지</a>
                            <ul>
                                <li><a href="<%= request.getContextPath() %>/views/myPage/myPageMain.jsp">회원정보수정</a></li>
                                <li><a href="<%= request.getContextPath() %>/lMylist.li">관심 자격증 정보</a></li>
                                <li><a href="<%= request.getContextPath() %>/bMyList.bo">게시글 관리</a></li>
                                <li><a href="<%= request.getContextPath() %>/views/myPage/viewTest.jsp">기출문제 관리</a></li>
                                <li><a href="<%= request.getContextPath() %>/views/answer/answerList.jsp">기출문제 정보</a></li>

                            </ul>
                        </li>
                    </ul>
                </nav>
            </div><!-- //MENU -->
            
        </div><!-- //MENU BLOCK -->
    </div><!-- //CONTAINER -->

    
</header><!-- //HEADER -->

</body>
</html>
