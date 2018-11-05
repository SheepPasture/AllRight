<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
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
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-md-1">글번호</th>
								<th class="col-md-6 text-center">글제목</td>
								<th class="col-md-1">작성자</th>
								<th class="col-md-1">조회수</th>
								<th class="col-md-1">작성일</th>
							</tr>
						</thead>
						<tbody>
							<th class="col-md-1">1</th>
							<th class="col-md-6 text-center">글제목입니다.</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">78</th>
							<th class="col-md-1">2018-10-29</th>						
						</tr>
						<tr>
							<th class="md-1 ">2</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">351</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">3</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">104</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						<tr>
							<th class="md-1">4</th>
							<th class="col-md-6 text-center">글제목</td>
							<th class="col-md-1">admin</th>
							<th class="col-md-1">15</th>
							<th class="col-md-1">2018-10-29</th>	
						</tr>
						</tbody>
					</table> 
				</div>
				<div class="col-sm-10 text-right">
					<button type="button"><a href="../announcement/ANNInsertForm.jsp">작성하기</a></button>
				<div>
			</div>
		</div>
	
		<!-- FOOTER -->
		<footer>
				
		</footer><!-- //FOOTER -->
	
	</div>
</body>
</html>