<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.board.model.vo.*"%>
    

<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   
  	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
  	bPageInfo bpi = (bPageInfo)request.getAttribute("bpi");
	int listCount = bpi.getListCount();
	int currentPage = bpi.getCurrentPage();
	int maxPage = bpi.getMaxPage();
	int startPage = bpi.getStartPage();
	int endPage = bpi.getEndPage();  

%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="/allRight/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/allRight/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>신고된 글,회원 관리</title>

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
                <li>
                    <a href="<%= request.getContextPath() %>/newsSelectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>뉴스 게시판 수정</p>
                    </a>
                </li>
                <li class="active">
                    <a href="<%= request.getContextPath() %>/bReportList.ad">
                        <i class="ti-face-sad"></i>
                        <p>신고된 글 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/bReportList.ad">
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
                    <a class="navbar-brand" href="#">신고된 글 관리</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="loginArea" >
	 <% if(m != null && m.getUserId().equals("admin")) {%>
		
		<div style="float:left; width:250px;">
		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<div id="userInfo" style = "padding-top:23px;">
			<label><%= m.getUserName() %>님의 방문을 환영합니다.</label><br>

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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">신고된 글 List</h4>
                                <p class="category">신고가 많이 들어온 순서대로 나타납니다.</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                        <th width="200px;">게시글 번호</th>
                                    	<th>제목</th>
                                    	<th>작성자</th>
                                    	<th>작성 날짜</th>
                                    	<th>신고 수</th>
                                    </thead>
                                    <tbody>
                                    <%for (Board b : list) { %>
                                    <tr>
                                    		<input type ="hidden" value="<%= b.getbId()%>">
                                        	<td style="padding-left:40px;"><%= b.getbNO() %></td>
                                        	<td><%= b.getbTitle() %></td>
                                        	<td><%= b.getbWriter() %></td>
                                        	<td><%= b.getbDate() %></td>
                                        	<td><%= b.getReport() %></td>
                                    </tr>
                                    
                                    <% } %>
                                        <!-- <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>$36,738</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                        <tr>
                                        	<td>2</td>
                                        	<td>Minerva Hooper</td>
                                        	<td>$23,789</td>
                                        	<td>Curaçao</td>
                                        	<td>Sinaai-Waas</td>
                                        </tr>
                                        <tr>
                                        	<td>3</td>
                                        	<td>Sage Rodriguez</td>
                                        	<td>$56,142</td>
                                        	<td>Netherlands</td>
                                        	<td>Baileux</td>
                                        </tr>
                                        <tr>
                                        	<td>4</td>
                                        	<td>Philip Chaney</td>
                                        	<td>$38,735</td>
                                        	<td>Korea, South</td>
                                        	<td>Overland Park</td>
                                        </tr>
                                        <tr>
                                        	<td>5</td>
                                        	<td>Doris Greene</td>
                                        	<td>$63,542</td>
                                        	<td>Malawi</td>
                                        	<td>Feldkirchen in Kärnten</td>
                                        </tr>
                                        <tr>
                                        	<td>6</td>
                                        	<td>Mason Porter</td>
                                        	<td>$78,615</td>
                                        	<td>Chile</td>
                                        	<td>Gloucester</td>
                                        </tr> -->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                        
                        <div class="col-md-11 text-center" align="center" >
            
               <button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/bReportList.ad?currentPage=1'"><<</button>
               <%   if(currentPage <= 1) {%>
               <button class="btn btn-default" disabled><</button>
               <% }else {%>
               <button class="btn btn-default" onclick="location.href='<%= request.getContextPath()%>/bReportList.ad?currentPage=<%= currentPage - 1 %>'"><</button>
               <% } %>   
               
               <% for(int p = startPage; p <= endPage; p++) { 
                     if(p == currentPage){ %>
                     <button class="btn btn-default" disabled><%= p %></button>
               <%   } else { %>
                     <button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/bReportList.ad?currentPage=<%= p%>'"><%= p %></button>
               <%   } %>
               <% } %>      
               
               <% if(currentPage >= maxPage) {%>   
               <button class="btn btn-default" disabled>></button>
               <% } else { %>
               <button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/bReportList.ad?currentPage=<%= currentPage + 1%>'">></button>
               <% } %>
               <button class="btn btn-default" onclick="location.href='<%= request.getContextPath() %>/bReportList.ad?currentPage=<%= maxPage%>'">>></button>
            </div>
                        
                    </div>


                    <!-- <div class="col-md-12">
                        <div class="card card-plain">
                            <div class="header">
                                <h4 class="title">Table on Plain Background</h4>
                                <p class="category">Here is a subtitle for this table</p>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover">
                                    <thead>
                                        <th>ID</th>
                                    	<th>Name</th>
                                    	<th>Salary</th>
                                    	<th>Country</th>
                                    	<th>City</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>1</td>
                                        	<td>Dakota Rice</td>
                                        	<td>$36,738</td>
                                        	<td>Niger</td>
                                        	<td>Oud-Turnhout</td>
                                        </tr>
                                        <tr>
                                        	<td>2</td>
                                        	<td>Minerva Hooper</td>
                                        	<td>$23,789</td>
                                        	<td>Curaçao</td>
                                        	<td>Sinaai-Waas</td>
                                        </tr>
                                        <tr>
                                        	<td>3</td>
                                        	<td>Sage Rodriguez</td>
                                        	<td>$56,142</td>
                                        	<td>Netherlands</td>
                                        	<td>Baileux</td>
                                        </tr>
                                        <tr>
                                        	<td>4</td>
                                        	<td>Philip Chaney</td>
                                        	<td>$38,735</td>
                                        	<td>Korea, South</td>
                                        	<td>Overland Park</td>
                                        </tr>
                                        <tr>
                                        	<td>5</td>
                                        	<td>Doris Greene</td>
                                        	<td>$63,542</td>
                                        	<td>Malawi</td>
                                        	<td>Feldkirchen in Kärnten</td>
                                        </tr>
                                        <tr>
                                        	<td>6</td>
                                        	<td>Mason Porter</td>
                                        	<td>$78,615</td>
                                        	<td>Chile</td>
                                        	<td>Gloucester</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div> -->


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