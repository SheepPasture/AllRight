<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import = "com.sheep.jsp.announcement.model.vo.*, java.util.*, com.oreilly.servlet.*"%>
<% 
	Announcement a = (Announcement)request.getAttribute("announcement"); 
%>
<!DOCTYPE html>
<html>
<head>
	<title>ALLRight</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<style>

    /* 게시판관련 */
    .board_area { font-size:13px !important;  }

    .paging { text-align:center; padding:30px 0 0 0; }

    .btn_area2 { text-align:right; padding-top:20px; font-size:14px; font-weight:600;   }
    .btn_area2 a { display:inline-block; padding:7px 20px; background:#666; color:#fff; }
    
    table.view { width:100%; border-top:2px solid #000; }
    table.view tbody tr th { background:#f4f4f4; border-bottom:1px solid #cfcfcf; border-right:1px solid #cfcfcf; padding: 2px 2px 2px 10px;  }
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
					<p><a href="<%= request.getContextPath() %>/selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/board/boardList.jsp">커뮤니티</a></p>
					<p><a href="#">자격증정보</a></p>
				</div> 
				<div class="col-sm-8 text-left">
					<h2 align="left">공지사항</h2>
					<% if(a != null) { %>
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<form id="updateForm" method="post">
						<table class="view">
							<tbody>
								<tr>
									<th>제목</th>
 									<td class="title"><%= a.getAtitle()%></td>
									<th><div>글번호</div><br /><div>조회수</div></th>
									<td><div><%= a.getAno() %></div><br /><div><%= a.getAcount() %></div></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>등록일시</th>
				 					<td><%= a.getAdate() %></td>
								</tr> 
								<tr>
									<th>내용</th>
								 	<td><%= a.getAcontent() %></td>
								</tr>			
								<tr>
									<td colspan="5">
										<input id="ano" name="ano" type="hidden" value="<%= a.getAno() %>"/>
									</td>
									
								</tr>
								<% } else { 
							 		request.setAttribute("msg", "회원만 가능한 서비스 입니다."); 
									request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
								} %>
								<tr>
									<th>이전글&nbsp; ▲</th>
									
									<td colspan="3"><a href="#" onclick="before();">
										<%= a.getAno()-1 %>번째 글입니다.
									</a></td>
								</tr>
								<tr>
									<th>다음글&nbsp; ▼</th>
									<td colspan="3"><a href="#" onclick="after();"><%= a.getAno()+1 %>번째 글입니다.</a></td>
								</tr>
							</tbody>
						</table>
 						<div class="btn_area2">
 								<button onclick="back();">목록으로 바로가기</button>
								<button onclick="edit();">수정</button>
						</div> </form>
						<script>
							function before(){
								var ano = $("#ano").val();
								location.href="/allRight/abefore.ann?"+"ano="+ano;
							}
							
							function after(){
								var ano = $("#ano").val();
								location.href="/allRight/aAfter.ann?"+"ano="+ano;
							}
						
							function edit(){
								var ano = $("#ano").val();
			 		 			$("#updateForm").attr("action", "<%=request.getContextPath()%>/aUpView.ann?ano="+ano);
			 		 		}
						
							function back(){	
								$("#updateForm").attr("action","<%=request.getContextPath() %>/selectList.ann");
							}
						</script>
					</div>		
				</div>
			</div>
		</div>
	</div>
</body>

</html>
