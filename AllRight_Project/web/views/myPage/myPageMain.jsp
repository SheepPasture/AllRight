<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"%>

<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<head>
	
	<title>ALLRight</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    

</head>
<body>

	<!-- PAGE -->
	<div id="page">
	
	<!-- HEADER -->
	
		<%@ include file="/views/common/header.jsp" %>
	<!-- HEADER-END -->
		<%--  --%>
		<br>
			<div class="container-fluid text-center">    
			<div class="row content">
				<div class="col-sm-2 sidenav"  style="display:inline-block; "  >
					<p><a id="s" href="/allRight/views/myPage/myPageMain.jsp">회원정보수정</a></p>
					<p><a href="/allRight/views/myPage/schedule.jsp">관심자격증 정보</a></p>
					<p><a href="<%= request.getContextPath() %>/bMyList.bo" >게시글 관리</a></p>
					<p><a href="/allRight/views/myPage/viewTest.jsp">기출문제 관리</a></p>
				</div>
				<br>
				<div class="col-sm-2 sidenav"  style="display:inline-block; background:ivory"  >
				
			<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>
				
				 </div> 
			
			  	<div id="showView" style="width:70%;height:100%; display:inline-block; ">
					<div src="viewMemberInfo.jsp">
						회원 정보	
						아이디 : = m.getUserId() <br>
						이름 : = m.getUserName() <br>
						이메일 : = m.getEmail <br>
						관심자격증 : = m.getSeloption <br> 
						포인트	:	10/2000<br>
						<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button> 
					</div> 
				</div>
			
		</div>
	<%-- <div class="container-fluid text-center">    
	<%@ include file="/views/common/myPageNav.jsp" %>
		<div class="container-fluid text-center" style="background:ivory">    
			<div class="row content">
				<br>
			<!-- 		<div class="col-sm-2 sidenav"  style="display:inline-block;"  > -->
						<p><a id="s" href="/allRight/myPage/viewMemberInfo.jsp">정보관리</a></p>
						<p><a href="/allRight/myPage/schedule.jsp">일정관리</a></p>
						<p><a href="/allRight/myPage/bMyList.bo" >게시글 관리</a></p>
						<p><a href="/allRight/myPage/viewTest.jsp">기출문제 관리</a></p>
			<!-- 		</div> -->
		<div>
		</div>
			</div>
			
		</div> --%>
			<!-- <div class="row content" style="display:inline-block;" > -->
			<%-- 
				<div id="showView" style="width:70%;height:100%; display:inline-block; ">
					<!-- <div src="viewMemberInfo.jsp"> -->
				회원 정보	
				아이디 : <%--= m.getUserId() --%> <br>
				<%-- 이름 : = m.getUserName() <br>
				이메일 : = m.getEmail <br>
				관심자격증 : = m.getSeloption <br> 
				포인트	:	10/2000<br> --%>
	<!-- 			<button id="mUpdate" onclick="mUpdate();">정보 수정</div>
				</button> 
			</div>
			
		</div> -->
		
		<script>
		function mUpdate(){
			location.href="/allRight/views/myPage/updateMember.jsp";
		}
	
		/* function changeInfo(){
			location.href="/myWeb/views/member/memberUpdateForm.jsp";
		} */
	/* 	/* 	$(function(){
				/* $('#showView').css("color","red"); 
				$('#s').css("color","red"); 
				
				console.log($('div:last'));
				$('.sidenav').children().click(function(){
				/* 	console.log($(this).children().attr('href')); 
					 console.log($(this));
					
						 $('#showView').load($(this).children().attr('href'),function(){
						 
					      $('#showView').show();
						}); 
					
					return false;
				});
				
		
			$('#mUpdate').click(function(){
				 $('#showView').load('updateMember.jsp');
			}) */
	
   			/* }); */ 

		</script>	
	
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>