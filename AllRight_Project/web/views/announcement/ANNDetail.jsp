<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "com.sheep.jsp.announcement.model.vo.*, java.util.*, com.oreilly.servlet.*"%>
<% Announcement a = (Announcement)request.getAttribute("announcement"); %>
<!DOCTYPE html>
<html>
<head>
	<title>ALLRight</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

	<style>

    /* 게시판관련 */
    .board_area { font-size:13px !important;  }

    .paging { text-align:center; padding:30px 0 0 0; }

    .btn_area2 { text-align:right; padding-top:20px; font-size:14px; font-weight:600;   }
    .btn_area2 a { display:inline-block; padding:7px 20px; background:#666; color:#fff; }

    table.view { width:100%; border-top:2px solid #000;    }
    table.view tbody tr th { background:#f4f4f4; border-bottom:1px solid #cfcfcf; border-right:1px solid #cfcfcf; padding:10px 0;   }
    table.view tbody tr td { background:#fff; border-bottom:1px solid #cfcfcf; padding:10px 20px; line-height:170%;   }
    table.view tbody tr td.board_contents { padding:20px 20px; }
    table.view tbody tr td img { width:100%; height:auto; }
    table.view tbody tr td.title { font-weight:600; }

	</style>

</head>
<body>
	<!-- PAGE -->
	<div id="page">
		<%@ include file="/views/common/header.jsp" %>
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
					<h2 align="left">공지사항</h2>
					<% if(a != null) { %>
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table class="view">
							<colgroup>
								<col width="15%">
								<col width="60%">
								<col width="10%">
								<col width="15%">
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
 									<td class="title"><%= a.getAtitle()%></td>  
									<!-- <td colspan="1" class="title">타이틀</td>  -->
									<th >조회수</th>
									<td><%= a.getAcount() %></td>
									<!-- <td>8</td> -->
								</tr>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>등록일시</th>
				 					<td><%= a.getAdate() %></td>
<!-- 									<td>2018-11-09</td> -->
								</tr> 
								<tr>
									<th>내용</th>
								 	<td><%= a.getAcontent() %></td>
								</tr>			
								<tr>
									<td colspan="5"></td>
								</tr>
								<% } else { 
							 		request.setAttribute("msg", "회원만 가능한 서비스 입니다."); 
									request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
								} %>
								<tr>
									<th>이전글&nbsp; ▲</th>
									<td colspan="3"><a href="">1번째 공지사항입니다.</a></td>
								</tr>
								<tr>
									<th>다음글&nbsp; ▼</th>
									<td colspan="3"><a href="">3번째 공지사항입니다.</a></td>
								</tr>
							</tbody>
						</table>
 						<div class="btn_area2">
 								<button onclick="location.href='selectList.ann'">목록으로 바로가기</button>
								<button onclick="location.href='<%= request.getContextPath()%>/aUpView.ann?ano='+<%= a.getAno() %>" >수정</button>
 						
							<!-- <a href="/allRight/selectList.ann">목록으로 바로가기</a>				
							<a href="/allRight/aUpdate.ann">수정</a> -->			
						</div> 
					</div>		
				</div>
			</div>
		</div>
	</div>
</body>

</html>
