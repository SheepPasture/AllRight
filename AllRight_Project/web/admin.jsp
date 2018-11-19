<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   

%>


<!DOCTYPE html>
<head>
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
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
  	<!-- <script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> -->   
	<script src="/allRight/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.prettyPhoto.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/superfish.min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/owl.carousel.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/animate.js" type="text/javascript"></script>
	<script src="/allRight/resources/js/jquery.BlackAndWhite.js"></script>
	<script src="/allRight/resources/js/myscript.js" type="text/javascript"></script>
	
	
	
	<style type="text/css">
	
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
    
	.logo a {font-size:22px;}
	

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
	
	.loginArea{
		position : relative;
		top : 40px;
		left : 550px;
	}
	
	</style>

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
                <a href="<%= request.getContextPath() %>/admin.jsp" ><span class="b1">A</span><span class="b2">L</span><span class="b2">L</span><span class="b3">R</span><span class="b4">I</span><span class="b4">G</span><span class="b4">H</span><span class="b5">T</span></a></a>
            </div><!-- //LOGO -->
           
          
          
          <!-- 로그인 폼  -->
		
			<div class="loginArea" >
	 <% if(m != null && m.getUserId().equals("admin")) {%>
		
		<div style="float:left; width:200px;">
		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<div id="userInfo" style = "padding-top:10px;">
			<label><%= m.getUserName() %>님의 방문을 환영합니다.</label><br>

			<%-- <label> 현재 포인트 : <%= pt.getPoint() %> 누적 포인트 : <%= pt.getTotalPoint() %></label>

 		 	<label> 현재 레벨 :Lv.<%= level %></label> --%>
			
			
		</div>
		
		</div>
		
		<div class="btns" style = "float:left">
				<input type="button" class="btn btn-danger" value="로그아웃" onclick="logout()" />
			</div>
			
		</form>

	<% } else {
	request.setAttribute("msg","관계자 외에 접근이 불가능한 페이지입니다.");
	request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
} %>
	
	</div>
            
        </div><!-- //MENU BLOCK -->
    </div><!-- //CONTAINER -->

    
</header><!-- //HEADER -->
		
		

		
		<script>
			
		function logout(){
			location.href = "/allRight/mLogout.me";
		}
		
		
		</script>
	
	
	

</div>
</body>
</html>

