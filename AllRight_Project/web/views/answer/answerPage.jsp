<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.question.model.vo.*, java.util.*"%>
<%
	// 문제 리스트
	ArrayList<Question> qs = (ArrayList<Question>) request.getAttribute("qs");
	int qNo = (Integer) request.getAttribute("qNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>ALLRight</title>
<!-- <link rel="stylesheet" href="answerPage.css" type="text/css"/> css 작업 ing. -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />

<!-- 제이쿼리 파일 -->
<script src="/allRight/resources/js/jquery.min.js"
	type="text/javascript"></script>

<script type="text/javascript" language="javascript"> // 화면 해상도(문제크기)
	function a(){document.body.style.zoom='100%'; void(0);}
	function b(){document.body.style.zoom='125%'; void(0);}
	function c(){document.body.style.zoom='150%'; void(0);}
</script>
<style>
.active {
	background : palegreen;
}
</style>
</head>

<script type="text/javascript"> // 자바스크립트에서 사용하는 전역변수 선언
var g4_path = "../tn";
var g4_bbs = "";
var g4_bbs_img = "";
var g4_url = "";
var g4_is_member = "";
var g4_is_admin = "";
var g4_bo_table = "";
var g4_sca = "";
var g4_charset = "utf-8";
var g4_cookie_domain = "";
var g4_is_gecko = navigator.userAgent.toLowerCase().indexOf("gecko") != -1;
var g4_is_ie = navigator.userAgent.toLowerCase().indexOf("msie") != -1;
var isMobile = -1;
</script>

<body id="body">
	<div align="center">
		<!-- Mobile, PC 페이지 컨테이너 가운데 정렬 시작 -->
		<div
			style="margin: auto; width: 1008px; background: #fff; border-radius: 8px;">
			<!-- PC 컨테이너 시작 -->
			<div style="padding: 15px;">
				<!-- PC 컨테이너 여백 시작 -->

				<script type="text/javascript" language="javascript">
var max_five = Array(10); </script>

				<table
					style="margin-bottom: 5px; width: 100%; border: solid 0px #ccc; background: beige;"
					cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td
								style="padding: 15px 0px; width: 120px; font-family: tahoma; text-align: center;">
								<div id="link">
									<!-- 문제집중뷰, 홈 링크 -->
									<a href="views/answer/answerList.jsp"
										style="margin-top: 15px; display: block;"><img
										src="resources/images/answer/icon2.png" /><br />Home</a>
								</div>

								<div id="testing" style="display: none;"></div>
							</td>
							<td>
								<div id="top" style="padding: 12px 0px; text-align: left;">
									<!-- PC 탑 메뉴 -->

									<form method="post"
										action="<%=request.getContextPath()%> /answer.te"
										style="margin: 0px;">
										<select id="menu_top_select" name="bigCode"
											onchange="bigOptChange(this.form)">
											<option value=>응시 분야를 선택하세요.</option>
											<option value="10">기능·기술 [기사]</option>
											<option value="11">기능·기술 [산업기사]</option>
											<option value="12" selected>기능·기술 [기능사]</option>
											<option value="15">기능·기술 [미용사]</option>
											<option value="18">서비스 [멀티미디어]</option>
											<option value="19">서비스 [텔레마케팅]</option>
											<option value="20">사무 [컴퓨터활용능력]</option>
											<option value="21">사무 [워드프로세서]</option>
											<option value="25">판매 [전자상거래운용사]</option>
											<option value="30">회계 [전산회계운용사]</option>
											<option va lue="70">공인 [PC정비사]</option>
											<option value="75">공인 [네트워크관리사]</option>
										</select> &nbsp; <select id="menu_top_select" name="midCode"
											onchange="midOptChange(this.form)">
											<option value>종목을 선택하세요.</option>
											<option value="1210" selected>정보처리기능사</option>
											<option value="1211">정보기기운용기능사</option>
											<option value="1212">컴퓨터그래픽스운용기능사</option>
											<option value="1213">웹디자인기능사</option>
											<option value="1214">전자출판기능사</option>
											<option value="1220">조리기능사</option>
											<option value="1221">제과기능사</option>
											<option value="1222">제빵기능사</option>
											<option value="1221">조주기능사</option>
										</select> &nbsp; <select id="menu_top_select" name="smallCode"
											onchange="changeSmallOptChange(this.form, this.value)">
											<option value=>회차를 선택하세요.</option>
											<option value="-2">랜덤 모의고사</option>
											<option value="121049">2011년 5회</option>
											<option value="121048">2011년 4회</option>
											<option value="121047">2011년 2회</option>
											<option value="121046" selected>2011년 1회</option>
										</select> <span style="padding-left: 5px;"></span> <img
											src="resources/images/answer/check.gif" /></a> <a href="#">랜덤모의고사

											<span style="padding-left: 5px;"></span> <img
											src="resources/images/answer/check.gif" />
										</a> <a href="#">기출문제 메인 
									</form>

									<script type="text/javascript">
var randomTest = "";
function bigOptChange(f) {
//alert(f.smallCode);
	
	if( typeof(f.midCode) != "undefined" ) f.midCode.value = "";
	if( typeof(f.smallCode) != "undefined" ) f.smallCode.value = "";

	if(randomTest == 1) { f.action = "indexRandom.php"; }
	f.submit();
}

function midOptChange(f) {
	if( typeof(f.smallCode) != "undefined" ) f.smallCode.value = "";
	
	if(randomTest == 1) { f.action = "indexRandom.php"; }
	f.submit();
}

function changeSmallCode(f, value) {
	if(value == -2) {
	location.href = "indexRandom.php?midCode="+f.midCode.value;
	}
	else {
		f.action = "index.php";
		f.submit();
	}
}
</script>

									<div style="margin-top: 10px; height: 125px;">
										<!-- 구글검색 영역 시작 -->
										<div style="float: left;">
											<div id="google_search" style="height: 30px;">
												<!-- 구글검색 (전체 웹 검색) -->
												<form action="http://www.google.co.kr" id="cse-search-box"
													target="_blank">
													<div>
														<input type="hidden" name="cx"
															value="partner-pub-1981615758276157:4489152794" /> <input
															type="hidden" name="ie" value="UTF-8" /> <input
															type="text" name="q" size="54" /> <input type="submit"
															name="sa" value="&#xac80;&#xc0c9;" />
													</div>
													<script type="text/javascript"
														src="http://www.google.co.kr/coop/cse/brand?form=cse-search-box&amp;lang=ko"></script>
											</div>
										</div>
										<span style='margin-right: 5px;'>［문제크기 : <a
											href="javascript:b()">125%</a> | <a href="javascript:c()">150%</a>
											| <a href="javascript:a()">100%</a>］
										</span>
									</div>
									<!-- 구글검색 영역 끝 -->
								</div> <!-- PC 탑 메뉴 끝 -->
							</td>
						</tr>
					</tbody>
				</table>

				<div
					style="padding: 5px 5px 35px 5px; min-height: 600px; border: solid 1px #ccc;">
					<!-- PC 시험 영역 시작 -->
					<table
						style="margin: 0px 0px 5px 0px; width: 100%; border: 1px solid #ccc; background: #f8f8f8"
						align="center">
						<!-- 상단 타이틀 시작 -->
						<tr style="height: 45px;">
							<td
								style="font-family: MalgunGothic, Sans-serif; font-weight: bolder; color: lightskyblue; font-size: 13pt"
								align="center" valign="middle">정보처리기능사 필기 (2011년 1회 기출문제)
								응시 <span style="font-size: 10pt; font-weight: 500"> <span
									style="padding-left: 8px; font-weight: 500">Timer</span> <span
									id="min"
									style="width: 15px; font-weight: 500; text-align: right"></span>분
									<span id="sec"
									style="width: 15px; font-weight: 500; text-align: right"></span>초
							</span> <script type="text/javascript" language="javascript">
	function updateTime() {
		var now = new Date();
		var t = now.getTime() - startDate.getTime();
		var s = Math.round(t/1000);

		min.innerHTML = Math.floor(s/60);
		sec.innerHTML = s%60;
		setTimeout("updateTime()",500);
	}
	var startDate = new Date();
	updateTime();
	</script>
		</td>
		<td style="padding-right: 5px; text-align: right;"><input
			type="button" value="첫화면" class="btn01_qpass"
			style="width: 60px; border: 1px solid green;"
			onclick="move2main()"></td>
	</tr>
</table>
<!-- 상단 타이틀 끝. -->

<input type='hidden' id='current_i' value='0' size='3'> <input
	type='hidden' id='current_j' value='0' size='3'> <input
	type='hidden' id='current_startNum' value='' size='3'> <input
	type='hidden' id='current_questionTotal' value='' size='3'>
<input type='hidden' id='current_mode' value='' size='3'>

<form name='test_form' method='post' action='/q/qpass_takeExam.php'
	style='margin: 0'>
	<input type='hidden' name='examUid' value='566'> <input
		type='hidden' name='mode' value=''> <input type='hidden'
		name='targetDiv' value=''> <input type='hidden'
		name='ansTryList' value=''>
</form>

<script type="text/javascript" language="javascript">var max_five = Array(10);</script>


<table width="100%" align="center" cellspacing="0" cellspacing="0"
	style="margin: 0px" border="0">
	<tbody>
		<tr>
			<td align="left" valign="top"><script>max_five[0] = '3';</script>
				<script>max_five[1] = '1';</script> <script>max_five[2] = '3';</script>
				<script>max_five[3] = '1';</script>

				<div id="div00"
					style="display: block; width: 100%; height: 100%;">
					<table width="100%" cellspacing="0" cellspacing="0"
						style="margin: 0px" border="1">
						<tbody>
							<%
								if (qs != null) {
							%>
							<%
								}
							%>
							<tr class="left">
								<td width="50%" valign="top" class="left"
									style="padding-top: 5px;">
									<!-- 왼쪽 문제 -->
									<div id="left_0"
										style="margin: 0px; position: absolute; width: 55px; height: 45px">
										<%
											for (int i = 0; i < 3; i++, qNo += 4) {
										%>
										<%
											Question question = qs.get(qNo);
										%>
									</div>

									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b>
											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								</td>

								<td valign="top"
									style="padding-top: 1px; border-left: none">
									<!-- 오른쪽 문제 --> <%
for (int i = 0; i < 2; i++, qNo += 4) {
%> <%
Question question = qs.get(qNo);
%>
									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b></td>
											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								
							</tr>
						</tbody>
					</table>

					<table width="100%" cellspacing="0" cellspacing="5">
						<tbody>
							<tr>
								<td width="421px" align="right" style="padding-right: 2px;">


									<input class="btn btn-success" type="button" value="이전"
									onclick="previous_div('1')" />
								</td>
								<td style="padding-left: 0px;"><input
									class="btn btn-success" type="button" value="다음"
									onclick="next_div('1');" /></td>

							</tr>
						</tbody>
					</table>
				</div>




				<div id="div01"
					style="display: none; width: 100%; height: 100%;">
					<table width="100%" cellspacing="0" cellspacing="0"
						style="margin: 0px" border="1">
						<tbody>
							<%
								if (qs != null) {
							%>
							<%
								}
							%>
							<tr class="left">
								<td width="50%" valign="top" class="left"
									style="padding-top: 5px;">
									<!-- 왼쪽 문제 -->
									<div id="left_0"
										style="margin: 0px; position: absolute; width: 55px; height: 45px">
										<%
											for (int i = 0; i < 3; i++, qNo += 4) {
										%>
										<%
											Question question = qs.get(qNo);
										%>

									</div>

									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b>
													<%
														if (question.getqNo() == 8)
													%><img src="resources/images/answer/rate8.png">
											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								</td>

								<td valign="top"
									style="padding-top: 1px; border-left: none">
									<!-- 오른쪽 문제 --> <% for (int i = 0; i < 2; i++, qNo += 4) {%> 
													 <%Question question = qs.get(qNo);%>
									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b></td>

											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								
							</tr>
						</tbody>
					</table>

					<table width="100%" cellspacing="0" cellspacing="5">
						<tbody>
							<tr>
								<td width="421px" align="right" style="padding-right: 2px;">
									<input class="btn btn-success" type="button" value="이전"
									onclick="previous_div('2')" />
								</td>
								<td style="padding-left: 0px;"><input
									class="btn btn-success" type="button" value="다음"
									onclick="next_div('2')" /></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div id="div02"
					style="display: none; width: 100%; height: 100%;">
					<table width="100%" cellspacing="0" cellspacing="0"
						style="margin: 0px" border="1">
						<tbody>
							<%
								if (qs != null) {
							%>
							<%
								}
							%>
							<tr class="left">
								<td width="50%" valign="top" class="left"
									style="padding-top: 5px;">
									<!-- 왼쪽 문제 -->
									<div id="left_0"
										style="margin: 0px; position: absolute; width: 55px; height: 45px">
										<%
											for (int i = 0; i < 3; i++, qNo += 4) {
										%>
										<%
											Question question = qs.get(qNo);
										%>

									</div>

									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b>
											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								</td>

								<td valign="top"
									style="padding-top: 1px; border-left: none">
									<!-- 오른쪽 문제 --> <%
for (int i = 0; i < 2; i++, qNo += 4) {
%> <%
Question question = qs.get(qNo);
%>
									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b></td>

											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								
							</tr>
						</tbody>
					</table>

					<table width="100%" cellspacing="0" cellspacing="5">
						<tbody>
							<tr>
								<td width="421px" align="right" style="padding-right: 2px;">
									<input class="btn btn-success" type="button" value="이전"
									onclick="previous_div('3')" />
								</td>
								<td style="padding-left: 0px;"><input
									class="btn btn-success" type="button" value="다음"
									onclick="next_div('3')" /></td>
			</tr>
		</tbody>
	</table>
</div>



<div id="div03"
	style="display: none; width: 100%; height: 100%;">
	<table width="100%" cellspacing="0" cellspacing="0"
		style="margin: 0px" border="1">
		<tbody>
							<%
								if (qs != null) {
							%>
							<%
								}
							%>
							<tr class="left">
								<td width="50%" valign="top" class="left"
									style="padding-top: 5px;">
									<!-- 왼쪽 문제 -->
									<div id="left_0"
										style="margin: 0px; position: absolute; width: 55px; height: 45px">
										<%
											for (int i = 0; i < 3; i++, qNo += 4) {
										%>
										<%
											Question question = qs.get(qNo);
										%>


									</div>


									<table
										style="margin-bottom: 10px; width: 100%; height: 150px; border: 0"
										cellspacing="0" cellspacing="5">
										<tbody>
											<tr>
												<td
													style="padding-left: 8px; width: 25px; text-align: left"
													valign="top"><b><%=question.getqNo()%>. </b></td>
												<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b>
													<%
														if (question.getqNo() == 16)
													%><img src="resources/images/answer/rate16.png">
											</tr>
											<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table> <%
}
%>
								</td>

	<td valign="top"
		style="padding-top: 1px; border-left: none">
		<!-- 오른쪽 문제 --> <%
			for (int i = 0; i < 2; i++, qNo += 4) {%> 
			<% Question question = qs.get(qNo); %>
<table style="margin-bottom: 10px; width: 100%; height: 150px; border: 0" cellspacing="0" cellspacing="5">
		<tbody>
				<tr>
					<td
						style="padding-left: 8px; width: 25px; text-align: left"
						valign="top"><b><%=question.getqNo()%>. </b></td>
					<td style="width: 98%" valign="top"><b><%=question.getqContent()%></b>
				</tr>
			<%
												for (int j = qNo, a = 1; j < qNo + 4; j++, a++) {
											%>
											<tr>
												<td></td>
												<td class='<%=(question.getqNo()) + "-" + a%>'><%=qs.get(j).getqPre()%></td>
											</tr>
											<%
												}
											%>
		</tbody>
</table> 	<% } %>
								
							</tr>
						</tbody>
					</table>

					<table width="100%" cellspacing="0" cellspacing="5">
						<tbody>
							<tr>
								<td width="421px" align="right" style="padding-right: 2px;">
									<input class="btn btn-success" type="button" value="이전"
									onclick="previous_div('4')" />
								</td>
								<td style="padding-left: 0px;"><input
									class="btn btn-success" type="button" value="다음"
									onclick="next_div('4')" /></td>
							</tr>
						</tbody>
					</table>
				</div></td>
			<!-- div line -->


			<td style="padding-left: 4px; border: none; width: 130px;"
				valign="top">
				<!-- 답안지 -->
				<div id="ans0"
					style="display: block; width: 100%; height: 100%; padding-left: 0px; border: 1px">
					<table width="100%" height="30" align="center" cellspacing="0"
						cellspacing="2">
						<tbody>
							<tr>
								<td align="center" colspan="5"
									style="color: tomato; font-weight: bold; border: solid 0px #ccc; border-bottom: none"
									border="1px">1과목</td>
							</tr>
						</tbody>
					</table>

					<table class="answerAll" width="100%" text-align="center" cellspacing="0"
						cellspacing="0" border="1px">
						<tbody>

							<%
								for (int i = 1; i < 21; i++) {
									int cnt = 1;
							%>
							<tr class="answerChart" style="height: 0px;">
								<td
								style="color: green; font-weight: bold; text-align: center;"><%=i%></td>
								<td class='<%=i + "-" + cnt++%>' width="22px" align="center" valign="middle">①</td>
								<td class='<%=i + "-" + cnt++%>' width="22px" align="center" valign="middle">②</td>
								<td class='<%=i + "-" + cnt++%>' width="22px" align="center" valign="middle">③</td>
								<td class='<%=i + "-" + cnt++%>' width="22px" align="center" valign="middle">④</td>
							</tr>
							<% } %>
						</tbody>
						
					</table>
					<p id="btnFinish0" align="right"
						style="display: block; margin: 10px 15px 5px 15px;">
						<input class="btn btn-danger" type="button"
							onclick="finish_exam();" value="답안제출" style="width: 90px">
					</p>
		
					<p id="resultDisplay0" align="center"
						style="margin: 10px 0px 0px 0px;"></p>
				</div>
			</td>
		</tr>
	</tbody>
</table>

<script>

$('td[class*="-"]').each(function(){ // 문제 - 답안 클릭시 클래스 
	
	$(this).click(function(){
		var className = $(this).attr('class');
		
		if(!$(this).hasClass('active')) {
			$('.'+className).addClass('active');
			
			$('.'+className).parent(':not(.answerChart)').siblings().children().removeClass('active');
			
			$('.'+className).siblings().removeClass('active');
			
		}
	});
});

/* 첫화면으로 이동*/
function move2main() {
	var currentI = document.getElementById('current_i').value;
	var currentJ = document.getElementById('current_j').value;
	var currentDiv = document.getElementById('div'+ currentI + currentJ);

	currentDiv.style.display = "none";
	index_div.style.display='';

	var currentAns = document.getElementById('ans'+ currentI);
	currentAns.style.display = "none";

	var indexDiv = document.getElementById('index_div');
	indexDiv.style.visibility = "visible";
}

function previous_div(a) {
	
	if(a == 1){
	  alert("1과목 처음입니다.");
	
	} else if (a == 2){
		$('#div01').css('display', 'none');
		
		$('#div00').css('display', 'block');
	} else if (a == 3){
		$('#div02').css('display', 'none');
		
		$('#div01').css('display', 'block');
	} else if (a == 4){
		$('#div03').css('display', 'none');
		
		$('#div02').css('display', 'block');
	}
	
}

function next_div(a) {
	// previous_div+=1;
	
	if(a == 1){
		$('#div00').css('display', 'none');
		
		$('#div01').css('display', 'block');
		
	} else if(a == 2){
		
		$('#div01').css('display', 'none');
		
		$('#div02').css('display', 'block');
		
	} else if(a == 3){
		
		$('#div02').css('display', 'none');
		
		$('#div03').css('display', 'block');
		
	} else{
		
		alert("1과목 마지막 입니다.");
		
	}
	
}


function finish_exam(divIndex) {

	// 현재 문제를 전부 풀었는지 체크
	
	var answerCount = $('.answerAll').find('td.active');
	
	if ( answerCount.length == 0){
	
		alert("답안을 작성해야 합니다.");
	
	} else if (answerCount.length < 20) {
	
		alert("아직 모든 문제를 풀지 않았습니다.");
	
	} else {
		var chk = confirm("모든 문제를 푸셨습니다.\n제출하시겠습니까?");
		if(chk){
			alert("수고하셨습니다.");
			
			//전체 확인
			console.log(answerCount);
			var answerList = [];
			// 각 필요한 번호 추출
			answerCount.each(function(){
				
				// console.log(($(this).attr('class')).split(' ')[0]);
				answerList.push(($(this).attr('class')).split(' ')[0]);
			});
			
			//console.log(answerList);
			
			$.ajax({
				url : "/allRight/question.li",
				data : {answerList : answerList},
				type : "POST",
				async : false,
				success : function(data){
					
					console.log(data);
					location.href = "/allRight/views/answer/answerDetail.jsp";
				}, error : function(data){
					
					console.log(data);
					
				}
			});
		} else {
			alert("제출을 취소합니다.");
		}
	}
	
	/* 주관식 문제 이전*/
	/* for(var i=startNum; i <= endNum; i++) {
		if( document.getElementById('ansInsert_text'+i) ) {
			document.getElementById('ans_try'+i).value = document.getElementById('ansInsert_text'+i).value;
		}
	}

	var notTriedNum = get_notTriedNum(startNum, endNum);
	if(notTriedNum != -1) {
		var ansIndex = notTriedNum - document.getElementById('current_startNum').value;
		if( !confirm("아직 풀지 않은 문제가 있습니다.\n\n이대로 채점하시려면 [확인]을 선택하시고,\n\n모두 푸시려면 [취소]를 선택하신 후\n\n답안란의 풀지 않은 문제번호를 선택하시면 \n\n해당 문제로 이동합니다.") ) {
			move2question(ansIndex);
			return;
		}
	}

	var f = document.test_form;
	nextSameIndex = divIndex + 1;
	
	if(f.mode.value == 'first') {
		var tryList="";
		for(var i=startNum; i <= endNum; i++) {
			ans_try = document.getElementById('ans_try'+i).value;
			if(ans_try == "") { ans_try = " "; } // 정답률 추출을 위해 한자리수로 맞춤.
			tryList = tryList + ans_try + "|Q|";
		}
		f.ansTryList.value = tryList;
		f.targetDiv.value = document.getElementById('current_i').value;
		f.submit();
	}
	else if(f.mode.value == 'restudy') start_test(nextSameIndex, "restudyCheck", startNum, eachTotal);
	else if(f.mode.value == 'incorrect') start_test(nextSameIndex, "incorrectCheck", startNum, eachTotal); */
}
</script>

				</div>
				<!-- PC 시험 영역 끝 -->
			</div>
			<!-- PC 컨테이너 여백 끝 -->
		</div>
		<!-- PC 컨테이너 끝 -->
	</div>
	<!-- Mobile, PC 페이지 컨테이너 가운데 정렬 끝 -->
</body>
</html>