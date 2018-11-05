<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.announcement.model.vo.*" %>
 <% ArrayList<Announcement> list = (ArrayList<Announcement>)request.getAttribute("list"); %>
 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">	
<title>ALLRight</title>
<%-- <script src="<%= request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script> --%>
    
	<!-- CSS -->
	<link href="../../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css" />
    
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500italic,700,500,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">	
	
	<script src="../../resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="../../resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../../resources/js/jquery.flexslider-min.js" type="text/javascript"></script>
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
								<li class="scroll_btn"><a href="../announcement/ANNList.jsp" >공지사항</a></li>
								<li class="scroll_btn"><a href="../community/communityList.jsp" >커뮤니티</a></li>
								<li class="scroll_btn"><a href="../license/licenseinfo.jsp" >자격증정보</a></li>
								<li class="scroll_btn"><a href="../news/newLists.jsp" >뉴스</a></li>
								<li class="scroll_btn last"><a href="../myPage/myPageMain.jsp" >마이페이지</a></li>
								<li class="sub-menu">
									<a href="javascript:void(0);" >게시판</a>
									<ul>
										<li><a href="views/announcement/ANNList.jsp" >공지사항</a></li>
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
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="#">공지사항</a></p>
					<p><a href="#">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-center">
					<h2 align="left">공지사항</h2>
					<table class="table table-hover" id="listArea">
					<thead>
						<tr>
							<th class="col-md-1">글번호</th>
							<th class="col-md-6 text-center">글제목</th>
							<th class="col-md-1">작성자</th>
							<th class="col-md-1">조회수</th>
							<th class="col-md-1">작성일</th>
						</tr>
					</thead>
					<tbody>
  							<% for(Announcement a: list){ %>
						<tr>
							<th><%= a.getAno() %></th>
							<th><%= a.getAtitle()%></th>
							<th>관리자</td>
							<th><%= a.getAcount() %></th>
							<th><%= a.getAdate() %></th>
						</tr>
							<% } %>  
	<!-- 					<tr>
							<th class="col-md-1">관리자</th>
							<th class="col-md-6 text-center">관리자</th>
							<th class="col-md-1">관리자</th>
							<th class="col-md-1">관리자</th>
							<th class="col-md-1">관리자</th>
						</tr>  -->
					</tbody>
				</table>  
			</div>
		 	<div class="col-sm-10 text-right">
				<button type="button"><a href="../announcement/ANNInsertForm.jsp">작성하기</a></button>
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>