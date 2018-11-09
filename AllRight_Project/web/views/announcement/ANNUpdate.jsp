<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.sheep.jsp.announcement.model.vo.*" %>
 <% Announcement a = (Announcement)request.getAttribute("announcement"); %>
<!DOCTYPE html>
<html>
<head>
	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
    
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
	<!-- SUMMERNOTE -->
	<!--   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script> -->

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
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="<%= request.getContextPath() %>/views/announcement/ANNList.jsp">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views//community/communityList.jsp">커뮤니티</a></p>
					<p><a href="<%= request.getContextPath() %>/views/license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<h3 align="left">글쓰기</h3>
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table class="view">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tbody>
								<tr>
									<th>제목</th>
<%-- 									<td colspan="3" class="title"><%= a.getAtitle()%></td> --%>
									<td colspan="3" class="title">타이틀</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>조회수</th>
									<%-- <td><%= a.getAcount() %></td> --%>
									<td>8</td>
									<th>등록일시</th>
					<%-- 				<td><%= a.getAdate() %></td> --%>
									<td>2018-11-09</td>
								</tr>
<!-- 								<tr>
									<th>첨부파일</th>
									<td colspan="3">없음</td>
								</tr> -->
								<tr>
									<th>내용</th>
								<%-- 	<td><%= a.getAcontent() %></td> --%>
									<td>내용입니다.</td>
								</tr>			
								<tr>
									<td colspan="5"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<br />
				<form class="edit" action="<%= request.getContextPath()%>/aUpdate.ann?ano=<%=a.getAno()%>">
					<button id="edit" class="btn btn-primary" onclick="edit()" type="button">Edit</button>
				</form>
				<form class="del" action="<%= request.getContextPath()%>/aDelete.ann?ano=<%=a.getAno()%>">
					<button id="del" class="btn btn-primary" onclick="del()" type="button">Delete</button>
				</form>
				<button id="back" class="btn btn-primary" onclick="back()" type="button">Back</button>
			</div>
			<br>
		</div>
<%-- 		 		<script>
					function edit(){
						location.href="/allRight/selectList.ann";
					}
					
					function del(){
						location.href="<%=request.getContextPath()%>/aDelete.ann<%= a.getAno() %>";
							location.href="<%=request.getContextPath()%>/selectOne.ann?ano=" + ano;
						$(.del).attr("action", "<%= request.getContextPath()%>/aDelete.ann");
						$(this).attr("action", "<%= request.getContextPath()%>/aDelete.ann");
					}
		
					function back(){
						location.href="<%= request.getContextPath() %>/views/announcement/ANNList.jsp";
					}
		 		</script> --%>

	<!-- FOOTER -->
	<footer>	
	</footer>
	<!-- //FOOTER -->
	

</div>
</body>
</html>