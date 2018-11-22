<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sheep.jsp.question.model.vo.*, java.util.*" %>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />

<!-- 제이쿼리 파일 -->
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript" language="javascript"> // 화면 해상도(문제크기)
	function a(){document.body.style.zoom='100%'; void(0);}
	function b(){document.body.style.zoom='125%'; void(0);}
	function c(){document.body.style.zoom='150%'; void(0);}
</script>
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
<div align="center"> <!-- Mobile, PC 페이지 컨테이너 가운데 정렬 시작 -->
<div style="margin:auto; width:1008px; background:#fff; border-radius:8px;"> <!-- PC 컨테이너 시작 -->
<div style="padding:15px;"> <!-- PC 컨테이너 여백 시작 -->

<script type="text/javascript" language="javascript">
var max_five = Array(10); </script>

<table style="margin-bottom:5px; width:100%; border:solid 0px #ccc; background:beige;" cellspacing="0" cellpadding="0">
	<tbody>	
	<tr>	
	<td style="padding:15px 0px; width:120px; font-family:tahoma; text-align:center;">
	<div id="link"> <!-- 문제집중뷰, 홈 링크 -->
	<a href="views/answer/answerList.jsp" style="margin-top:15px; display:block;"><img src="resources/images/answer/icon2.png" /><br />Home</a>
	</div>
	
	<div id="testing" style="display:none;"></div> 
	</td>
	<td>	
		<div id="top" style="padding:12px 0px; text-align:left;"> <!-- PC 탑 메뉴 -->
		
<form method="post" action="<%= request.getContextPath() %> /answer.te"  style="margin:0px;">
		<select id="menu_top_select" name="bigCode" onchange="bigOptChange(this.form)">
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
		<option value="75">공인 [네트워크관리사]</option></select>
		&nbsp;
		<select id="menu_top_select" name="midCode" onchange="midOptChange(this.form)">
		<option value>종목을 선택하세요.</option>
		<option value="1210" selected>정보처리기능사</option>
		<option value="1211">정보기기운용기능사</option>
		<option value="1212">컴퓨터그래픽스운용기능사</option>
		<option value="1213">웹디자인기능사</option>
		<option value="1214">전자출판기능사</option>
		<option value="1220">조리기능사</option>
		<option value="1221">제과기능사</option>
		<option value="1222">제빵기능사</option>
		<option value="1221">조주기능사</option></select>
		&nbsp;
		<select id="menu_top_select" name="smallCode" onchange="changeSmallOptChange(this.form, this.value)">
		<option value=>회차를 선택하세요.</option>
		<option value="-2">랜덤 모의고사</option>
		<option value="121049">2011년 5회</option>
		<option value="121048">2011년 4회</option>
		<option value="121047">2011년 2회</option>
		<option value="121046" selected>2011년 1회</option></select>
		<span style="padding-left: 5px;"></span>
		<img src="resources/images/answer/check.gif" /></a>
		<a href="#">랜덤모의고사
		
		<span style="padding-left: 5px;"></span>
		<img src="resources/images/answer/check.gif" /></a>
		<a href="#">기출문제 메인
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

 <div style="margin-top:10px; height:125px;"> <!-- 구글검색 영역 시작 -->
 	<div style="float:left;">
		<div id="google_search" style="height:30px;"> <!-- 구글검색 (전체 웹 검색) -->
			<form action="http://www.google.co.kr" id="cse-search-box" target="_blank">
			<div>
				<input type="hidden" name="cx" value="partner-pub-1981615758276157:4489152794" />
				<input type="hidden" name="ie" value="UTF-8" />
				<input type="text" name="q" size="54" />
				<input type="submit" name="sa" value="&#xac80;&#xc0c9;" />
			</div>
 <script type="text/javascript" src="http://www.google.co.kr/coop/cse/brand?form=cse-search-box&amp;lang=ko"></script>
		</div>
	</div>
<span style='margin-right:5px;'>［문제크기 : <a href="javascript:b()">125%</a> | <a href="javascript:c()">150%</a> | <a href="javascript:a()">100%</a>］</span>
</div> <!-- 구글검색 영역 끝 -->
</div> <!-- PC 탑 메뉴 끝 -->
</td></tr></tbody></table>
				
<div style="padding: 5px 5px 35px 5px; min-height: 600px; border: solid 1px #ccc;"> <!-- PC 시험 영역 시작 -->
<table style="margin:0px 0px 5px 0px; width:100%; border:1px solid #ccc; background:#f8f8f8" align="center"> <!-- 상단 타이틀 시작 -->
<tr style="height:45px;">
<td style="font-family:MalgunGothic,Sans-serif; font-weight:bolder; color:lightskyblue; font-size:11pt" align="center" valign="middle">
정보처리기능사 필기 (2011년 1회 기출문제) 응시
	<span style="font-size:10pt; font-weight:500">
		<span style="padding-left:8px; font-weight:500">Timer</span>
		<span id="min" style="width:15px; font-weight:500; text-align:right"></span>분
		<span id="sec" style="width:15px; font-weight:500; text-align:right"></span>초
	</span>
	<script type="text/javascript" language="javascript">
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
<td style="padding-right:5px; text-align:right;"  >
	<input type="button" value="첫화면" class="btn01_qpass" style="width:60px; border:1px solid green;" onclick="move2main()">
</td>
</tr>
</table> <!-- 상단 타이틀 끝. -->

<input type='hidden' id='current_i' value='0' size='3'>
<input type='hidden' id='current_j' value='0' size='3'>
<input type='hidden' id='current_startNum' value='' size='3'>
<input type='hidden' id='current_questionTotal' value='' size='3'>
<input type='hidden' id='current_mode' value='' size='3'>

<form name='test_form' method='post' action='/q/qpass_takeExam.php' style='margin:0'>
	<input type='hidden' name='examUid' value='566'>
	<input type='hidden' name='mode' value=''>
	<input type='hidden' name='targetDiv' value=''>
	<input type='hidden' name='ansTryList' value=''>
</form>

<script type="text/javascript" language="javascript">var max_five = Array(10);</script>


<table width="100%" align="center" cellspacing="0" cellspacing="0" style="margin:0px" border="0">
<tbody>
	<tr>
		<td align="left" valign="top">
		<script>max_five[0] = '3';</script>
		<script>max_five[1] = '1';</script>
		<script>max_five[2] = '3';</script>
		<script>max_five[3] = '1';</script>
		
<div id="div00" style="display: block; width: 100%; height: 100%;">
	<table width="100%" cellspacing="0" cellspacing="0" style="margin:0px" border="1">
		<tbody>
		<% if ( qs != null) { %> <% } %>
				<tr class="left">
				<td width="50%" valign="top" class="left" style="padding-top:5px;" > 
<!-- 왼쪽 문제 -->
	<div id="left_0" style="margin:0px; position:absolute; width:55px; height:45px">
		<% for(int i = 0; i < 3; i++, qNo+=4) { %>
		<% Question question = qs.get(qNo); %>
	</div>
	
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"  ><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top" ><b><%= question.getqContent() %></b>
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
<% } %>
				</td>
				
				<td valign="top" style="padding-top:1px; border-left:none"> 
<!-- 오른쪽 문제 -->
<% for(int i = 0; i < 2; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top"><b><%= question.getqContent() %></b></td>
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
		</tbody>
</table>

<% } %>
				
				</tr>
		</tbody>	
	</table>

<table width="100%" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td width="421px" align="right" style="padding-right:2px;">
			<input class="btn btn-success" type="button" value="이전" onclick="previous_div('1과목, 0, 0')" />
			</td>
			<td style="padding-left:0px;" >
			<input class="btn btn-success" type="button" value="다음" onclick="next_div('1과목, 0, 0')" />
			</td>
		</tr>
	</tbody>
</table>
		</div>
		
		
		
		
<div id="div01" style="display: block; width: 100%; height: 100%;">
	<table width="100%" cellspacing="0" cellspacing="0" style="margin:0px" border="1">
		<tbody>
		<% if ( qs != null) { %> <% } %>
				<tr class="left">
				<td width="50%" valign="top" class="left" style="padding-top:5px;" > 
<!-- 왼쪽 문제 -->
	<div id="left_0" style="margin:0px; position:absolute; width:55px; height:45px">
		<% for(int i = 0; i < 3; i++, qNo+=4) { %>
		<% Question question = qs.get(qNo); %>
		
	</div>
	
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"  ><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top" ><b><%= question.getqContent() %></b>
			<% if(question.getqNo()==8) %><img src="resources/images/answer/rate8.png">
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td>
			</td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
<% } %>
				</td>
				
				<td valign="top" style="padding-top:1px; border-left:none"> 
<!-- 오른쪽 문제 -->
<% for(int i = 0; i < 2; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top"><b><%= question.getqContent() %></b></td>
			
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
		</tbody>
</table>

<% } %>
				
				</tr>
		</tbody>	
	</table>

<table width="100%" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td width="421px" align="right" style="padding-right:2px;">
			<input class="btn btn-success" type="button" value="이전" onclick="previous_div('1과목, 0, 0')" />
			</td>
			<td style="padding-left:0px;" >
			<input class="btn btn-success" type="button" value="다음" onclick="next_div('1과목, 0, 0')" />
			</td>
		</tr>
	</tbody>
</table>
		</div>

<div id="div02" style="display: block; width: 100%; height: 100%;">
	<table width="100%" cellspacing="0" cellspacing="0" style="margin:0px" border="1">
		<tbody>
		<% if ( qs != null) { %> <% } %>
				<tr class="left">
				<td width="50%" valign="top" class="left" style="padding-top:5px;" > 
<!-- 왼쪽 문제 -->
	<div id="left_0" style="margin:0px; position:absolute; width:55px; height:45px">
		<% for(int i = 0; i < 3; i++, qNo+=4) { %>
		<% Question question = qs.get(qNo); %>
		
	</div>
	
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"  ><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top" ><b><%= question.getqContent() %></b>
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td>
			</td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
<% } %>
				</td>
				
				<td valign="top" style="padding-top:1px; border-left:none"> 
<!-- 오른쪽 문제 -->
<% for(int i = 0; i < 2; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top"><b><%= question.getqContent() %></b></td>
			
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
		</tbody>
</table>

<% } %>
				
				</tr>
		</tbody>	
	</table>

<table width="100%" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td width="421px" align="right" style="padding-right:2px;">
			<input class="btn btn-success" type="button" value="이전" onclick="previous_div('1과목, 0, 2')" />
			</td>
			<td style="padding-left:0px;" >
			<input class="btn btn-success" type="button" value="다음" onclick="next_div('1과목, 0, 2')" />
			</td>
		</tr>
	</tbody>
</table>
		</div>			
		
<div id="div03" style="display: block; width: 100%; height: 100%;">
	<table width="100%" cellspacing="0" cellspacing="0" style="margin:0px" border="1">
		<tbody>
		<% if ( qs != null) { %> <% } %>
				<tr class="left">
				<td width="50%" valign="top" class="left" style="padding-top:5px;" > 
<!-- 왼쪽 문제 -->
	<div id="left_0" style="margin:0px; position:absolute; width:55px; height:45px">
		<% for(int i = 0; i < 3; i++, qNo+=4) { %>
		<% Question question = qs.get(qNo); %>
		
		
	</div>
	
	
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"  ><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top" ><b><%= question.getqContent() %></b>
			<% if(question.getqNo()==16) %><img src="resources/images/answer/rate16.png">
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td>
			</td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</tbody>
</table>
<% } %>
				</td>
				
				<td valign="top" style="padding-top:1px; border-left:none"> 
<!-- 오른쪽 문제 -->
<% for(int i = 0; i < 2; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td style="padding-left:8px; width:25px; text-align:left" valign="top"><b><%= question.getqNo() %>. </b></td>
			<td style="width:98%" valign="top"><b><%= question.getqContent() %></b>
			
			
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
		</tbody>
</table>

<% } %>
				
				</tr>
		</tbody>	
	</table>

<table width="100%" cellspacing="0" cellspacing="5">
	<tbody>
		<tr>
			<td width="421px" align="right" style="padding-right:2px;">
			<input class="btn btn-success" type="button" value="이전" onclick="previous_div('1과목, 0, 3')" />
			</td>
			<td style="padding-left:0px;" >
			<input class="btn btn-success" type="button" value="다음" onclick="next_div('1과목, 0, 3')" />
			</td>
		</tr>
	</tbody>
</table>
		</div>		
		
		
	
			
		</td> <!-- div line -->
		
		
<td style="padding-left:4px; border:none; width:130px;" valign="top">
<!-- 답안지 -->
<div id="ans0" style="display: block; width: 100%; height: 100%; padding-left: 0px; border:1px">
	<table width="100%" height="30" align="center" cellspacing="0" cellspacing="2">	
		<tbody>
	<tr>
		<td align="center" colspan="5" style="color:tomato; font-weight:bold; 
		border:solid 0px #ccc; border-bottom:none" border="1px">1과목</td>
	</tr>
		</tbody>	
	</table>

<table width="100%" text-align="center" cellspacing="0" cellspacing="0" border="1px">
	<tbody>
	
	<% for(int i = 1 ; i < 21 ; i++) { %>
	<tr style="height:0px;">
		<td style="color:green; font-weight:bold; text-align:center;"><%= i %></td>
		<td width="22px" align="center" valign="middle">①</td>
		<td width="22px" align="center" valign="middle">②</td>
		<td width="22px" align="center" valign="middle">③</td>
		<td width="22px" align="center" valign="middle">④</td>
	</tr>
	<% } %>
	</tbody>
</table>
<p id="btnFinish1" align="right" style="display:block; margin: 10px 15px 5px 15px;">
<input class="btn btn-danger" type="button" onclick="finish_exam();" value="답안제출" style="width:90px"></p>

<p id="resultDisplay0" align="center" style="margin: 10px 0px 0px 0px;"></p>
</div>
</td>		
		</tr>
		</tbody>
		</table>

<script>
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

function start_testEach(i, mode, startNum, eachTotal) {
	var f = document.eachForm;

	f.subjectNum.value = i;
	f.mode.value = mode;
	f.initStartNum.value = startNum;
	f.initEachTotal.value = eachTotal;
	f.submit();
}

/* 인덱스에서의 선택 처리*/
function start_test(i, mode, startNum, eachTotal) {
	var f = document.test_form;
	targetDiv = i-1;
	index_div.style.display='none';
	f.mode.value = mode;
	document.getElementById('current_mode').value = mode;
	document.getElementById('current_startNum').value = startNum;
	document.getElementById('current_questionTotal').value = eachTotal;

	var finishBtn = document.getElementById('btnFinish'+ targetDiv);
	var resultDisplay = document.getElementById('resultDisplay'+targetDiv);
	resultDisplay.innerHTML = "";

	if(mode == "first") { /* 응시하기*/
	}
	else if(mode == "restudy") { /* 다시풀기*/
		unscoring_targetDiv(targetDiv, startNum, eachTotal);
		finishBtn.style.display = "block";
	}	
	else if(mode == "restudyCheck") { /* 다시풀기 결과확인하기*/
		scoring_targetDiv(targetDiv, startNum, eachTotal);
		finishBtn.style.display = "none";
	}
	else if(mode == "check") { /* 응시결과 확인하기*/
		unscoring_targetDiv(targetDiv, startNum, eachTotal); /* 체크후 답안제출없이 첫화면으로 이동시 리셋이 필요*/
		resave_ansTry(startNum, eachTotal);
		scoring_targetDiv(targetDiv, startNum, eachTotal);
		finishBtn.style.display = "none";
	}	
	else if(mode == "incorrect") { /* 틀린문제 다시풀기*/
		unscoring_targetDiv(targetDiv, startNum, eachTotal); /* 체크후 답안제출없이 첫화면으로 이동시 리셋이 필요*/
		resave_ansTry(startNum, eachTotal);
		scoring_targetDiv(targetDiv, startNum, eachTotal);
		finishBtn.style.display = "block";
	}
	else if(mode == "incorrectCheck") { /* 틀린문제 다시풀기 결과확인하기*/
		scoring_targetDiv(targetDiv, startNum, eachTotal);
		finishBtn.style.display = "none";
	}
	replace_div(targetDiv, 0);
	document.getElementById('index_div').style.visibility = 'hidden';
}

function resave_ansTry(startNum, eachTotal) {
	var tryNum;
	var endNum = startNum + eachTotal - 1;

	for(var i=startNum; i <= endNum; i++) {
		tryNum = document.getElementById('ans_trySame'+i).value;
		document.getElementById('ans_try'+i).value = tryNum;
	}
}

function restore_exam(targetDiv, course) {
	if(!confirm(course + " 응시결과를 모두 삭제하시겠습니까? ")) return;
	var f = document.test_form;

	f.mode.value = "return";
	f.targetDiv.value = targetDiv;
	f.submit();
}


/* 해당 구역으로 이동*/
function replace_div(divNum, fiveNum) {
	/* 현재 블럭 감추기*/
	var currentI = document.getElementById('current_i').value;
	var currentJ = document.getElementById('current_j').value;
	var currentDiv = document.getElementById('div'+ currentI + currentJ);

	currentDiv.style.display = "none";
	
	/* 대상 블럭 보이기*/
	var targetDiv = document.getElementById("div"+ divNum + fiveNum);
	targetDiv.style.display = "block";
	/*alert(fiveNum); return;*/

	/* 해당 답안지 변경*/
	var targetAns = document.getElementById("ans"+divNum);
	targetAns.style.display = "block";
	
	document.getElementById('current_i').value = divNum;
	document.getElementById('current_j').value = fiveNum;
}

/* 채점 표시 전부 없애기*/
function unscoring_targetDiv(targetDiv, startNum, eachTotal) {
	var f = document.test_form;
	var ans_try, ans_real;
	var endNum = startNum + eachTotal - 1;
	var itemType;

	for(var i=startNum; i <= endNum; i++) {
		/* 문제지 번호*/
		document.getElementById('ques_ox'+i).style.backgroundImage = "";

		/* 문제지 문항*/
		for(var j=1; j<=4; j++) {
			itemType = document.getElementById('quesitem'+i+j);
			if(itemType != null) document.getElementById('quesitem'+i+j).style.backgroundImage = "";
		}

		// 정답률
		if( document.getElementById('rate'+i) ) {
			document.getElementById('rate'+i).style.display = "none";
		}

		/* 해설 안보이게 처리 */
		if( document.getElementById('comment'+i) ) {
			document.getElementById('comment'+i).style.display = "none";
		}

		/* 답안지 번호*/
		document.getElementById('ans_num'+i).style.backgroundImage = "";

		/* 답안지 문항*/
		for(var j=1; j<=4; j++) {
			itemType = document.getElementById('answer'+i+j);
			
			if(itemType != null) document.getElementById('answer'+i+j).src = "./img/num"+ j + ".gif";
			else if( document.getElementById('ansInsert_text'+i) ) { /* 주관식*/
				var insSpan = document.getElementById('ansInsert_span'+i);
				var insText = document.getElementById('ansInsert_text'+i);

				insSpan.style.display = "none";
				insText.value = "";
				insText.style.display = "";
			}
		}
				
		/* 답안지 정답 체크*/
		for(var j=1; j<=4; j++) {
			itemType = document.getElementById('ans_td'+i+j);
			if(itemType != null) document.getElementById('ans_td'+i+j).style.backgroundImage = "";
		}

		/* 응시기록 리셋*/
		document.getElementById('ans_try'+i).value = "";
	}
}

function scoring_targetDiv(targetDiv, startNum, eachTotal) {
	var f = document.test_form;
	var ans_try, ans_real, selectType, oxState;
	var correctCount=0;

	var mode = document.getElementById('current_mode').value;
	var endNum = eval(startNum) + eval(eachTotal) - 1;

	for(var i=startNum; i <= endNum; i++) {
		ans_try = document.getElementById('ans_try'+i).value;
		ans_real = document.getElementById('ans_real'+i).value;

		/* 주관/객관 설정변수*/
		if( document.getElementById('ansInsert_span'+i) ) selectType = 1;
		else { selectType = 0; }
		oxState = get_OX_state(ans_try, ans_real, selectType);

		// 정답률
		if( mode != "incorrect" && document.getElementById('rate'+i) ) { document.getElementById('rate'+i).style.display = "inline"; }

		/* 해설 뷰*/
		if( mode != "incorrect" && document.getElementById('comment'+i) ) {
			document.getElementById('comment'+i).style.display = "block";
		}

		/* 1단계 : 문제지 문항, 답안지 문항에 정답,오답 표시*/
		if(oxState.substr(0,1) == "1") { /* 정답*/
			correctCount++;

		/* 문제지 문제번호에 o 표시*/
		document.getElementById('ques_ox'+i).style.backgroundImage = "url('./img/re_o.gif')";

		/* 답안지 문제번호에 o 표시*/
		document.getElementById('ans_num'+i).style.backgroundImage = "url('./img/ans_O.gif')";
		document.getElementById('ans_num'+i).style.backgroundRepeat = "no-repeat";
		}
		else { /* 오답*/
			if(mode != "incorrect") { /* 틀린문제풀기에서 오답은 그냥둠*/

				/* 문제지 문제번호에 x 표시*/
				document.getElementById('ques_ox'+i).style.backgroundImage = "url('./img/re_x.gif')";
								
				/* 답안지 문제번호에 x 표시*/
				document.getElementById('ans_num'+i).style.backgroundImage = "url('./img/x24.gif')";
				document.getElementById('ans_num'+i).style.backgroundRepeat = "no-repeat";
			}
		}

		/* 2단계 : 답안지에서 정답 표시(복수정답 고려)*/
		if( selectType == 0 ) { /* 객관식*/
			if(mode == "incorrect" && oxState.substr(0,1) == "0") { /* 틀린문제풀기에서 오답이면 패스*/
		}
		else {
			if(oxState.length == 1) { /* 단수정답*/
				document.getElementById('ans_td'+i+ans_real).style.backgroundImage = "url(./img/circle_blue22.gif)";
				document.getElementById('ans_td'+i+ans_real).style.backgroundRepeat = "no-repeat";
			}
			else { /* 복수정답*/
				for(var j=1; j <= oxState.length-1; j++) { /* 1, 0 자리 고려*/
					ans_index = oxState.substr(j,1);
					document.getElementById('ans_td'+i+ans_index).style.backgroundImage = "url('./img/circle_blue22.gif')";
					document.getElementById('ans_td'+i+ans_index).style.backgroundRepeat = "no-repeat";
				}
			}
		}
	}

	else if( document.getElementById('ansInsert_span'+i) ) { /* 주관식*/
		var insSpan = document.getElementById('ansInsert_span'+i);
		var insText = document.getElementById('ansInsert_text'+i);

		insSpan.innerHTML = "<span style='color:blue; font-weight:bold'>"+ ans_real + "</span>/" + ans_try;

		if(mode == "incorrect" && oxState.substr(0,1) == "0") {
			insSpan.style.display = "none";
			insText.style.display = "";
		}
		else { /* 정답이면 ans_try에 값 세팅*/
			insSpan.style.display = "";
			insText.value = ans_try;
			insText.style.display = "none";
		}
	}

	/* 3단계 : 문제지 답항표시(복수정답 고려), 답안지에서 시도답항 표시*/
	if(selectType == 0) {
		if(mode == "incorrect" && oxState.substr(0,1) == "0") { /* 틀린문제풀기에서 오답은 그냥둠*/
	}
	else {
		/* 문제지 표시*/
		if(oxState.length == 1) { /* 단수정답*/
			if(oxState == "1") { /* 정답 */
				document.getElementById('quesitem'+i+ans_real).style.backgroundImage = "url(./img/ov38.gif)";
				document.getElementById('quesitem'+i+ans_real).style.backgroundRepeat = "no-repeat";
			}
			else { /* 오답*/
				/* 정답 단독표시*/
				document.getElementById('quesitem'+i+ans_real).style.backgroundImage = "url(./img/o3524.gif)";
				document.getElementById('quesitem'+i+ans_real).style.backgroundRepeat = "no-repeat";

				if(ans_try > 0) { /* 시도는 했는데 오답*/
					document.getElementById('quesitem'+i+ans_try).style.backgroundImage = "url(./img/red_v38.gif)";
					document.getElementById('quesitem'+i+ans_try).style.backgroundRepeat = "no-repeat";
				}
			}
		}
		else { /* 복수정답*/
			var circleType;

			for(var j=1; j <= oxState.length-1; j++) { /* 1, 0 자리 고려*/
				ans_index = oxState.substr(j,1);

				if(ans_try > 0 && ans_try == ans_index) circleType = "ov38"; /* 둥근원+체크표시*/
				else { circleType = "o3524"; }
					document.getElementById('quesitem'+i+ans_index).style.backgroundImage = "url('./img/"+ circleType +".gif')";
					document.getElementById('quesitem'+i+ans_index).style.backgroundRepeat = "no-repeat";
				}
			}
			/* 답안지 시도문항 표시*/
			if(ans_try > 0) document.getElementById('answer'+i+ans_try).src = "./img/num"+ ans_try + "_gray.gif";
		}
	}			
	}
	/* 결과 표시*/
	var resultDisplay = document.getElementById('resultDisplay'+targetDiv);
	resultDisplay.innerHTML = correctCount + " / " + eachTotal;
}

function get_OX_state(ans_try, ans_real, selectType) { /* selectType 주관식 여부.*/
	ans_try = spaceOut_qpass(ans_try);
	ans_real = spaceOut_qpass(ans_real);

if(ans_try == ans_real) return "1"; /* 주관/객관 공용*/
		if(selectType == 0) { /* 객관식*/
			if(ans_real.length == 1) { return "0"; } /* 답안과 정답이 다른데, 단수정답이면 오답*/
			else { /* 다수정답인 경우*/
				if( ans_try !='' && ans_real.indexOf(ans_try) != -1) /* 시도를 하고, 정답이 들어있으면 정답열을 리턴*/
					return '1' + all_answer_num(ans_real);
				else					
					return '0' + all_answer_num(ans_real);
				}
		}
		else { /* 주관식*/
			return compare_strings(ans_real, ans_try);
		}
}

function compare_strings(ans_real, ans_try) {
	if(ans_try == "") return "0";
	ans_try = spaceOut_qpass(ans_try);

	var realList = ans_real.split(",");
	for(var i=0; i < realList.length; i++) {
		if(spaceOut_qpass(realList[i]) == ans_try) return "1";
	}
	return "0";
}

function all_answer_num(str) {
var new_str = "";
var ch = '';
for(var i=0; i < str.length; i++) {
		ch = str.substr(i,1);
		if(ch != ',' && ch !='/' && ch != '') new_str = new_str + '' + ch;
}
return new_str;
}

function spaceOut_qpass(str) {
	var newStr="", ch="";
	for(var i=0; i < str.length; i++) {
		ch = str.substr(i,1);
		if(ch != " ") newStr = newStr + "" + ch;
	}
	return newStr;
}

function get_ansReal(question_num) {
	var targetDiv = document.getElementById('current_i').value;
}

function answer_check(question_num, ans_num) {
var currentMode = document.getElementById('current_mode').value;
var incorrectRight="";
if(currentMode == "incorrect") {
		var ans_try = document.getElementById('ans_trySame'+question_num).value;
		var ans_real = document.getElementById('ans_real'+question_num).value;
		incorrectRight = get_OX_state(ans_try, ans_real);
	}

	if(currentMode == "check" || currentMode == "restudyCheck" || currentMode == "incorrectCheck") {
		alert("지금은 문제별 응시결과 확인 중 입니다.\n\n다시풀기는 첫화면으로 가셔서 '다시풀어보기' \n\n또는 '틀린문제 다시풀기'를 선택하세요.");
		return;
	}
	else if(incorrectRight.substr(0,1)=="1") {
		alert("지금은 틀린 문제만 다시 풀고 계십니다. \n\n이미 맞힌 문제는 넘어가세요.");
		return;
	}

	var ans = document.getElementById('answer'+question_num+ans_num);
	var ques = document.getElementById('quesitem'+question_num+ans_num);

	/* 먼저 기존 칠한게 있으면 지우기*/
	for(i=1; i <= 4 ; i++) {
		document.getElementById('answer'+question_num+i).src = "./img/num"+ i + ".gif";
		document.getElementById('quesitem'+question_num+i).style.backgroundImage = "";
	}

	var ansIndex = question_num - document.getElementById('current_startNum').value;
	move2question(ansIndex);
	ques.style.backgroundImage = "url('./img/red_v38.gif')";
	ques.style.backgroundRepeat = "no-repeat";
	ans.src = "./img/num"+ ans_num + "_gray.gif";

	/* 폼에 값 저장하기*/
	document.getElementById('ans_try'+question_num).value = ans_num;
}

function previous_div(courseName, divIndex, fiveIndex) {
	if(fiveIndex == 0) {
		alert("여기가 " + courseName + " 처음입니다.\t");
		return;
	}
	nextFive = eval(fiveIndex) - eval(1);
	replace_div(divIndex, nextFive);
}

function next_div(courseName, divIndex, fiveIndex) {
	if(fiveIndex == max_five[divIndex]) {
		alert("여기가 " + courseName + " 마지막입니다.\t");
		return;
	}
	nextFive = eval(fiveIndex) + eval(1);
	replace_div(divIndex, nextFive);
}

function move2question(ansIndex) {
	var divNum = document.getElementById('current_i').value;
	var fiveNum = Math.floor(ansIndex / 5);
	replace_div(divNum, fiveNum);
}	

function get_notTriedNum(startNum, endNum) {
	var ans_try;
	for(var i=startNum; i <= endNum; i++) {
		ans_try = document.getElementById('ans_try'+i).value;
		if(ans_try == "") return i;
	}
	return -1;
}

function finish_exam(divIndex) {
	/* 안푼 문제가 있는지 체크*/
	var startNum = document.getElementById('current_startNum').value;
	var eachTotal = document.getElementById('current_questionTotal').value;
	var endNum = eval(startNum) + eval( eachTotal ) - 1;

	/* 주관식 문제 이전*/
	for(var i=startNum; i <= endNum; i++) {
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
	else if(f.mode.value == 'incorrect') start_test(nextSameIndex, "incorrectCheck", startNum, eachTotal);
}
</script>

</div> <!-- PC 시험 영역 끝 -->
</div> <!-- PC 컨테이너 여백 끝 -->
</div> <!-- PC 컨테이너 끝 -->
</div> <!-- Mobile, PC 페이지 컨테이너 가운데 정렬 끝 -->	
</body>
</html>