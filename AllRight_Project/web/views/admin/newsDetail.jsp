<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.board.model.vo.*, com.sheep.jsp.news.model.vo.* , com.oreilly.servlet.*"%>
    

<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   
  	News n = (News)request.getAttribute("news");

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
	
	
	
   
  <style>
		.detail td{
			text-align : left;
			width:1000px;
			border-bottom : 1px solid lightgray;
			padding : 10px;
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
                    <a href="<%= request.getContextPath() %>/bReportList.ad">
                        <i class="ti-face-sad"></i>
                        <p>신고된 글 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/commentList.co">
                        <i class="ti-face-sad"></i>
                        <p>신고된 댓글 관리</p>
                    </a>
                </li>
             <li>
                    <a href="<%= request.getContextPath() %>/views/admin/newLicense.jsp">
                        <i class="ti-plus"></i>
                        <p>자격증 추가</p>
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
        <div class="col-sm-11 text-center">
					<div class= "outer">
						
						<table class="detail">
						<tr>
							<td colspan= "6" ><h3><%= n.getNTITLE() %></h3></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><label>관리자</label>
							<td>조회수</td>
							<td><label><%= n.getNCOUNT() %></label>
							<td>작성일</td>
							<td><label><%= n.getNDATE() %></label>
						</tr>
						<tr>
							<td colspan = "6">
								<div id="titleImgArea" align="center">
									<%if (n.getNFILE() != null) {%>
									<img id="titleImg" src="<%= request.getContextPath()%>/resources/newsUploadFiles/<%= n.getNFILE() %>">
									<% }  %>
									<!-- <img alt="" src="/allRight/resources/newsUploadFiles/newsImage1.jpg" /> -->
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<p id="contentArea"><%= n.getNCONTENT() %></p>
							</td>
						</tr>
						<tr>
							<td colspan = "6">
								<button onclick="location.href='newsSelectList.ad'" class="btn btn-primary">뉴스메뉴로 돌아가기</button>
								<form style="float:right;" method="post" enctype="multipart/form-data" action="<%= request.getContextPath()%>/nDelete.ad?nno=<%=n.getNNO()%>">
								<button  class="btn btn-danger">삭제하기</button>
								</form>
								<button style="float:right; margin-right:5px;" onclick="location.href='<%= request.getContextPath()%>/nUpView.ad?nno='+<%=n.getNNO() %>" class="btn btn-warning">수정하기</button>

								
							</td>
						</tr>
						</table>

					
								<br><br><br>
							</div>
							

					</div>
			 		
	
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