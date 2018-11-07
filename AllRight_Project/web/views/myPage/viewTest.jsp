<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"%>

<%-- <%
	Member m = (Member)session.getAttribute("member");

%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>update Member</title>
 	<link href="/allRight/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="/allRight/resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="/allRight/resources/css/style.css" media="screen" title="no title" charset="utf-8">

 
<style>
	.outer{
		width:600px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	
	#idCheck, #ckZip, #goMain, #updateBtn, #deleteBtn {
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
	
	#idCheck:hover, #ckZip:hover, #updateBtn:hover, #goMain:hover, , #deleteBtn:hover {
		cursor:pointer;
	}
	td {
		text-align:right;
	}
	#ckZip, #updateBtn {
		background:lightgreen;
		color:black;
	}
	#updateBtn, #goMain, #deleteBtn {
		display:inline-block;
	}
</style>

</head>
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
				 </div> 
			
			  	<div id="showView" style="width:70%;height:100%; display:inline-block; " >
					
					<article class="container" >

   
        <div class="page-header">
    	    <h1 ><small>기출문제 오답</small></h1>
        </div>

        																																																																																																	1	
 
      </article>
					
					
			</div>
			
		</div>


       <script>
     	function memberUpdate() {
			$("#updateForm").submit();
		}	
      </script>	

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
  </body>
</html>
