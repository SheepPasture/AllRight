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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

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
	text-align: center;
}

#ckZip, #updateBtn {
	background: lightgreen;
	color: black;
}

#updateBtn, #goMain, #deleteBtn {
	display: inline-block;
}
</style>

</head>
<body>
	<!-- HEADER -->
	<%@ include file="/views/common/header.jsp"%>
	<!-- HEADER-END -->
	<%--  --%>
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
				style="display: inline-block; background: ivory">

				<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>

			</div>
			<h1>
				<small>기출문제 오답</small>
			</h1>
			<div id="showView"
				style="width: 80%; height: 100%; display: inline-block;">
				<div src="viewMemberInfo.jsp">
					<table class="table table-hover">
						<tr>
							<td
								style="padding: 0px; border-top: 3px double #aaa; background: #f5f5f5"
								align="center">
								<table style="padding-bottom: 5px; width: 100%;" cellspacing='0'
									cellpadding='0'>
									<tr height='33'>
										<td style='padding: 3px 2px 1px 2px; text-align: center'
											class='title01'>구분</td>
										<td style='padding: 3px 2px 1px 2px; text-align: center'
											class='title01'>분류</td>
										<td style='padding: 3px 2px 1px 2px; text-align: center'
											class='title01'>정답수/문제수</td>
										<td style='padding: 3px 2px 1px 2px; text-align: center'
											class='title01'>응시결과</td>
										<td style='padding: 3px 2px 1px 2px; text-align: center'
											class='title01'>다시풀기</td>
									
									</tr>

									<tr style='padding: 3px 2px 1px 2px' height='33'>
										<td align='center'>1</td>
										<td align='center'>기능·기술 [기사] > 가스기사 > 2018년 2회</td>
										<td align='center'>100/100</td>
										<td align='center'><a
											href="#<!-- javascript:start_test(1, 'check', 1, 20) -->"
												title='문제별 응시결과 확인' align='absmiddle'>결과확인</a></td>
										<td align='center'>다시풀기</td>
									</tr>
								
									<tr style='padding: 3px 2px 1px 2px' height='33'>
										<td align='center'>1</td>
										<td align='center'>기능·기술 [기사] > 가스기사 > 2018년 3회</td>
										<td>20/100</td>
										<td colspan='1' align='center'><a
											href="javascript:start_test(5, 'first', 81, 20)"
											style='color: #CC9900; font-weight: bold'>결과확인</a></td>
										<td colspan='1' align='center'><a
											href="javascript:start_testEach(5, 'first', 81, 20)"
											style='color: #CC9900; font-weight: bold'>다시풀기</a></td>
										</td>
									</tr>
								</table>

							</td>
						</tr>


					</table>
				</div>
			</div>

		</div>

		<div></div>
</body>
</html>