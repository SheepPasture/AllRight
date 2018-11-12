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
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
    
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
					<form id="updateForm" method="post">
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table class="view">
							<tbody>
								<tr>
									<th class="col-sm-2">제목</th>
									<td>
										<textarea name="title" rows="1" cols="90"><%= a.getAtitle() %></textarea>
										<input type="hidden" name="ano" value="<%= a.getAno() %>">
									</td>
								</tr>
								<tr>
									<th class="col-sm-2">내용</th>
									<td>
										<textarea name="content" class="ckeditor" rows="20" cols="70"><%= a.getAcontent() %>></textarea>
										<script>
											CKEDITOR.replace('content', {
												width: 650,
												height: 300
											});		
										</script>
									</td>
								</tr>	
							</tbody>
						</table>
					</div>
					<br />
				<div align="center">
	 				<button id="edit" class="btn btn-primary" onclick="edit()">Edit</button>
	 				<button id="del" class="btn btn-primary" onclick="del()">Delete</button>
					<button id="back" class="btn btn-primary" onclick="back()" type="button">Back</button>
 		 		<script>
 		 		
	 		 		function edit(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/aUpdate.ann");
						
					}
					
					function del(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/aDelete.ann");
					}
					
					function back(){
						location.href='/allRight/selectList.ann';
					}
					
		 		</script>  
				</div></form>
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