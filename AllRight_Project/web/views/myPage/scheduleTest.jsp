<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point, com.sheep.jsp.news.model.vo.*,java.util.*, com.sheep.jsp.board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   
  	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");
  	 ArrayList<News> nlist = (ArrayList<News>)request.getAttribute("list"); 
%>


<!DOCTYPE html>
<head>
<link href="/allRight/resources/css/style.css" rel="stylesheet"
	type="text/css" />
<script src="/allRight/resources/js/jquery.min.js"
	type="text/javascript"></script>
<title>ALLRight</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<style type="text/css">
.realtime-nav {
	border: solid;
}

.realtime-rank {
	/* 	font-family: 'Roboto', sans-serif; 
		margin:3px;	*/
	/* font-family: 'Roboto', sans-serif;
		font-family: 'Poor Story', cursive; */
	font-size: 20px;
}

.notice {
	margin-left: 300px;
}
 	.col-sm-8{
		font : 12px/20px 돋움;
		color:#424242;
		background:#fff;
		padding:10px;
		width:500px;
		margin:0;
	}
	.col-sm-8 h1 {
		margin:0;
		font-size:20px;
		text-shadow:2px 2px 2px #aeaeae;
	}
	.col-sm-8 h2{
		margin:5px 0;
		padding:0;
	}

	.col-sm-8 h2 a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:#8f8f8f;
	}

	.col-sm-8 h2 a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		text-shadow:2px 2px 2px #aeaeae;
		text-decoration:none;
		margin:0;
		padding:10px;
		background:-moz-linear-gradient(top,#cecece,#8f8f8f);
		background:-webkit-gradient(linear,left top, left bottom, from(#cecece), to(#8f8f8f));
		-webkit-border-radius:5px;
		-moz-border-radius:5px;
		border-radius:5px;
	}

	.col-sm-8 :target h2 a,
	.col-sm-8 h2 a:focus,
	.col-sm-8 h2 a:hover,
	.col-sm-8 h2 :active {
		background:#2288dd;
		background:-moz-linear-gradient(top,#6bb2ff,#2288dd);
		background:-webkit-gradient(linear,left top, left bottom, from(#6bb2ff), to(#2288dd));
		color:#fff;
	}

	.col-sm-8 p {
		padding:0 10px;
		margin:0;
		height:0;
		overflow:hidden;
		-moz-transition:height 0.5s ease-in;
		-webkit-transition:height 0.5s ease-in;
		-o-transition:hegith 0.5s ease-in;
		transition:height 0.5s ease-in;
	}

	.col-sm-8 :target p{
		overflow: auto;
		height:100px;
	} 
</style>

<!-- <script>
		
		//BlackAndWhite
		$(window).load(function(){
			$('.client_img').BlackAndWhite({
				hoverEffect : true, // default true
				// set the path to BnWWorker.js for a superfast implementation
				webworkerPath : false,
				// for the images with a fluid width and height 
				responsive:true,
				// to invert the hover effect
				invertHoverEffect: false,
				// this option works only on the modern browsers ( on IE lower than 9 it remains always 1)
				intensity:1,
				speed: { //this property could also be just speed: value for both fadeIn and fadeOut
					fadeIn: 300, // 200ms for fadeIn animations
					fadeOut: 300 // 800ms for fadeOut animations
				},
				onImageReady:function(img) {
					// this callback gets executed anytime an image is converted
				}
			});
		});
	
	</script> -->

</head>
<body>

	<!-- PAGE -->
	<div id="page">

		<!-- HEADER -->
		<%@ include file="/views/common/header.jsp"%>


		<div class="container-fluid text-center">
			<div class="row content" >
				<br />
				<div class="col-sm-1 sidenav"></div>
				<div class="col-sm-8 text-center"style="border: 1px solid gold">
					<!-- <h2 align="left">뉴스</h2> -->

					<!-- <div class="main" > -->
					<div class="realtime"
						style="float: left; width: 50%;border: 1px solid gold">
						<h3>실시간 게시판 순위</h3>
						<div id="refresh"  >
							<table id="boardTop5" class="top5">
								<thead>
									<tr>
										<th></th>
										<th scope="cols">실시간 게시판 순위</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<div id="refresh" class="col-sm-4">
							<table id="">
								<thead>
									<tr>
										<th>뉴스</th>
									</tr>
									<tr><
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						<!-- <div class="realtime-nav" >

					<ul class="ah_l">
						<li class="">
							<span class="realtime-rank">1.</span>
							<span class="realtime-rank">정보통신</span>
						</li>
						<li class="">
							<span class="realtime-rank">2.</span>
							<span class="realtime-rank">조리<span>
						</li>
						<li class="">
							<span class="realtime-rank">3.</span>
							<span class="realtime-rank">건축</span>
						</li>
						<li class="">
							<span class="realtime-rank">4.</span>
							<span class="realtime-rank">전기</span>
						</li>
						<li class="">
							<span class="realtime-rank">5.</span>
							<span class="realtime-rank">제과제빵</span>
						</li>
					</ul>
				</div> -->
					</div>
					<div >
						<div class="col-sm-4" style="float: left; width: 50%;border: 1px solid gold">
							<h1>공지사항</h1>
							<div class="col-sm-4">
							<table id="#">
								<thead>
								
									
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
						</div>
						
					</div>


					<!-- 

		<div class="notice" style="float:left; width:33%;">
			<h3>공지사항</h3>
			<div>
				<ul>
					<li>
						<span class="realtime-rank">1.</span>
						<span class="realtime-rank">공지1</span>
					</li>
					<li>
						<span class="realtime-rank">2.</span>
						<span class="realtime-rank">공지2</span>
					</li>
					<li>
						<span class="realtime-rank">3.</span>
						<span class="realtime-rank">공지3</span>
					</li>
					<li>
						<span class="realtime-rank">4.</span>
						<span class="realtime-rank">공지4</span>
					</li>
					<li>
						<span class="realtime-rank">5.</span>
						<span class="realtime-rank">공지5</span>
					</li>
					
				</ul>
			</div>
		</div>
		
		 -->

					<%-- 
						<!-- 로그인 폼  -->

						<div class="loginArea" style="float: left; width: 50%;">
							<%
								if (m == null) {
							%>

							<form id="loginForm" action="/allRight/mLogin.me" method="post">
								<table>
									<tr>
										<td><label class="text">ID : </label></td>
										<td><input type="text" name="inputId"></td>
									</tr>
									<tr>
										<td><label class="text">PWD : </label></td>
										<td><input type="password" name="inputPassword">
										</td>
									</tr>
								</table>

								<div class="btns">
									<input type="submit" value="로그인" /> <input type="button"
										value="회원가입" onclick="insert()" />
								</div>

							</form>
							<%
								} else {
							%>
							<div id="userInfo">
								<label><%=m.getUserName()%>님의 방문을 환영합니다.</label><br> <label>
									현재 포인트 : <%=pt.getPoint()%> 누적 포인트 : <%=pt.getTotalPoint()%></label> <label>
									현재 레벨 :Lv.<%=level%></label>
								<div class="btns">
									<input type="button" value="로그아웃" onclick="logout()" />
								</div>

							</div>
							<%
								}
							%>

						</div> --%>


					<!-- </div> -->


				</div>
				
				<div class="col-sm-2" style="background: ivory">

					<!-- 로그인 폼  -->

					<div class="loginArea" style="float: left; width: 50%;">
						<%
							if (m == null) {
						%>

						<form id="loginForm" action="/allRight/mLogin.me" method="post">
							<div>
								<table>
									<tr>
										<td><label class="text">ID : </label></td>
										<td><input type="text" name="inputId"></td>
									</tr>
									<tr>
										<td><label class="text">PWD : </label></td>
										<td><input type="password" name="inputPassword">
										</td>
									</tr>
								</table>
							</div>
							<!-- <div class="btns"> -->
							<div >
								<div>
									<input type="submit" value="로그인" />
									<input type="button" value="회원가입" onclick="insert()" />
								</div>
							</div>

						</form>
						<%
							} else {
						%>
						<div id="userInfo">
							<label><%=m.getUserName()%>님의 방문을 환영합니다.</label><br> <label>
								현재 포인트 : <%=pt.getPoint()%> 누적 포인트 : <%=pt.getTotalPoint()%></label> <label>
								현재 레벨 :Lv.<%=level%></label>
							<div class="btns">
								<input type="button" value="로그아웃" onclick="logout()" />
							</div>

						</div>
						<%
							}
						%>

					</div>

				</div><!--로그인폼 끝  -->

				<br> <br> <br> <br> <br> <br>
			</div>


			<div class="row content"><!-- 행 div  -->
				<br />
				<div class="col-sm-1 sidenav"></div><!-- 왼쪽 공간 -->
				<div class="col-sm-8 text-center" style="border: 1px solid gold">
					<h1>자격증 목록</h1>
					
					<div id="html5" class="col-sm-3">
					<h2><a href="#html5">자격증 1 목록</a></h2>
					<p><a>게시판</a>	</p>
					</div>
					<div id="css3" class="col-sm-3">
						<h2><a href="#css3">자격증 2 목록</a></h2>
						<p><a>게시판</a>	</p>
					</div>
					<div id="api" class="col-sm-3">
						<h2><a href="#api">자격증 3목록</a></h2>
						<p><a>게시판</a>	</p>
					</div>
					
					
					
					
				</div>
			</div>
			
		</div>


		<script>
			function insert() {

				location.href = "/allRight/views/member/memberInsertView.jsp";

			}

			function logout() {

				location.href = "mLogout.me";
			}

			/* function autoRefresh_div(){
				
				var currentLocation = window.location;
				$("#refresh").load(currentLocation + ' #refresh')
			}
			
			setInterval('autoRefresh_div()', 3000); */

			//실시간 순위
			$(function() {

				$.ajax({

					url : '/allRight/top5.bo',
					dataType : "json",
					type : "get",
					success : function(data) {

						$table = $('#boardTop5 tbody');

						for ( var i in data) {

							console.log(data[i]);
							var $trBoard = $('<tr>');
							var $tdBoardTitle = $('<td>').text(data[i].bTitle);

							$trBoard.append($tdBoardTitle);

							$table.append($trBoard);
						}
					},
					error : function(data) {

						console.log("top5 조회 실패!");

					}

				});

			});

		</script>


		<!-- FOOTER -->
		<footer> </footer>
		<!-- //FOOTER -->


	</div>
	<!-- 메인끝  -->
</body>
</html>

