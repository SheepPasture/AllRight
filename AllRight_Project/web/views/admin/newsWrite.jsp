<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.board.model.vo.*, com.sheep.jsp.news.model.vo.*"%>
    

<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   

%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="/allRight/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/allRight/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>뉴스 게시판 수정</title>
	 <script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/allRight/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/allRight/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="/allRight/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/allRight/assets/css/themify-icons.css" rel="stylesheet">
	
	
	 <style type="text/css">
   
   td{
      font-weight: bold;
   }
   
   .name{
      width : 420px;
      text-overflow : ellipsis;
      white-space : nowrap;
      overflow : hidden;
      display : block;
      padding-left : 0px;
      
   }
   
   .name2{
      width : 450px;
      text-overflow : ellipsis;
      white-space : nowrap;
      overflow : hidden;
      display : block;
      padding-top : 15px;
   }
   
   </style>
</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<%= request.getContextPath() %>/admin.jsp"  class="simple-text">
                <b>A L L</b> R I G H T 
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="<%= request.getContextPath() %>/admin.jsp">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                 <li>
                    <a href="<%= request.getContextPath() %>/selectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>공지 게시판 수정</p>
                    </a>
                </li>
                <li class="active">
                    <a href="<%= request.getContextPath() %>/newsSelectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>뉴스 게시판 수정</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/views/admin/List.jsp">
                        <i class="ti-face-sad"></i>
                        <p>신고된 글,회원 관리</p>
                    </a>
                </li>
             <li>
                    <a href="<%= request.getContextPath() %>/views/admin/newLicense.jsp">
                        <i class="ti-plus"></i>
                        <p>자격증 추가</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/views/admin/viewCount.jsp">
                        <i class="ti-plus"></i>
                        <p>사이트 접속자 수 조회</p>
                    </a>
                </li>
                <!-- 
                <li>
                    <a href="maps.html">
                        <i class="ti-map"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li> -->
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">공지 게시판 수정</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="loginArea" >
	 <% if(m != null && m.getUserId().equals("admin")) {%>
		
		<div style="float:left; width:250px;">
		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<div id="userInfo" style = "padding-top:23px;">
			<label><%= m.getUserName()%>님의 방문을 환영합니다.</label><br>

		</div>
		
		</div>
		
		<div class="btns" style = "float:left; padding-right:15px;">
				<input type="button" class="btn btn-danger" value="로그아웃" onclick="logout()" />
			</div>
			
		</form>

	<% } else {
	request.setAttribute("msg","관계자 외에 접근이 불가능한 페이지입니다.");
	request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
} %>
	
	</div>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">   
         <form action="<%= request.getContextPath()%>/nInsert.ad"
				method="post" enctype="multipart/form-data">
				<div class="col-sm-8 text-left">
					<br>
					<h3 align="left">뉴스 작성하기</h3>
					<div class="form-group"> 
						<label for="subject">제목</label> 
						<input type="text" class="form-control" name ="subject" id="subject" placeholder="제목을 입력하세요"> 
					</div> 
					<div class="form-group"> 
						<label for="File">뉴스 사진</label> 
						<input type="file" id="File" name="file"> 
					</div> 
					<div class="form-group"> 
						<label for="content">뉴스 내용</label> 
						<textarea class="form-control" cols="60" rows="10" name="content" id="content" style="resize:none;" placeholder="최대 3000자 이내로 입력하세요."></textarea> 
					</div> 
				</div>

					
			 		<button type="submit" class="btn btn-success">등록하기</button>
			 		<button type="reset" class="btn btn-danger" onclick="back()">취소하기</button>
			 		<br><br><br>
			 		</form>
			 		
			 		<script>
			 			
			 			function back(){
			 				location.href="/allRight/newsSelectList.ad";
			 			}
			 			
			 		</script>
         
         <br><br><br>
         <br><br><br>
            </div>
        </div>

         <footer class="footer">
            <div class="container-fluid">
               
            </div>
        </footer>

		
    </div>
</div>


</body>

 
</html>