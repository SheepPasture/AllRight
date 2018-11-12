<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>

<%
	Member m = (Member) request.getAttribute("member");
/* m.setUserId("test1");
m.setUserName("test1"); */

	UserLicense ul = (UserLicense) request.getAttribute("userLicense");
%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<!-- <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>update Member</title>
<link href="/allRight/css/bootstrap.min.css" rel="stylesheet">
font awesome
<link rel="stylesheet"
	href="/allRight/resources/css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
Custom style
<link rel="stylesheet" href="/allRight/resources/css/style.css"
	media="screen" title="no title" charset="utf-8">
 -->
<!-- 
<style>
.outer {
	width: 600px;
	height: 500px;
	background: black;
	color: white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

#idCheck, #ckZip, #goMain, #updateBtn, #deleteBtn {
	background: orangered;
	border-radius: 5px;
	width: 80px;
	height: 25px;
	text-align: center;
}

#idCheck:hover, #ckZip:hover, #updateBtn:hover, #goMain:hover, ,
	#deleteBtn:hover {
	cursor: pointer;
}

td {
	text-align: right;
}

#ckZip, #updateBtn {
	background: lightgreen;
	color: black;
}

#updateBtn, #goMain, #deleteBtn {
	display: inline-block;
}
</style>
 -->
</head>
<!-- HEADER -->
<body>
<%@ include file="/views/common/header.jsp"%>
<!-- HEADER-END -->

<br>
<div class="container-fluid text-center">
	<div class="row content">
		<!-- NAV -->
		<div class="col-sm-2 sidenav" style="display: inline-block;">
			<%@ include file="/views/common/myPageNav.jsp"%>
		</div>
		<!-- NAV END-->
		<br>
		<div class="col-sm-2 sidenav"
			style="display: inline-block; background: ivory"></div>

		<div id="showView"
			style="width: 70%; height: 100%; display: inline-block;">

			<article class="container">


				<div class="page-header">
					<h1>
						<small>회원 정보 수정</small>
					</h1>
				</div>

				<form class="form-horizontal" id="updateForm"
					action="/allRight/mUpdate.me" method="post">
					<div class="form-group">
						<label class="col-sm-3 control-label" for="userId">유저아이디</label>
						<div class="col-sm-6">
							<input class="form-control" id="userId" type="text" readonly
								placeholder="sd<%-- <%=m.getUserId()%> --%>">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="password">비밀번호</label>
						<div class="col-sm-6">
							<input class="form-control" id="password" type="password"
								placeholder="비밀번호">
							<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="passwordCheck">비밀번호
							확인</label>
						<div class="col-sm-6">
							<input class="form-control" id="passwordCheck"
								type="password" placeholder="비밀번호 확인">
							<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="userName">닉네임</label>
						<div class="col-sm-6">
							<input class="form-control" id="userName" type="text"
								placeholder="이름">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label" for="email">이메일</label>
						<div class="col-sm-6">
							<input class="form-control" id="email" type="email"
								placeholder="이메일">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label" for="userId">관심자격증</label>
						<div>
							<select name="" id="">
								<option value="">아이티</option>
								<option value="">건축</option>
								<option value="">기타</option>
							</select> <select name="" id="">
								<option value="">정처기</option>
								<option value="">mos</option>
								<option value="">컴활</option>
							</select>


						</div>
						<br>


						<div class="form-group">
							<div class="col-sm-12 text-center">
								<button class="btn btn-primary" onclick="memberUpdate();">정보
									수정</button>
								<button class="btn btn-danger" onclick="memberDelete();">회원
									탈퇴</button>
							</div>
						</div>
				</form>
				

			</article>


		</div>

	</div>



	<script>

	console.log($('#password~p').text());
		/* function(){
			$('#password~input').text()+="비밀번호가 일치하지 않습니다.";
			/* if($('#password').val != $('#passwordCheck').val){ */
			/* 	$('#password~input').text()="비밀번호가 일치하지 않습니다."; */
			/* console.log("불일치");
			}else{
			console.log("일치");	
			} 
		} */
     	function memberUpdate() {
			$("#updateForm").submit();
			
		<%-- 	location.href = "<%= request.getContextPath() %>/mUpdate.me"
			 --%>
			
		}
    	function memberDelete(){
         	<%-- 	location.href = "/myWeb/mDelete.me?userno=<%=m.getUserNo()%>"; --%>
         	}
		
		<%-- function memberDelete() {
			location.href = "/allRight/mDelete.me?userId=<%=m.getUserId()%>";
		} --%>
      
      </script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../js/bootstrap.min.js"></script>
	</body>
</html>
