<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLRight</title>
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
	<td style="font-family:MalgunGothic,Sans-serif; font-weight:bolder; color:lightskyblue; font-size:13pt" align="center" valign="middle">
	정보처리기능사 필기 (2011년 1회 기출문제) 응시
</td>
<td style="padding-right:5px; text-align:right;" valign="middle">
	<input type="button" value="첫화면" class="btn01_qpass" style="width:60px; border:1px solid #008000;" onclick="move2main()">
</td>
</tr>
</table><!-- 상단 타이틀 끝. -->

	<div id="index_div" style="margin-top:25px; width:730px;" align="right"><!-- 첫화면 컨테이너 시작. -->
<table style="width:100%; border:3px double #aaa;" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td style="text-align:center;">
		</div>
			<div style="margin:0px; padding:10px; font-size:10pt; font-weight:normal; line-height:1.4; ">
			<span id="subj_01">2011년 1회 정보처리기능사<br />
	[필기] 기출문제 모의고사 CBT</span><br>
	<br />
	<div id="linesp_01"></div>
	[1과목] 전자계산기일반 (20문제)<br>
	[2과목] 패키지일반 (10문제)<br />
	[3과목] PC운영체제 (20문제)<br />
	[4과목] 정보통신일반 (10문제)<br />
	<br />
	<div id="linesp_01"></div>[시험시간] 과목 구분 없이 60분 (30분 경과 퇴실 가능)<br />
	[합격점수] 60점 이상 (60문제 중 36문제 이상 득점)<br />
	<br />
	<span id="refe_01">[참고사항]</span><br />
	<div id="refe_02">2012년 이후 정보처리기능사 자격검정은 수탁 시행기관인 한국산업인력공단에서 한국기술자격검정원으로 재위탁하여 상시검정만 시행합니다. 
	기출문제는 정기검정 필기시험에 한하여 공개되므로 2012년부터 공개되지 않습니다.
	</div></div>
	</td>
	</tr>
	<tr>
	<td style="padding:15px 0px; text-align:center;">
			<div style="height:24px;"><!--PC 애드센스 링크 광고 (첫화면)-->
			<!-- CBT-PC (링크) -->
			<ins class="adsbygoogle"
				style="display:block"
				data-ad-client="ca-pub-1981615758276157"
				data-ad-slot="2375646873"
				data-ad-format="link"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>
		</td>
	</tr>
	<tr>
	<td style="padding:0px; border-top:3px double #aaa; background:#f5f5f5" align="center">
	
		<table style="padding-bottom:5px; width:100%; " cellspacing='0' cellpadding='0'>
		<tr height='33'>
		<td style='padding:3px 2px 1px 2px; text-align:center' class='title01'>구분</td>
		<td style='padding:3px 2px 1px 2px; text-align:center' class='title01'>정답수/문제수</td>
		<td style='padding:3px 2px 1px 2px; text-align:center' class='title01'>응시일시</td>
		<td style='padding:3px 2px 1px 2px; text-align:center' class='title01'>5문제씩풀기</td>
		<td style='padding:3px 2px 1px 2px; text-align:center' class='title01'>1문제씩풀기</td>
		</tr>
	
	<tr style='padding:3px 2px 1px 2px' height='33'>
	<td align='center'>1과목</td>
	<td align='center'>응시전<br />20문제<br /></td><td>&nbsp;</td>
	<td colspan='1' align='center'><a href="<%=request.getContextPath() %>/question.qu" style='color:#79a5e4; font-weight:bold'>응시하기</a></td>
	<td colspan='1' align='center'><a href="<%=request.getContextPath() %>/question.qu" style='color:#79a5e4; font-weight:bold'>응시하기</a></td></td></tr>
	<tr style='padding:3px 2px 1px 2px' height='33'>
	<td align='center'>2과목</td>
	<td align='center'>응시전<br />10문제<br /></td><td>&nbsp;</td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td></td></tr>
	<tr style='padding:3px 2px 1px 2px' height='33'>
	<td align='center'>3과목</td><td align='center'>응시전<br />20문제<br /></td><td>&nbsp;</td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td></td></tr>
	
	<tr style='padding:3px 2px 1px 2px' height='33'>
	<td align='center'>4과목</td><td align='center'>응시전<br />10문제<br /></td><td>&nbsp;</td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td>
	<td colspan='1' align='center'><a href="" style='color:#79a5e4; font-weight:bold'>응시하기</a></td></td></tr>
	</table>
	</td>
	</tr>
	</table>



</div><!--Mobile, PC 페이지 컨테이너 가운데 정렬 끝.-->
</body>
</html>