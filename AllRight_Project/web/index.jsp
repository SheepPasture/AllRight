<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.board.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   
  	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist"); 

%>


<!DOCTYPE html>
<head>
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<style type="text/css">
	
		
	
	.realtime-nav{
	
		
		border :solid;
		
	}
	
	.realtime-rank{
	
	/* 	font-family: 'Roboto', sans-serif; 
		margin:3px;	*/
		/* font-family: 'Roboto', sans-serif;
		font-family: 'Poor Story', cursive; */
		font-size: 20px;
	}
	
	.notice{
		
		margin-left: 300px;
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
		<%@ include file="/views/common/header.jsp" %>
		
		
		<div class="container-fluid text-center">    
			<div class="row content">
				<br />
				<div class="col-sm-1 sidenav">
					
				</div>
				<div class="col-sm-8 text-center">
					<!-- <h2 align="left">뉴스</h2> -->
					
					
					
			 <div class="realtime" style="float:left; width:50%;">
				<div id="refresh">
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
			
			<!-- 
				<div class="realtime-nav" >
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
			
				
				<!-- 로그인 폼  -->
		
			<div class="loginArea" style="float:left; width:50%;">
	<%if ( m == null ) { %>

		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<table>
				<tr>
					<td>
						<label class="text">ID : </label>
					</td>
					<td>
						<input type="text" name="inputId" id="inputId">
					</td>
				</tr>
					<tr>
					<td>
						<label class="text">PWD : </label>
					</td>
					<td>
						<input type="password" name="inputPassword" >
					</td>
				</tr>
			</table>
			
			<div class="btns">
				<input type="button" value="로그인" onclick="login()"/>
				<input type="button" value="회원가입" onclick="insert()"/> 
			</div>
			
		</form>
		<% } else { %>
		<div id="userInfo">
			<label><%= m.getUserName() %>님의 방문을 환영합니다.</label><br>
			<label> 현재 포인트 : <%= pt.getPoint() %> 누적 포인트 : <%= pt.getTotalPoint() %></label>

 		 	<label> 현재 레벨 :Lv.<%= level %></label>
			<div class="btns" >
				<input type="button" value="로그아웃" onclick="logout()" />
			</div>
			
		</div>
	<% } %>
	
	</div>
					
					 
				</div>
				
	
				
				
				
			</div>
			
			<br><br><br>
			<br><br><br>
		</div>
		
		<script>
		
		function login(){
			
			$('#loginForm').submit();
			
			<%-- 
			<% if ( $("#inputId").val().equls("admin")) {%> 
			
			
			$('#loginForm').submit();
			location.href = "/allRight/admin.jsp";
			
			
			<% } else {%>
				
			$('#loginForm').submit();
			
			<% } %> --%>
		}
			
		function insert(){
			
			location.href = "/allRight/views/member/memberInsertView.jsp";
			
		}
	
		function logout(){
			
			location.href = "mLogout.me";
		}
		
		
		/* function autoRefresh_div(){
			
			var currentLocation = window.location;
			$("#refresh").load(currentLocation + ' #refresh')
		}
		
		setInterval('autoRefresh_div()', 3000); */
			
		
		
		
		 //실시간 순위
		$(function(){
			
			$.ajax({
				
				url: '/allRight/top5.bo',
				dataType: "json",
				type : "get",
				success : function(data){
					
					$table = $('#boardTop5 tbody');
					
					$("#boardTop5").find("tr:gt(0)").remove();
					
					for(var i in data){
						
						console.log(data[i]);
						var $trBoard = $('<tr>');
						var $tdBoardTitle = $('<td>').text(data[i].bTitle);
						
						$trBoard.append($tdBoardTitle);
						
						$table.append($trBoard);
					}
				}, error : function(data){
					
					console.log("top5 조회 실패!");
				}
				
			});
			
			timer = setInterval (function() {
			$.ajax({
				
				url: '/allRight/top5.bo',
				dataType: "json",
				type : "get",
				success : function(data){
					
					$table = $('#boardTop5 tbody');
					
					$("#boardTop5").find("tr:gt(0)").remove();
					
					for(var i in data){
						
						console.log(data[i]);
						var $trBoard = $('<tr>');
						var $tdBoardTitle = $('<td>').text(data[i].bTitle);
						
						$trBoard.append($tdBoardTitle);
						
						$table.append($trBoard);
					}
				}, error : function(data){
					
					console.log("top5 조회 실패!");
				}
				
			});
			
			}, 10000);
			

		});
		
		</script>
	
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>

