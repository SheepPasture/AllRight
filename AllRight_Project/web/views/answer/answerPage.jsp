<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLRight</title>
<!-- 제이쿼리 파일 -->
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div align="center"><!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->

<table style="margin-bottom:5px; width:100%; border:solid 0px #ccc; background:beige;" cellspacing="0" cellpadding="0" >
		<tr>
		<td style="padding:15px 0px; width:120px; font-family:tahoma; text-align:center;">
		<div id="testing" style="display:none;">
		</td>
		<td>	
		<div id="top" style="padding:12px 0px; text-align:left;"><!--PC 리본메뉴, 문제집중뷰 시작.-->
		<form name='form' action="<%= request.getContextPath() %> /question.qu" method='post' style='margin:0px;'>
		<select id='menu_top_select' name='top' onchange='topOptChange(this.form)'>
		<option value=''>응시 분야를 선택하세요.</option>
		<option value='10'>기능·기술 [기사]</option>
		<option value='11'>기능·기술 [산업기사]</option>
		<option value='12' selected>기능·기술 [기능사]</option>
		<option value='15'>기능·기술 [미용사]</option>
		<option value='18'>서비스 [멀티미디어]</option>
		<option value='19'>서비스 [텔레마케팅]</option>
		<option value='20'>사무 [컴퓨터활용능력]</option>
		<option value='21'>사무 [워드프로세서]</option>
		<option value='25'>판매 [전자상거래운용사]</option>
		<option value='30'>회계 [전산회계운용사]</option>
		<option value='70'>공인 [PC정비사]</option>
		<option value='75'>공인 [네트워크관리사]</option>
		</select>
		&nbsp;
		<select name='menu_top_select' name='mid' onchange='midOptChange(this.form)'>
		<option value=''>종목을 선택하세요.</option>
		<option value="1210" selected>정보처리기능사</option>
		</select>
		&nbsp;
		<select name='menu_top_select' name='small' onchange='smallOptChange(this.form)'>
		<option value=''>회차를 선택하세요.</option>
		<option value="-2">랜덤 모의고사</option>
		<option value="121049" selected>2011년 1회</option>
		<option value="121050">2011년 2회</option>
		</select>
		
		</form>
		<script type="text/javascript"></script>	
	 <div style="margin-top:10px; height:125px;"><!--구글검색 영역 시작.-->
	 <div style="float:left;">
	 <div id="google_search" style="height:30px;"><!--구글검색 (전체 웹 검색)-->
	 <form action="http://www.google.co.kr" id="cse-search-box" target="_blank">
			<div>
				<input type="hidden" name="cx" value="partner-pub-1981615758276157:4489152794" />
				<input type="hidden" name="ie" value="UTF-8" />
				<input type="text" name="q" size="54" />
				<input type="submit" name="sa" value="검색" />
			</div>
			</form>
			<script type="text/javascript" src="http://www.google.co.kr/coop/cse/brand?form=cse-search-box&amp;lang=ko"></script>
	</div></div></div></div></td></tr>
</table>

<table style="margin:0px 0px 5px 0px; width:100%; border:1px solid #ccc; background:#f8f8f8" align="center"><!-- 상단 타이틀 시작. -->
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
<td style="padding-right:5px; text-align:right;" valign="middle">
	<input type="button" value="첫화면" class="btn01_qpass" style="width:60px; border:1px solid #008000;" onclick="move2main()">
</td>
</tr>
</table><!-- 상단 타이틀 끝. -->

<input type="hidden" id="current_i" value="0" size="3">
<input type="hidden" id="current_j" value="0" size="3">

<table width="100%" cellspacing="0" cellpadding="0" style="margin-top:0px;" border="0">
<tbody>
<tr>
<td width="50%" valign="top" class="ed" style="padding-top:5px;">
<div id="ques_ox1" style="margin:0px; position:absolute; width:55px; height:45px;">
<img src="./images/answer/blank.gif" style="width:55px; height:45px;"></div>

<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
<tbody><tr><td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">1.</td>
<td style="width:98%" valign="top" class="question01_qpass">CPU를 경유하지 않고 고속의 입출력장치와 기억장치가 직접 데이터를 주고받는 방식은? <br>
<span id="rate1" class="rightRate" style="display:none">[정답률: 72%]</span></td></tr><tr><td></td>
<td id="quesitem11" class="question02_qpass" style="background-repeat: no-repeat; background-image: url(&quot;./img/red_v38.gif&quot;);">
<a href="javascript:answer_check(1, 1)">① DMA(Direct Memory Access)</a></td></tr><tr><td></td><td id="quesitem12" class="question02_qpass" style="background-repeat: no-repeat;">
<a href="javascript:answer_check(1, 2)">② 프로그램에 의한 입출력(Programmed I/O)</a></td></tr><tr><td></td><td id="quesitem13" class="question02_qpass" style="background-repeat: no-repeat;">
<a href="javascript:answer_check(1, 3)">③ 인터럽트에 의한 입출력(interrupt driven I/O)</a></td></tr><tr><td></td><td id="quesitem14" class="question02_qpass" style="background-repeat: no-repeat;">
<a href="javascript:answer_check(1, 4)">④ 채널 제어기에 의한 입출력</a></td></tr>
</tbody></table>
<div id="ques_ox2" style="margin:0px; position:absolute; width:55px; height:45px;">
<img src="./img/blank.gif" style="width:55px; height:45px;"></div>

<table style="margin-bottom:10px; width:100%; height:150px; border:0" cellspacing="0" cellpadding="5">
<tbody><tr><td style="padding-left:8px; width:25px; text-align:right" valign="top" class="count_qpass">2.</td>
<td style="width:98%" valign="top" class="question01_qpass">순차처리(Sequential access)만 가능한 장치는? <br>
<span id="rate2" class="rightRate" style="display:none">[정답률: 70%]</span></td></tr><tr><td></td>
<td id="quesitem21" class="question02_qpass">
<a href="javascript:answer_check(2, 1)">① magnetic core</a></td></tr><tr><td></td><td id="quesitem22" class="question02_qpass">
<a href="javascript:answer_check(2, 2)">② magnetic drum</a></td></tr><tr><td></td><td id="quesitem23" class="question02_qpass">
<a href="javascript:answer_check(2, 3)">③ magnetic disk</a></td></tr><tr><td></td><td id="quesitem24" class="question02_qpass">
<a href="javascript:answer_check(2, 4)">④ magnetic tape</a></td></tr>
</tbody></table>

<table width="100%" height="50"  border:"0">

</table>
<!--  Content Start -->
<script>
function move2main(){ // 첫화면
	var currentI = document.getElementById('current_i').value;
	var currentJ = document.getElementById('current_j').value;
	var currentDiv = document.getElementById('div' + 'currentI' + 'currentJ');
	
	currentDiv.style.display = "none";
	index_div.style.display='';

	var currentAns = document.getElementById('ans'+ currentI);
	currentAns.style.display = "none";

	var indexDiv = document.getElementById('index_div');
	indexDiv.style.visibility = "visible";
}

function move2question(){
	
	
	
}

function answer_check(question_num, ans_num){
	var currentMode = document.getElementById('current_mode').value;
	var incorrectRight = "";
if(currentMode == "incorrect"){
		
	
}
	
}
</script>

<!-- Content End -->
</div> <!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->	
</body>
</html>