<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, com.sheep.jsp.board.model.vo.*, com.sheep.jsp.announcement.model.vo.*, com.sheep.jsp.member.model.vo.Member"%>
 <% 
 	/* Board b = (Board)request.getAttribute("board");  */
 	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist"); 
 	ArrayList<Announcement> select2ANN = (ArrayList<Announcement>)request.getAttribute("select2ANN"); 
  	bPageInfo bpi = (bPageInfo)request.getAttribute("bpi");
	int listCount = bpi.getListCount();
	int currentPage = bpi.getCurrentPage();
	int maxPage = bpi.getMaxPage();
	int startPage = bpi.getStartPage();
	int endPage = bpi.getEndPage();  
	/* Member m = (Member)session.getAttribute("member"); */
 %>
<!DOCTYPE html>
<html>
<head>

<title>ALLRight</title>

	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>

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

/* body {
	line-height: 1;
	font-size: 14px;
}

body {
	width: 100%;
	height: 100%;
	font-family: Dotum;
	font-size: 12px;
} */

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

/* .table_main_conts {
	padding-top: 45px;
} */

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

/* .dyuna_paging_wrap .paging_type2 .next_wrap {
	float: left;
	border: 1px solid #e8e8e8;
	border-radius: 3px;
	margin-left: 10px;
	overflow: hidden;
} */

/* .dyuna_paging_wrap .paging_type2 .next_wrap .next {
	width: 35px;
	height: 35px;
	float: left;
	cursor: pointer;
	text-indent: -9999px;
	background:
		url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/pager_bg.png')
		no-repeat -216px center #fff;
} */

/* .dyuna_paging_wrap .paging_type2 .next_wrap .after {
	width: 35px;
	height: 35px;
	float: left;
	border-left: 1px solid #e8e8e8;
	cursor: pointer;
	text-indent: -9999px;
	background:
		url('http://image.ebsi.co.kr/ebsi/images/reNskin2015/dunya/sub/pager_bg.png')
		no-repeat -273px center #fff;
} */

/* .dyuna_paging_wrap .paging_type2 ul li {
	float: left;
} */

/* .dyuna_paging_wrap .paging_type2 ul li+li {
	margin-left: 3px;
}

a {
	font-size: 14px;
	color: #767676;
	text-decoration: none;
} */

/* .dyuna_paging_wrap .paging_type2 ul li a {
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
 */
/* .table_type01 .type01_top {
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
} */
/* 
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
 */
/* .table_type01 .type01_list li .type01_text {
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
} */
/* 
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
} */
/* 
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
/* 	overflow: hidden; 
	white-space: nowrap;
	color: #333;
	padding: 5px 0;
	text-align: center;
	
} */
/* 
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
 *//* 
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
} */
/* 
.board .table_type01 .type01_top li.col0 {
	width: 50px;
}

.table_type01 .type01_top li.col1 {
	width: 595px;
}

.board .table_type01 .type01_top li.col1 {
	width: 543px;
}

.table_type01 .type01_top li.col2 {
	width: 100px;
}

.board .table_type01 .type01_top li.col2 {
	width: 60px;
}

.table_type01 .type01_top li.col3 {
 	float: right; 
	width: 105px;
}

.board .table_type01 .type01_top li.col3 {
 	float: left; 
	width: 60px;
}

.board .table_type01 .type01_top li.col4 {
/* 	float: right; *
	width: 90px;
}
 */
/* .table_main .table_main_top>ul {
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

/* .list_wrap .table .table_top .table_top_input input {
	width: 280px;
	height: 30px;
	padding: 5px 10px;
	vertical-align: middle;
	*margin-top: 5px:;
	border: 1px solid #dedede;
	box-sizing: border-box;
	*height: 20px:;
	*padding: 0 5px:;
} */


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
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/selectList.bo">커뮤니티</a></p>
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
															<h2 align="left"><a style="text-decoration:none" href="<%= request.getContextPath() %>/selectList.bo">IT Community</a></h2>
															<br />
														</div>
													</div>

													<div class="total" >
														<span>총 </span><strong><%= listCount %></strong><span>개</span><span
															class="pc">의 게시글이 있습니다.</span>
													</div>
															<div class="list_search" align="right">
																<select onchange="selectList(this.value);">
																	<option value="">정렬</option>
																	<option value="recCnt">최신순정렬</option>
																	<option value="inqCnt" >조회순정렬</option>
																</select>
															</div> 
													<div class="table_main">
														<div class="table_main_top" >
															<ul class="board">
															</ul>
														</div>

														<!--테이블 리스트(통합게시판형 class='board' 추가)-->
														<div class="table_main_conts board">
															<table class="table table-hover" id="listArea">
																<thead>
																	<tr>
																		<th class="col-md-1 text-left">글번호</th>
																		<th class="col-md-6 text-center">글제목</th>
																		<th class="col-md-1">작성자</th>
																		<th class="col-md-1">조회수</th>
																		<th class="col-md-1">작성일</th>
																	</tr>

																	<% for(Announcement a : select2ANN){ %>
																	<tr id="annlist" style="background-color: hsl(120, 100%, 75%, 0.3); bold;">
																		<td class="col-md-1 text-left"><strong>공지</strong></td>
																		<td class="col-md-7 text-center"><strong><%= a.getAtitle() %></strong></td>
																		<td id="ano" style="display:none;"><%= a.getAno() %></td>
																		<td class="col-md-1" >관리자</td>
																		<td class="col-md-1"><strong><%= a.getAcount() %></strong></td>
																		<td class="col-md-1"><strong><%= a.getAdate() %></strong></td>
																	</tr>
																	<% } %>
																	</thead>
											  						<tbody id="boardlist">
																	</tbody>
																</table>
										  						<table class="tbl paginated" id="tbl" style="border: 1px solid tomato;"></table>
															<br /><br />
															<div align="center">
															
															 <div align="center">
																<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
																<%  if(currentPage <= 1){  %>
																<button disabled><</button>
																<%  }else{ %>
																<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>'"><</button>
																<%  } %>
																
																<% for(int p = startPage; p <= endPage; p++){
																		if(p == currentPage){	
																%>
																	<button disabled><%= p %></button>
																<%      }else{ %>
																	<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
																<%      } %>
																<% } %>
																	
																<%  if(currentPage >= maxPage){  %>
																<button disabled>></button>
																<%  }else{ %>
																<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>'">></button>
																<%  } %>
																<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
															</div> 

													<div class="col-sm-12 text-right">
														<button class="btn-default"><a href="views/board/boardInsertForm.jsp">작성하기</a></button>
													</div>
													</div>

												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<script>	
					/*  $(function() {  */
					 function selectList(recCnt){
						
						$.ajax({
							url : '/allRight/boardrecentView.bo',
							dataType : "json",
							type : "get",
							success : function(data) {

								$table = $('#listArea tbody');				
								
								$table.find("tr").remove(); 
								
								for (var i in data) {

									console.log(data[i]);
									
									var $trBoard = $('<tr>');
									var $tdBoardNo = $('<td>').text(data[i].bNO);
									var $tdBoardTitle = $('<td>').text(data[i].bTitle);
									var $tdBoardWriter = $('<td>').text(data[i].bWriter);
									var $tdBoardCount = $('<td>').text(data[i].bCount);
									var $tdBoardDate =  $('<td>').text(data[i].bDate);
									
									$trBoard.append($tdBoardNo)
									.append($tdBoardTitle)
									.append($tdBoardWriter)
									.append($tdBoardCount)
									.append($tdBoardDate);
									
									$table.append($trBoard);
									
									
								}
							}, error : function(data) {
								console.log("최신 조회 실패!");
							}
						});															
					 }; 
					
					function selectList(inqCnt){	
						
						$.ajax({
							url : '/allRight/boardlistView.bo',
							dataType : "json",
							type : "get",
							success : function(data) {

								$table = $('#listArea tbody');
								
								$table.find("tr").remove(); 
								
								for (var i in data) {

									console.log(data[i]);
									
									var $trBoard = $('<tr>');
									var $tdBoardNo = $('<td>').text(data[i].bNO);
									var $tdBoardTitle = $('<td>').text(data[i].bTitle);
									var $tdBoardWriter = $('<td>').text(data[i].bWriter);
									var $tdBoardCount = $('<td>').text(data[i].bCount);
									var $tdBoardDate =  $('<td>').text(data[i].bDate);
									
									$trBoard.append($tdBoardNo)
									.append($tdBoardTitle)
									.append($tdBoardWriter)
									.append($tdBoardCount)
									.append($tdBoardDate);
									
									$table.append($trBoard);
									
						
								}
		
							}, error : function(data) {
								console.log("조회순 조회 실패!");
							}
						});															
					}
					
 					/* function page(){
						
						$('table.paginated').each(function() { 
							var currentPage = 0; 
							var numPerPage = 5; 
							
							var $table = $(this); 
							
							var repaginate = function() { 
								$table.find('tbody tr').hide() 
								.slice(currentPage * numPerPage,
								(currentPage + 1) * numPerPage)
								.show();
							};
						
							var numRows = $table.find('tbody tr').length; 
							//length로 전체길이구함 
							var numPages = Math.ceil(numRows / numPerPage); 
							//Math.ceil를 이용하여 반올림
							
							var $pager = $('<div class="pager"></div>');
						    for (var page = 0; page < numPages; page++) {
						      $('<span class="page-number"></span>').text(page + 1)
						        .bind('click', {newPage: page}, function(event) {
						          currentPage = event.data['newPage'];
						          $table.trigger('repaginate');
						          $(this).addClass('active')
						            .siblings().removeClass('active');
						        }).appendTo($pager).addClass('clickable');
						    }
						    $pager.insertBefore($table)
						      .find('span.page-number:first').addClass('active');
						});
					};
						
						var $pager = $('');
						
						     //pager라는 클래스의 div엘리먼트 작성
						     for (var page = 0; page < numPages; page++) {
						       $('').text(page + 1)
						         .bind('click', {newPage: page}, function(event) {         
						           currentPage = event.data['newPage'];
						           repaginate();
						           //for구문을 이용하여 페이지 수만큼
						           //버튼을 구현
						           $(this).addClass('active')
						           //활성화된페이지에는 active라는 클래스명을 붙여준다.
						             .siblings().removeClass('active');
						         }).appendTo($pager).addClass('clickable');
						     }	 
						     $pager.insertBefore($table)
							 //앞서 설정한 페이지키를 삽입
						       .find('span.page-number:first').addClass('active');
						   });
						
					}; */
					
					/* function page(){ 
						var reSortColors = function($table) {
						  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
						  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
						 };
						 $('table.paginated').each(function() {
						  var pagesu = 10;  //페이지 번호 갯수
						  var currentPage = 0;
						  var numPerPage = 10;  //목록의 수
						  var $table = $(this);    
						  
						  //length로 원래 리스트의 전체길이구함
						  var numRows = $table.find('tbody tr').length;
						  //Math.ceil를 이용하여 반올림
						  var numPages = Math.ceil(numRows / numPerPage);
						  //리스트가 없으면 종료
						  if (numPages==0) return;
						  //pager라는 클래스의 div엘리먼트 작성
						  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
						  
						  var nowp = currentPage;
						  var endp = nowp+10;
						  
						  //페이지를 클릭하면 다시 셋팅
						  $table.bind('repaginate', function() {
						  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
						  
						   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
						   $("#remo").html("");
						   
						   if (numPages > 1) {     // 한페이지 이상이면
						    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
						     nowp = 0;     // 1부터 
						     endp = pagesu;    // 10까지
						    }else{
						     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
						     endp = nowp+pagesu;   // 10까지
						     pi = 1;
						    }
						    
						    if (numPages < endp) {   // 10페이지가 안되면
						     endp = numPages;   // 마지막페이지를 갯수 만큼
						     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
						    }
						    if (nowp < 1) {     // 시작이 음수 or 0 이면
						     nowp = 0;     // 1페이지부터 시작
						    }
						   }else{       // 한페이지 이하이면
						    nowp = 0;      // 한번만 페이징 생성
						    endp = numPages;
						   }
						   // [처음]
						   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
						          currentPage = 0;   
						          $table.trigger('repaginate');  
						          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
						      }).appendTo($pager).addClass('clickable');
						    // [이전]
						      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
						          if(currentPage == 0) return; 
						          currentPage = currentPage-1;
						    $table.trigger('repaginate'); 
						    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						   }).appendTo($pager).addClass('clickable');
						    // [1,2,3,4,5,6,7,8]
						   for (var page = nowp ; page < endp; page++) {
						    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
						     currentPage = event.data['newPage'];
						     $table.trigger('repaginate');
						     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						     }).appendTo($pager).addClass('clickable');
						   } 
						    // [다음]
						      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
						    if(currentPage == numPages-1) return;
						        currentPage = currentPage+1;
						    $table.trigger('repaginate'); 
						     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
						   }).appendTo($pager).addClass('clickable');
						    // [끝]
						   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
						           currentPage = numPages-1;
						           $table.trigger('repaginate');
						           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
						   }).appendTo($pager).addClass('clickable');
						     
						     $($(".page-number")[2]).addClass('active');
						reSortColors($table);
						  });
						   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
						   $pager.appendTo($table);
						   $table.trigger('repaginate');
						 });
						} */


						
					
					
					/* function selectList(rpyCnt){	
						
						$.ajax({
							url : '/allRight/boardcomView.bo',
							dataType : "json",
							type : "get",
							success : function(data) {

								$table = $('#listArea tbody');
								
								$table.find("tr").remove(); 
								
								for (var i in data) {

									console.log(data[i]);
									
									var $trBoard = $('<tr>');
									var $tdBoardNo = $('<td>').text(data[i].bNo);
									var $tdBoardTitle = $('<td>').text(data[i].bTitle);
									var $tdBoardWriter = $('<td>').text(data[i].bWriter);
									var $tdBoardCount = $('<td>').text(data[i].bCount);
									var $tdBoardDate =  $('<td>').text(data[i].bDate);
									
									$trBoard.append($tdBoardNo)
									.append($tdBoardTitle)
									.append($tdBoardWriter)
									.append($tdBoardCount)
									.append($tdBoardDate);
									
									$table.append($trBoard);
								}
									
							}, error : function(data) {
								console.log("조회순 조회 실패!");
							}
						});															
					} */
					
					$("#annlist td").mouseenter(function(){
						$(this).css({"cursor":"pointer"});
					}).click(function(){
						/* alert($(this).parent().children().eq(2).text());  */
							var ano = $(this).parent().children().eq(2).text();
						location.href="<%=request.getContextPath()%>/selectOne.ann?ano=" + ano;
					});
					
					$("#boardlist tr").mouseenter(function(){
						$(this).parent().children().css({"cursor":"pointer"});
					}).click(function(){
						
						alert($(this).parent().children().eq(0).text());
						var bno = $(this).parent().children().eq(0).text();
						location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno;
					});
						
		
					</script>
				</div>
</body>
</html>
