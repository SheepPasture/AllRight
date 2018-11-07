<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>ALLRight</title>
</head>
<body>
 <table style="margin-bottom:5px; width:100%; border:solid 0px #ccc; background:beige;" cellspacing="0" cellpadding="0">
		<tr>
			<td style="padding:15px 0px; width:120px; font-family:tahoma; text-align:center;">
		<div id="testing" style="display:none;">
			</td>
			<td>	
		<div id="top" style="padding:12px 0px; text-align:left;"><!--PC 리본메뉴, 문제집중뷰 시작.-->
		<form name='form' method='post' action='/q/index.php' 
		style='margin:0px;'>
		<select id='menu_top_select' name='bigCode' onchange='bigOptChange(this.form)'>
		<option value=''>응시 분야를 선택하세요.</option>
		<option value='10'>기능·기술 [기사]</option>
		<option value='11'>기능·기술 [산업기사]</option>
		<option value='12'>기능·기술 [기능사]</option>
		<option value='15'>기능·기술 [미용사]</option>
		<option value='18'>서비스 [멀티미디어]</option>
		<option value='19'>서비스 [텔레마케팅]</option>
		<option value='20'>사무 [컴퓨터활용능력]</option>
		<option value='21'>사무 [워드프로세서]</option>
		<option value='25'>판매 [전자상거래운용사]</option>
		<option value='30'>회계 [전산회계운용사]</option>
		<option value='70'>공인 [PC정비사]</option>
		<option value='75'>공인 [네트워크관리사]</option>
		</select>&nbsp;
		<span style='padding-left:20px; font-size:10pt; font-weight:bold;'>[현재 종목] 정보처리기능사</span><span style='padding-left:20px;'>
		<a href="javascript:location.href='indexRandom.php?midCode=1210'">
		<a href="">기출문제 메인</a>
		</form>
		<script type="text/javascript"></script>	
	 <div style="margin-top:10px; height:125px;"><!--구글검색, 애드센스, 기사퍼스트 링크 영역 시작.-->
	 <div style="float:left;">
	 <div id="google_search" style="height:30px;"><!--구글검색 (전체 웹 검색)-->
	 <form action="http://www.google.co.kr" id="cse-search-box" target="_blank">
			<div>
				<input type="hidden" name="cx" value="partner-pub-1981615758276157:4489152794" />
				<input type="hidden" name="ie" value="UTF-8" />
				<input type="text" name="q" size="54" />
				<input type="submit" name="sa" value="&#xac80;&#xc0c9;" />
			</div>
			</form>
			<script type="text/javascript" src="http://www.google.co.kr/coop/cse/brand?form=cse-search-box&amp;lang=ko"></script>
	</div></div></div></div></td></tr>
</table>
 	<div style='margin-bottom:10px; color:#ff6868; text-align:center;'>※ 응시하기 버튼을 클릭하시면, 신규응시 또는 이전 응시결과 상세분석, 틀린 문제 다시 풀기 등을 하실 수 있습니다.</div>
	<table style='margin-top:0px; width:100%; border:0px;' cellpadding='5' cellspacing='0' align='center'>
	<tr height='20px'>
	<td width='' class='td_border_commonTitle_qpass'>순번</td>
	<td width='' class='td_border_commonTitle_qpass'>분류</td>
	<td width='' class='td_border_commonTitle_qpass'>시험명</td>
	<td width='' class='td_border_commonTitle_qpass'>문제수</td>
	<td width='' class='td_border_commonTitle_qpass'>시험응시</td>
	<td width='' class='td_border_rightTitle_qpass'>응시결과</td></tr>
	</table></div>
	
</body>
 </html>