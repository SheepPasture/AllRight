<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>ALLRight</title>

	<!-- JQuery -->
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<style>
/* * {
	margin: 0;
	padding: 0;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup,
	tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label,
	legend, table, caption, tbody, tfoot, thead, tr, th, td, input {
	font-family: ng, sans-serif !important;
	-webkit-text-size-adjust: none;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
	b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
} */

/* .list_wrap .table_wrap {
	width: 765px;
	float: left;
} */

.list_wrap .table_wrap {
	position: relative;
}

.list_wrap {
	padding: 20px 0;
	zoom: 1;
}

.list_wrap::after {
	display: block;
	content: "";
	clear: both;
}

/* .sub_wrap {
	width: 1025px;
	margin: 0 auto;
	padding-top: 20px;
} */

/* .conwrap {
	position: relative;
}
 */
/* .conwrap {
	background: #eff0f0;
} */

.conwrap {
	position: relative;
}

.wrap {
	min-width: 1024px;
}

body {
	line-height: 1;
	font-size: 14px;
}

body {
	width: 100%;
	height: 100%;
	font-family: Dotum;
	font-size: 12px;
}

html {
	overflow-y: scroll;
}

.list_wrap .table {
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid #dedede;
	box-sizing: border-box;
}

.list_wrap .table .table_in {
	position: relative;
	padding: 30px;
}

.list_wrap .table .table_top {
	zoom: 1;
}

.list_wrap .table .table_top::after {
	display: block;
	content: "";
	clear: both;
}

.list_wrap .table .table_in .total {
	color: #666;
	font-size: 13px;
	position: absolute;
	top: 90px;
	left: 30px;
	*z-index: -1:;
}

.table_main {
	zoom: 1;
	padding-top: 15px;
	*position: relative:;
	*z-index: -1:;
}

.table_main::after {
	display: block;
	content: "";
	clear: both;
}

.table_main .table_main_top {
	float: right;
}

.table_main_conts {
	padding-top: 45px;
}

.dyuna_paging_wrap {
	position: relative;
	text-align: center;
	margin-top: 22px;
}

.dyuna_paging_wrap .paging_type2 {
	display: inline-block;
	zoom: 1;
	*display: inline:;
}

ol, ul {
	list-style: none;
}

.dyuna_paging_wrap .paging_type2 ul {
	float: left;
}

.dyuna_paging_wrap .paging_type2 .next_wrap {
	float: left;
	border: 1px solid #e8e8e8;
	border-radius: 3px;
	margin-left: 10px;
	overflow: hidden;
}

.dyuna_paging_wrap .paging_type2 .next_wrap .next {
	width: 35px;
	height: 35px;
	float: left;
	cursor: pointer;
	text-indent: -9999px;
	background:
		url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/pager_bg.png')
		no-repeat -216px center #fff;
}

.dyuna_paging_wrap .paging_type2 .next_wrap .after {
	width: 35px;
	height: 35px;
	float: left;
	border-left: 1px solid #e8e8e8;
	cursor: pointer;
	text-indent: -9999px;
	background:
		url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/pager_bg.png')
		no-repeat -273px center #fff;
}

.dyuna_paging_wrap .paging_type2 ul li {
	float: left;
}

.dyuna_paging_wrap .paging_type2 ul li+li {
	margin-left: 3px;
}

a {
	font-size: 14px;
	color: #767676;
	text-decoration: none;
}

.dyuna_paging_wrap .paging_type2 ul li a {
	display: block;
	text-align: center;
	width: 35px;
	height: 35px;
	border: 1px solid #e8e8e8;
	border-radius: 3px;
	font-size: 13px;
	font-weight: bold;
	line-height: 35px;
	background-color: #fff;
}

.dyuna_paging_wrap .paging_type2 ul li.active a, .dyuna_paging_wrap .paging_type2 ul li a:hover
	{
	background-color: #adadad;
	color: #fff;
	border: 1px solid #adadad;
}

.table_type01 .type01_top {
	border-top: 2px solid #4d4d4d;
	border-bottom: 1px solid #4d4d4d;
	overflow: hidden;
}

.table_type01 .type01_list {
	font-size: 13px;
}

.table_type01 .type01_list li {
	position: relative;
	padding: 10px 190px 10px 20px;
	border-bottom: 1px solid #e8e8e8;
	overflow: hidden;
}

.table_type01 .type01_list li.notice {
	padding: 15px 205px 15px 20px;
	background-color: #f4f7fd;
}

.board .table_type01 .type01_list li {
	padding: 10px 200px 10px 50px;
}

.board .type01_number {
	position: absolute;
	top: 50%;
	left: 0px;
	width: 50px;
	text-align: center;
	margin-top: -7px;
}

.table_type01 .type01_list li .type01_text {
	float: left;
	width: 390px;
}

.board .table_type01 .type01_list li .type01_text {
	width: 355px;
}

.table_type01 .type01_list.renew li .type01_text {
	width: auto;
}

.table_type01 .type01_list.renew li .text_wrap {
	zoom: 1;
	padding-top: 8px;
}

.table_type01 .type01_list.renew li .text_wrap::after {
	display: block;
	content: "";
	clear: both;
}

.table_type01 .type01_list.renew li.nosum .text_wrap {
	padding: 0;
}

.type01_detail {
	overflow: hidden;
}

.board .type01_detail .writer {
	width: 60px;
	text-align: center;
	position: absolute;
	top: 50%;
	right: 150px;
	margin-top: -7px;
}

.type01_detail .number {
	width: 100px;
	text-align: center;
	position: absolute;
	top: 50%;
	right: 108px;
	margin-top: -7px;
}

.board .type01_detail .number {
	width: 60px;
	right: 90px;
}

.type01_detail .date {
	width: 105px;
	text-align: center;
	position: absolute;
	top: 50%;
	right: 0px;
	margin-top: -7px;
}

.board .type01_detail .date {
	width: 90px;
}

.type01_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #333;
	padding: 5px 0;
}

.table_type01 .type01_list.renew li .text_wrap .type01_title {
	float: left;
	max-width: 322px;
}

.board .table_type01 .type01_list.renew li .text_wrap .type01_title {
	max-width: 278px;
}

.table_type01 .type01_list.renew li.nosum .text_wrap .type01_title {
	max-width: 415px;
}

.board .table_type01 .type01_list.renew li.nosum .text_wrap .type01_title
	{
	max-width: 370px;
}

.table_type01 .type01_list.renew li .text_wrap .comment {
	float: left;
	color: #ee3c55;
	padding: 5px 5px 5px 0;
}

.type01_title strong {
	font-weight: bold;
	color: #000;
	margin-right: 5px;
}

.table_type01 .type01_list.renew li .text_wrap .new {
	float: left;
	padding-top: 4px;
}

.table_type01 .type01_list li.notice .type01_title {
	color: #315dd0;
	font-weight: bold;
}

.table_type01 .type01_list li.notice .type01_title a {
	color: #315dd0;
}

.table_type01 .type01_top li {
	float: left;
	color: #4d4d4d;
	font-size: 14px;
	text-align: center;
	font-weight: bold;
	padding: 15px 0;
}

.board .table_type01 .type01_top li.col0 {
	width: 50px;
}

.table_type01 .type01_top li.col1 {
	width: 495px;
}

.board .table_type01 .type01_top li.col1 {
	width: 443px;
}

.table_type01 .type01_top li.col2 {
	width: 100px;
}

.board .table_type01 .type01_top li.col2 {
	width: 60px;
}

.table_type01 .type01_top li.col3 {
/* 	float: right; */
	width: 105px;
}

.board .table_type01 .type01_top li.col3 {
/* 	float: left; */
	width: 60px;
}

.board .table_type01 .type01_top li.col4 {
/* 	float: right; */
	width: 90px;
}

.table_main .table_main_top>ul {
	float: left;
}

.table_main .table_main_top .list_search.pc {
	float: left;
}

/* .menu-slide-mobile .txtlog, .btn-open, .btn-close, .btn-search,
	.user-name, .user-notice, .mobile, .img-m {
	display: none !important;
} */
/* 
.table_main .table_main_top .list_search.mobile {
	display: none;
} */

.table_main .table_main_top .list_search.pc select {
	width: 110px;
	height: 30px;
	padding: 5px 0;
	vertical-align: middle;
	*margin-top: 5px:;
	border: 1px solid #dedede;
	box-sizing: border-box;
	*height: 20px:;
	*:;
}

.list_wrap .table .table_top .table_top_input {
	float: right;
}

.list_wrap .table .table_top .table_top_input select {
	width: 80px;
	height: 30px;
	padding: 5px 0;
	vertical-align: middle;
	*margin-top: 5px:;
	border: 1px solid #dedede;
	box-sizing: border-box;
	*height: 20px:;
}

.list_wrap .table .table_top .table_top_input input {
	width: 280px;
	height: 30px;
	padding: 5px 10px;
	vertical-align: middle;
	*margin-top: 5px:;
	border: 1px solid #dedede;
	box-sizing: border-box;
	*height: 20px:;
	*padding: 0 5px:;
}


</style>

</head>
<body>

	<!-- PAGE -->
	<div id="page">

		<%@ include file="/views/common/header.jsp"%>

		<div class="container-fluid text-center">
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p>
						<a href="#">공지사항</a>
					</p>
					<p>
						<a href="#">커뮤니티</a>
					</p>
					<p>
						<a href="#">자격증정보</a>
					</p>
				</div>
				<div class="col-sm-8 text-center">
<!-- 					<div class="wrap">
						<div class="conwrap">
							<div class="sub_wrap"> -->
								<div class="list_wrap">
									<form name="listForm" id="listForm" method="get">
										<div class="table_wrap">
											<div class="table">
												<div class="table_in">

													<div class="table_top">

														<div class="table_top_input">
															<h2 align="left">IT Community</h2>
														</div>
													</div>

													<div class="total">
														<span>총 </span><strong>3</strong><span>개</span><span
															class="pc">의 게시글이 있습니다.</span>
													</div>

													<div class="table_main">
														<div class="table_main_top">

															<ul class="board">

															</ul>

	<!-- 														<div class="list_search pc">
																<select name="dataOrd" id="dataOrd"
																	onchange="fnOrdPage();">
																	<option value="">최신순정렬</option>
																	<option value="inqCnt">조회순정렬</option>
																	<option value="rpyCnt">댓글순</option>
																</select>
															</div> -->
<!-- 															<div class="list_search mobile">
																<ul>
																	<li class="active">
												<label class="list_search_bt01">인기순</label>
												<input type="radio" name="radio1" onchange="fnOrdPage();"/>
											</li>
											<li>
												<label class="list_search_bt02">최신순</label>
												<input type="radio" name="radio1"/>
											</li>
																	<li class="active" onclick="mobileOrderChange(this);"
																		data-mode="date"><label class="list_search_bt02">최신순</label>
																		<input name="radio1" type="radio" checked="">
																	</li>
																	<li onclick="mobileOrderChange(this);"
																		data-mode="inqCnt"><label
																		class="list_search_bt01">인기순</label> <input
																		name="radio1" type="radio"></li>
																</ul>
															</div> -->

														</div>

														<!--테이블 리스트(통합게시판형 class='board' 추가)-->
														<div class="table_main_conts board">

															<!--목록형-->
															<div class="table_type01" style="display: block;">
																<ul class="type01_top">
																	<li class="col0">번호</li>
																	<li class="col1">제목</li>
																	<li class="col2">작성자</li>
																	<li class="col3">조회</li>
																	<li class="col4">등록일</li>
																</ul>

																<ul class="type01_list renew">
																	<!--공지-->

																	<li class="notice"><a href="">
																			<div class="type01_number">공지</div>
																	</a>
																		<div class="type01_title">
																			<a href=""> <a href="#"><span>공지사항1</span> </a>
																		</div> <a href="#">
																			<div class="type01_detail">
																				<div class="number"></div>

																				<div class="date">2018.11.06.</div>
																			</div>
																	</a></li>

																	<li class="notice"><a href="">
																			<div class="type01_number">공지</div>
																	</a>
																		<div class="type01_title">
																			<a href=""> <a href="#"><span>공지사항2</span> </a>
																		</div> <a href="#">
																			<div class="type01_detail">
																				<div class="number"></div>

																				<div class="date">2018.10.30.</div>
																			</div>
																	</a></li>

																	<!--공지-->

																	<!--게시판-->

																	<li class="nosum"><a
																		href="javascript:fnView('493419','1');">
																			<div class="type01_number">1</div>

																			<div class="type01_text">
																				<div class="text_wrap">
																					<div class="type01_title">

																						<strong>커뮤니티 게시물 제목입니다.</strong>
																					</div>

																					<div class="new">
																						<img class="new" alt="new"
																							src="http://image.ebsi.co.kr/ebsi/images/reNskin2015/ico/ico_new.jpg">
																					</div>

																				</div>
																				<div class="type01_detail">

																					<div class="writer">닉네임</div>

																					<div class="number">73</div>
																					<div class="date">2018.11.08</div>

																				</div>
																			</div>
																	</a></li>

																	<li class="nosum"><a
																		href="javascript:fnView('493419','1');">
																			<div class="type01_number">2</div>

																			<div class="type01_text">
																				<div class="text_wrap">
																					<div class="type01_title">

																						<strong>커뮤니티 게시물 제목입니다.</strong>
																					</div>

																					<div class="new">
																						<img class="new" alt="new"
																							src="http://image.ebsi.co.kr/ebsi/images/reNskin2015/ico/ico_new.jpg">
																					</div>

																				</div>
																				<div class="type01_detail">

																					<div class="writer">닉네임</div>

																					<div class="number">73</div>
																					<div class="date">2018.11.08</div>

																				</div>
																			</div>
																	</a></li>
																	
																	<li class="nosum"><a
																		href="javascript:fnView('493419','1');">
																			<div class="type01_number">3</div>

																			<div class="type01_text">
																				<div class="text_wrap">
																					<div class="type01_title">

																						<strong>커뮤니티 게시물 제목입니다.</strong>
																					</div>

																					<div class="new">
																						<img class="new" alt="new"
																							src="http://image.ebsi.co.kr/ebsi/images/reNskin2015/ico/ico_new.jpg">
																					</div>

																				</div>
																				<div class="type01_detail">

																					<div class="writer">닉네임</div>

																					<div class="number">73</div>
																					<div class="date">2018.11.08</div>

																				</div>
																			</div>
																	</a></li>

																	<!--게시판-->
																</ul>

															</div>
															<!--//목록형-->


															<!--카드형-->

															<!-- 페이징-->
															<div class="dyuna_paging_wrap">
																<div class="paging_type2" id="pagingDiv">
																	<ul>
																		<li class="active"><a href="javascript:;">1</a></li>
																		<li><a onclick="pageMove('2');"
																			href="javascript:;">2</a></li>
																		<li><a onclick="pageMove('3');"
																			href="javascript:;">3</a></li>
																		<li><a onclick="pageMove('4');"
																			href="javascript:;">4</a></li>
																		<li><a onclick="pageMove('5');"
																			href="javascript:;">5</a></li>
																		<li><a onclick="pageMove('6');"
																			href="javascript:;">6</a></li>
																		<li><a onclick="pageMove('7');"
																			href="javascript:;">7</a></li>
																		<li><a onclick="pageMove('8');"
																			href="javascript:;">8</a></li>
																		<li><a onclick="pageMove('9');"
																			href="javascript:;">9</a></li>
																		<li><a onclick="pageMove('10');"
																			href="javascript:;">10</a></li>
																	</ul>
																	<div class="next_wrap">
																		<div class="next" onclick="pageMove('11');">next</div>
																		<div class="after" onclick="pageMove('141');">after</div>
																	</div>
																</div>

															</div>
															<!--//페이징 -->



														</div>
														<!--//테이블 리스트-->

													</div>

												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 			</div>
		</div>
	</div> -->
</body>
</html>
