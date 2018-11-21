<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.board.model.vo.*, com.sheep.jsp.member.model.vo.*" %>
<% 
	Board b = (Board)request.getAttribute("board"); 
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

<!--   	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" /> -->
<!--  	<script src="//cdn.ckeditor.com/4.9.2/basic/ckeditor.js"></script> -->

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

	#title {
		text-align: center;
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
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/views/board/boardMain.jsp">커뮤니티</a></p>
					<p><a href="/views/license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<h3 align="left">글쓰기</h3>
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table class="view">
							<tbody>
								<tr>
									<th class="col-sm-2" id="title">제목</th>
									<td>
										<textarea name="title" rows="1" cols="90"  style="resize: none;"><%= b.getbTitle() %></textarea>
									</td>
								</tr>
								<tr>
									<th class="col-sm-2" id="title">내용</th>
									<td>
										<script type="text/javascript" src="/allRight/resources/ckeditor/ckeditor.js"></script> 
										<div>
											 <textarea name="content" id="content" class="ckeditor" rows="20" cols="70"><%= b.getbContent() %></textarea>
											 <input id="bno" name="bno" type="hidden" value="<%= b.getbNO() %>"/>
											 <input id="userName" name="userName" type="hidden" value="<%= b.getbWriter() %>"/>
											 <script>
												CKEDITOR.replace('content', {
													width: 650,
													height: 300
												});
											 </script>
										</div>
									</td>
								</tr>			
							</tbody>
							<tr align="center" >
								<td  colspan="2">
									<div class="btn_area2">
										<button class="btn btn-default" onclick="edit();">Edit</button>
						 				<button class="btn btn-default" onclick="del();">Delete</button>
										<button class="btn btn-default" onclick="back();">Back</button>
									</div>								
								</td>
							</tr>
						</table>
					<br />
				</div>
			<br /><br />
		 		<script>	 		

	 		 		var bid = 1;
	 		 		var bno = $("#bno").val();
	 		 		
					function edit(){
						location.href="<%=request.getContextPath()%>/bUpdate.bo?bid=" + bid+"&bno="+bno;
					}
					
					function del(){
						location.href="<%=request.getContextPath()%>/bDelete.bo?bid="+bid+"&bno="+bno;
					}
					
					function back(){		
						location.href="<%=request.getContextPath()%>/selectOne.bo?bid="+bid+"&bno="+bno;
					}
					
		 		</script>
			</div><br /><br /><br /><br /><br />
		</div>
	</div>
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>
