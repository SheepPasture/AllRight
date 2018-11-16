<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.board.model.vo.*, com.sheep.jsp.boardComment.model.vo.*, com.sheep.jsp.member.model.vo.*" %>
<% 

	Board b = (Board)request.getAttribute("board"); 
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>) request.getAttribute("clist"); 
	Member m = (Member)session.getAttribute("member");

%>
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> 
<!-- <link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->

<style>
* {
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

.table_conts_wrap {
	margin-top: 20px;
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid #dedede;
	box-sizing: border-box;
	padding: 30px;
}

.list_wrap {
	padding: 20px 0;
	zoom: 1;
}

body {
	line-height: 1;
	font-size: 14px;
	width: 100%;
	height: 100%;
	font-family: Dotum;
	font-size: 12px;
} 

html {
	overflow-y: scroll;
}

.table_conts_wrap .table_sns {
	margin-top: 20px;
}

.table_sns .sns_top {
	overflow: hidden;
	margin-bottom: 10px;
}

ol, ul {
	list-style: none;
}

a {
	font-size: 14px;
	color: #767676;
	text-decoration: none;
}

.table_sns .sns_input {
	overflow: hidden;
}

.table_sns .sns_list_wrap {
	padding: 5px 0 20px 0;
	background-color: #f5f5f5;
	margin-top: 10px;
}

.table_sns .sns_list_wrap .sns_list {
	padding: 0 20px;
	font-size: 13px;
}

.table_sns .sns_list_wrap .sns_list li {
	border-bottom: 1px solid #dedede;
	padding-top: 15px;
}

.table_sns .sns_input textarea {
	resize: none;
	float: left;
	width: 590px;
	margin-right: 5px;
	padding: 15px;
	height: 100px;
	border: 1px solid #dedede;
}

 .sns_input_submit {
	color: #dedede;
	float: left;
	font-size: 16px;
	font-weight: bold;
	width: 100px;
	height: 100px;
	text-align: center;
	line-height: 100px;
	cursor: pointer;
	border-radius: 3px
	border: 1px solid #dedede; 
}

.sns_list li .sns_list_title {
	overflow: hidden;
	position: relative;
}

.sns_list li .sns_list_text {
	overflow: hidden;
	padding: 15px 0 20px 0;
	line-height: 1.5;
}

.sns_list li .sns_list_title strong {
	color: #333;
	font-weight: bold;
	margin-right: 15px;
	float: left;
	line-height: 22px;
}

.sns_list li .sns_list_title .sns_detail {
	color: #666;
	float: left;
	line-height: 22px;
	margin-right: 15px;
}

.sns_list li .sns_list_title .icon_wrap {
	float: right;
	margin-right: 50px;
}

.icon_wrap .goods {
	float: left;
	color: #8c8c8c;
	min-width: 50px;
}

.icon_wrap .goods span.icon {
	background:
		/* url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/table_icon.png') */
		no-repeat -60px center;
	width: 20px;
	height: 20px;
	display: block;
	text-indent: -9999px;
	float: left;
}

.icon_wrap .goods span.icon.on {
	background-position: -40px center;
}

.icon_wrap .goods p {
	float: left;
	line-height: 20px;
	font-size: 13px;
}

.sns_list li .sns_list_title .sns_detail_btn a{
	float: left;
	display: block;
	width: 40px;
	height: 20px;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	border: 1px solid #dedede;
	margin-left: 3px;
}

.back {
	display: block;
	width: 160px;
	height: 30px;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	border: 1px solid #dedede;
	margin: 10px;
	float: right;
}

.edit {
	display: block;
	width: 60px;
	height: 30px;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	border: 1px solid #dedede;
	margin: 10px;
	float: right;
}

.sns_list li .sns_list_title .sns_detail_btn a.declaration {
	position: absolute;
	top: 0px;
	right: 0px;
}

.sns_list li .sns_list_title .sns_detail .date {
	margin-right: 5px;
}

.table_sns .sns_top .icon_wrap {
	float: right;
	margin-top: 8px;
}

.board02.table_sns .sns_top .icon_wrap {
	margin-top: 0px;
}

.icon_wrap .like {
	float: left;
	color: #8c8c8c;
	min-width: 50px;
	margin-right: 7px;
}

.table_sns .sns_top .declaration {
	float: right;
}

.table_sns .sns_top .declaration a {
	display: block;
	width: 40px;
	height: 20px;
	background-color: #fff;
	border-radius: 3px;
	text-align: center;
	line-height: 20px;
	font-size: 12px;
	border: 1px solid #dedede;
	margin-right: 8px;
}

.icon_wrap .like span.icon {
	background:
		url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/table_icon.png')
		no-repeat -19px center;
	width: 20px;
	height: 20px;
	display: block;
	text-indent: -9999px;
	float: left;
}

.icon_wrap .like span.icon.on {
	background-position: 2px center;
}

.icon_wrap .like p {
	float: left;
	line-height: 20px;
	font-size: 13px;
}

.table_conts .conts_top {
	position: relative;
	border-bottom: 2px solid #4d4d4d;
	padding-bottom: 15px;
	padding-right: 195px;
}

.table_conts .conts_main {
	border-bottom: 1px solid #dedede;
	padding: 30px 0;
	font-size: 13px;
	line-height: 1.5;
}

.table_conts.sns .conts_main {
	padding-top: 40px;
}

.board02.table_conts.sns .conts_main {
	position: relative;
	padding-top: 40px;
} 

.board02.table_conts .board_dt_wrap {
	padding: 0 20px;
	line-height: 1.7;
}

.table_conts .conts_top strong {
	color: #4d4d4d;
	font-size: 15px;
	font-weight: bold;
	line-height: 1.4;
}

.board02.table_conts .conts_top .conts_top_detail {
	position: static;
}

.board02.table_conts .conts_top_detail .number {
	font-size: 14px;
	color: #666;
	position: absolute;
	bottom: -22px;
	right: 0px;
	margin: 0;
}

.board02.table_conts .conts_top .conts_top_detail .date {
	background-image: none;
	padding: 0;
	position: absolute;
	top: 50%;
	margin-top: -13px;
	right: 0px;
}

.board02.table_conts .board_top_detail .writer {
	font-size: 13px;
	color: #666;
	font-weight: bold;
	position: absolute;
	bottom: -22px;
	left: 0px;
}
</style>


</head>
<body>
	<!-- PAGE -->
	<div id="page">
		<%@ include file="/views/common/header.jsp"%>
		<% if(m != null){ %>
		<div class="container-fluid text-center">
			<div class="row content">
				<br />
				<div class="col-sm-2 sidenav">
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">커뮤니티</a></p>
					<p>
						<a href="#">자격증정보</a>
					</p>
				</div>

				<div class="col-sm-8 text-center">
					<h2 align="left">IT Community</h2>

					<div class="wrap" id="wrap">
						<div class="conwrap">
							<div class="sub_wrap">
								<div class="list_wrap">
									<div class="table_wrap">
										<div class="table_conts_wrap" style="margin-top: 0px;">

											<!--컨텐츠-->
											
											<div class="table_conts board02 sns">
												<div class="conts_top">

													<div align="left"><strong><%= b.getbTitle() %></strong></div>
													<div class="board_detail_wrap">
														<div class="board_top_detail">
															<div class="writer"><%= b.getbWriter() %></div>
														</div>
														<div class="conts_top_detail">
															<div class="number"><%= b.getbCount() +1 %></div>
															<div class="date"><%= b.getbDate() %></div>
														</div>
													</div>
												</div>

												<div class="conts_main">
													<div class="board_dt_wrap" align="left"><%= b.getbContent() %></div>
												</div>
					
											</div>
											
											<!--//컨텐츠-->

											<!--sns-->
											<div class="table_sns board02">
												<!--신고하기 팝업-->
												<div
													class="ebsiBrdPopUp boardUseRule_pop boardUseRule_pop02"
													style="display: none; z-index: 9999;">

													<div class="contsArea">
														<div class="boardUseRule_conts"></div>
														<div class="boardUseRule_bt">
															<a class="type02" href="#">신고하기</a> <a onclick=""
																href="#">취소</a>
														</div>
													</div>
												</div>
												<!--//신고하기 팝업-->
												<div class="sns_top">

													<div class="icon_wrap">
														<div class="like">
															<span class="icon on">icon</span>
															<p id="rCnt_491967">2</p>
														</div>
														<div class="goods">
															<a href="#"> <span class="icon on">icon</span>
																<p id="rec_491967">0</p>
															</a>
														</div>

														<div class="declaration">
															<a href="#">신고</a>
														</div>

													</div>
		
												
												<div id="rplyArea">
													<!--테이블 리스트-->
													<form action="<%= request.getContextPath() %>/insertComment.bo" method="post">
														<input type="hidden" name="writer" value="<%= m.getUserName() %>"/>
														<input type="hidden" name="bid" value="<%= b.getbId() %>"/>
														<input type="hidden" name="bno" value="<%= b.getbNO() %>"/>
														<input type="hidden" name="refcno" value="1"/>
														<input type="hidden" name="clevel" value="0"/>
														
													<div class="sns_input">
														<textarea  id="replyContent" name="replyContent" placeholder="댓글을 입력하세요"></textarea>
														<!-- <div class="sns_input_submit" type="submit" id="addReply">등록</div> -->
														<button class="sns_input_submit" type="submit" id="addReply"><div>등록</div></button>
													</div>
													<%-- 
													<% for(BoardComment bco : clist) { %>
													<div class="sns_list_wrap">
														<ul class="sns_list">
															<li>
																<div class="sns_list_title">
																	<strong>작성자</strong>

																	<div class="sns_detail">
																		<span class="date"><%= bco.getcDate() %></span>
																	</div>
																	<div class="sns_detail_btn">
																		<a href="#">댓글</a> <a class="declaration"
																			href="javascript:fnReportLayer('491967','1','0','rply','0');">신고</a>
																	</div>
																	<div class="icon_wrap">
																		<div class="goods">
																			<a href="#"> <span class="icon on">icon</span>
																				<p id="rplyRec_1">1</p>
																			</a>
																		</div>
																	</div>
																</div>
																<div class="sns_list_text"><%= bco.getcContent() %></div>
															</li>
														</ul> --%>
			
											<%-- 			</div>
													 </form><% } %> 
												</div> --%>
												<%-- 
												<div id="rplyArea">

													<!--테이블 리스트-->
													<div class="sns_input">
														<textarea name="title" id="title" placeholder="댓글을 입력하세요"></textarea>
														<div class="sns_input_submit" onclick="#">등록</div>
													</div>
													--%>
													<div class="sns_list_wrap">
														<ul class="sns_list">
															<li>
																<div class="sns_list_title">
																	<strong>닉네임</strong>

																	<div class="sns_detail">
																		<span class="date">2018.11.08.</span> <span
																			class="time">23:31</span>
																	</div>
																	<div class="sns_detail_btn">

																		<a href="#">댓글</a> <a class="declaration"
																			href="javascript:fnReportLayer('491967','1','0','rply','0');">신고</a>
																	</div>
																	<div class="icon_wrap">
																		<div class="goods">
																			<a href="#"> <span class="icon on">icon</span>
																				<p id="rplyRec_1"></p>
																			</a>
																		</div>
																	</div>
																</div>
																<div class="sns_list_text">댓글내용입니다.</div>
															</li>
														</ul>
													</div></form>
												</div></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
						<button class="edit" onclick="location.href='<%= request.getContextPath()%>/bUpView.bo?bno='+<%=b.getbNO() %>">수정</button>
						<button class="back" onclick="location.href='<%= request.getContextPath()%>/selectList.bo'">목록으로 바로가기 </button>
						<br /><br />
				</div>
			</div>
		</div>
		<% } else { 
			request.setAttribute("msg", "회원만 가능한 서비스입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		%>
	</div>
</body>

</html>
