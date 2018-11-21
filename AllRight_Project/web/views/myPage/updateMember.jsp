<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>

<%
	/* 	Member m = (Member)session.getAttribute("member"); */
	/* m.setUserId("test1");
	m.setUserName("test1"); */

	UserLicense ul = (UserLicense) request.getAttribute("userLicense");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
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
						<%-- action="<%=request.getContextPath()%>/mUpdate.me" --%> method="post">
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userId">유저아이디</label>
							<div class="col-sm-6">
								<input class="form-control" id="userId" name="userId"
									type="text" readonly placeholder="<%=m.getUserId()%>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="password">비밀번호</label>
							<div class="col-sm-6">
								<input class="form-control" id="password" name="password"
									type="password" placeholder="비밀번호">
								<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="passwordCheck">비밀번호
								확인</label>
							<div class="col-sm-6">
								<input class="form-control" id="passwordCheck" type="password"
									placeholder="비밀번호 확인">
								<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="userName">닉네임</label>
							<div class="col-sm-6">
								<input class="form-control" id="userName" name="userName"
									type="text" placeholder="<%=m.getUserName()%>"
									value="<%=m.getUserName()%>">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="email">이메일</label>
							<div class="col-sm-6">
								<input class="form-control" id="email" name="email" type="email"
									placeholder="<%=m.getEmail()%>" value="<%=m.getEmail()%>"
									readonly>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label" for="userLi">관심자격증</label>
							<div>
								<select name="selectCategory" id="selectCategory">
								<option>선택하세요</option>

								</select> 
								<select name="licenseName" id="licenseName">
								<option>선택하세요</option>


								</select>
								<script>
								/* var str = "<option>선택하세요</option>";

								$('#selectCategory').append(str); */
						
									$.ajax({
										url : '/allRight/lSelect.li',
										type : 'get',
										async: false,
										dataType:'json',
										success : function(data){
										console.log(data);
										console.log(data.list)
											var list = data.lArray;
											var l = data.list;
											/* console.log(l);
											console.log(l[0].listName); */
										/* 	  console.log(l);  */
											/* console.log(list.length);
											console.log(list[0].category); */
											/* console.log(lArray.category);  */
											for(var i = 0; i<l.length;i++){
												
												$('#selectCategory').append("<option>"+l[i].listName+"</option>");
										  
											}
											
											 $('#selectCategory').change(sCategory);
											  function sCategory(){
									            
									             $('#licenseName').children().remove();
									             for(var i = 0; i<list.length;i++){
														
														 var value = $('option:selected').val();
											             console.log(value);
											            
											             if(list[i].category==value){
															 $('#licenseName').append("<option value="+list[i].lno+">"+list[i].name+"</option>"); 
													  
															}
											             
									         }}; 
									         $('#licenseName').change(lCategory);
									          function lCategory(){
									             var value = $('#licenseName option:selected').val();
									             console.log(value);
									          }; 
										
										}, error : function(){
											alert("실패");
										}
									});
									
								</script>

							</div>
							<br>


							<div class="form-group">
								<div class="col-sm-12 text-center">
									<button class="btn btn-primary" onclick="memberUpdate();">정보
										수정</button>
									<button class="btn btn-danger" onclick="memberDelete();">회원
										탈퇴</button>
									<button class="btn btn-danger" onclick="memberMain();">
										뒤로가기</button>
								</div>
							</div>
					</form>
				</article>
			</div>
		</div>
		<script>
		function memberDelete(){
		console.log("delete 클릭");
    		$('#updateForm').attr("action", "<%=request.getContextPath()%>/mDelete.me");
	<%-- 	location.href = "<%=request.getContextPath()%>/mDelete.me"; --%>
     	}
     	function memberUpdate() {
			/* $("#updateForm").submit(); */
				$('#updateForm').attr("action", "<%=request.getContextPath()%>/mUpdate.me");
		 	<%-- location.href = "<%=request.getContextPath() %>/mUpdate.me" --%>
		}
    
    	function memberMain(){
    			$('#updateForm').attr("action", "<%=request.getContextPath()%>/views/myPage/myPageMain.jsp");
    		console.log("main클릭");
    	}

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
      </script>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
	<!-- 	<script src="../../js/bootstrap.min.js"></script> -->
</body>
</html>
