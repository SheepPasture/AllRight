<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.licenseinfo.model.vo.*" %>
<%
	LicenseInfo lf  = (LicenseInfo)request.getAttribute("licenseInfo");
%>
<!DOCTYPE html>
<html>
<head>
<title>ALLRight</title>

	<meta charset="utf-8">
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
    
/*     table.view { width:100%; border-top:2px solid #000; } */
	table.view { border-top:2px solid #000; }
    table.view tbody tr th { background:#f4f4f4; border-bottom:1px solid #cfcfcf; border-right:1px solid #cfcfcf; padding: 2px 2px 2px 10px;  }
    table.view tbody tr td { background:#fff; border-bottom:1px solid #cfcfcf; padding:10px 20px; line-height:170%;   }
    table.view tbody tr td.board_contents { padding:20px 20px; }
    table.view tbody tr td img { width:100%; height:auto; }
    table.view tbody tr td.title { font-weight:600; }
    
    .sidenav{
    	heigth: 1000px;
    }

	</style>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>
	<!-- PAGE -->
	<div id="page">

		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="<%= request.getContextPath() %>/selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/board/boardList.jsp">커뮤니티</a></p>
					<p><a href="<%= request.getContextPath() %>/views/license/licenseinfo.jsp">자격증정보</a></p>
				</div>

				<div class="col-sm-8 text-left">
					<h2 align="left">자격증정보</h2>
					<br />
					<div>
						<!-- <div class="text-center"" id="LicenseMain" style="border: 1px solid gray;"> -->
						<div class="board_area" id="LicenseMain">
						<table class="view col-sm-11">
							<tbody>
								<tr>
									<th class="col-sm-2">자격증 이름</th>
 									<td class="title col-sm-9"><%= lf.getlName() %></td>
								</tr>
								<tr>
									<th class="col-sm-2">카테고리</th>
									<td><%= lf.getlCategory() %></td>
								</tr> 
								<tr>
									<th class="col-sm-2">응시료</th>
								 	<td><%= lf.getlCost() %></td>
								</tr>	
								<tr>
									<th class="col-sm-2">내용</th>
								 	<td>
								 		<%= lf.getnInfo01() %> <br /><br />
								 		<%= lf.getNlnfo02() %> <br /><br />
								 		<%= lf.getNlnfo03() %> <br /><br />
								 	</td>
								</tr>	
							</tbody>
						</table> 
						<div>
							<button onclick="back();">목록으로 바로가기</button>				
						</div>
						<script>
							function back(){	
								location.href="<%=request.getContextPath()%>/views/licenseinfo/licenseinfoList.jsp";
							}
							</script>
						</div>	
						</div>
						<br>
					</div>
				</div>`
			</div>
		</div>		        
	<!-- </div> -->
</body>
</html>