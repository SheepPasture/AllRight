<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userPoint.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>

<%
/* 	 Member m = (Member)session.getAttribute("member");  */ 
	/* Member m = (Member) request.getAttribute("member"); */
/* 	LicenseInfo li = (LicenseInfo) request.getAttribute("lInfo");
	ArrayList<UserPoint> plist = (ArrayList<UserPoint>) request.getAttribute("plist");
	String level = (String) request.getAttribute("level"); */
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
	<div id="page" style= "background: ivory; margin:">

		<!-- HEADER -->
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
				
				<div class="col-sm-8 text-center">
				<!-- <article class="container"> -->
					<!-- <div class="form-horizontal" id="showView"
						style="width: 70%; height: 100%;">
 -->
					<!-- <div class="form-group"> -->
					<!-- <div class="page-header" >-->
						<h1>
							<small>회원 정보 </small>
						</h1>
					<!-- </div> -->

					<div class="form-horizontal" id="updateForm">

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">유저아이디</label>
							<div class="col-sm-6">
								<input class="form-control" id="userId" name="userId" readonly
									type="text" readonly placeholder="<%=m.getUserId()%>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userName">닉네임</label>
							<div class="col-sm-6">
								<input class="form-control" id="userName" name="userName"
									readonly type="text" placeholder="<%=m.getUserName()%>"
									value="<%=m.getUserName()%>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="email">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="email" name="email" type="email"
									readonly placeholder="<%=m.getEmail()%>"
									value="<%=m.getEmail()%>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userLi">관심자격증</label>
							<div class="col-sm-6">
								<input class="form-control" id="userLi" name="userLi" type="text"
									readonly 
									value="정처기">
							</div>
							
							
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userPoint">포인트</label>
							<div class="col-sm-6">
								<input class="form-control" id="userPoint" type="text" readonly
									placeholder=" <%=p.getPoint() %>/ <%=p.getTotalPoint() %> &nbsp;&nbsp; Lv.<%=level%> ">
							</div>
						</div>

						<div class="form-group">

							<button id="mUpdateMember" onclick="mUpdate();">정보 수정</button>

						</div>
					</div>
				<!-- </article> -->
				</div>
			</div>
		</div>
	</div>
	<script>
		function mUpdate() {
			location.href = "/allRight/views/myPage/updateMember.jsp";
		}
	</script>

	<!-- FOOTER -->
	<footer> </footer>
	<!-- //FOOTER -->

</body>
</html>