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
<!-- 제이쿼리 파일 -->
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div align="center"><!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->
<table style="margin-bottom:5px; width:100%; border:solid 0px #ccc; background:beige;" cellspacing="0" cellpadding="0">
		<tr>
		<td style="padding:15px 0px; width:120px; font-family:tahoma; text-align:center;">
		<div id="testing" style="display:none;">
		</td>
		<td>	
		<div id="top" style="padding:12px 0px; text-align:left;"><!--PC 리본메뉴, 문제집중뷰 시작.-->
		<form name='form' action="<%= request.getContextPath() %> /answer.te" method='post' style='margin:0px;'>
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
		<option va lue='70'>공인 [PC정비사]</option>
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

<div style="padding: 5px 5px 35px 5px; min-height: 600px; border: solid 1px #ccc;">
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
<td style="padding-right:5px; text-align:right";>
	<input type="button" value="첫화면" class="btn01_qpass" style="width:60px; border:1px solid #008000;" onclick="main()">
</td>
</tr>
</table><!-- 상단 타이틀 끝. -->


<!-- 문제 시작.-->
<div>
	<% if ( qs != null) { %>
<table id="questionList" width="80%" border="1"  align="left">
<tbody>
<tr border="1">
<td> <!-- 왼쪽 문제 -->
<% for(int i = 0; i < 3; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
	<table>
		<tr>
			<td><b><%= question.getqNo() %>. </b></td>
			<td><b><%= question.getqContent() %></b></td>
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</table>
	<br>
<% } %>
</td>
<td> <!-- 오른쪽 문제 -->
<% for(int i = 0; i < 2; i++, qNo+=4) { %>
<% Question question = qs.get(qNo); %>
	<table>
		<tr>
			<td><b><%= question.getqNo() %>. </b></td>
			<td><b><%= question.getqContent() %></b></td>
		</tr>
		<% for(int j = qNo; j < qNo+4; j++){ %>
		<tr>
			<td></td>
			<td><%= qs.get(j).getqPre() %></td>
		</tr>
		<% } %>
	</table>
	<br>
<% } %>
</td>
</tr>
</tbody>
</table>
<% } %>

<table border="1" width="10%" align="right">
<thead>
	<tr>
		<td align="center" colspan="5" style="color:green; font-weight:bold; border:1px solid #ccc; border-bottom:none">1과목</td>
	</tr>
</thead>
<tbody>
	<% for(int i = 1 ; i < 21 ; i++) { %>
	<tr style="height:0px;">
		<td style="color:green; font-weight:bold; text-align:center;"><%= i %></td>
		<td width="24px" align="center" valign="middle">①</td>
		<td width="24px" align="center" valign="middle">②</td>
		<td width="24px" align="center" valign="middle">③</td>
		<td width="24px" align="center" valign="middle">④</td>
	</tr>
	<% } %>
</tbody>



</table>

</div>
<p align="right" style="display:block; margin: 10px 0px 0px 0px;">
<input type="button" value="답안제출" style="width:70px"></p>
</div>


<input type="hidden" id="current_i" value="0" size="3">
<input type="hidden" id="current_j" value="0" size="3">


<!-- 문제 끝. -->

<script>
function main(){ // 첫화면
	var currentI = document.getElementById('current_i').value;
	var currentJ = document.getElementById('current_j').value;
	
}

function move2question(){
	
		
}

function answer_check(1, 1){
	var check = document.getElementById();
			
}

/* 버튼  */ 
function finish(){
	var finishbtn = document.getElementById('btnFinish');
	
}

for(var j=1 j<=4 j++){
	
}
}
</script>

</div> <!--Mobile, PC 페이지 컨테이너 가운데 정렬 시작.-->	
</body>
</html>