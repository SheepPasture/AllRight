<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.sheep.jsp.announcement.model.vo.*, java.util.*" %>
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
    
 	<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script>

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
						<table class="view" id="listArea">
							<tbody>
								<tr>
									<th class="col-sm-2">글번호</th>
									<td id="ano"><%= a.getAno() %></td>
								</tr>
								<tr>
									<th class="col-sm-2">제목</th>
				<%-- 					<td>
										<textarea name="title" rows="1" cols="90" ><%= a.getAtitle() %></textarea>
										<input cols="90" name="ano" value="<%= a.getAno() %>"/>
									</td> --%>
									<td><textarea name="title" rows="1" cols="90" ><%= a.getAtitle() %></textarea></td>
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
					<button class="btn btn-primary" onclick="edit();">Edit</button>
	 				<button class="btn btn-primary" onclick="del();">Delete</button>
					<button class="btn btn-primary" onclick="back();">Back</button>
				</div>
				</form>
		 		<script>	 		
					var ano = $("#listArea td").parent().children('td').eq(0).text();
		 		
	 		 		function edit(){
	 		 			$("#updateForm").attr("action", "<%=request.getContextPath()%>/aUpdate.ann");
	 		 		}
				
					function del(){
						$("#updateForm").attr("action","<%=request.getContextPath() %>/aDelete.ann?ano="+ano);
					}
					
					function back(){		
						$("#updateForm").attr("action","<%=request.getContextPath() %>/selectOne.ann?ano=" + ano);
					}
					
		 		</script>
			</div>
			<br>
		</div>
	</div>

	<!-- FOOTER -->
	<footer>	
	</footer>
	<!-- //FOOTER -->
	

</div>
</body>
</html>
