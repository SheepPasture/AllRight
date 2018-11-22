<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.licenseinfo.model.vo.*" %>   
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

				<div class="col-sm-8 text-center">
					<h2 align="left">자격증정보</h2>
					<br />
					<div>
						<!-- <div class="text-center"" id="LicenseMain" style="border: 1px solid gray;"> -->
						<div class="board_area">
						<table class="view col-sm-11">
							<tbody>
								<tr>
									<th class="col-sm-2">제목</th>
 									<td class="title col-sm-9">글제목</td>
								</tr>
								<tr>
									<th class="col-sm-2">작성자</th>
									<td>관리자</td>
									
								</tr> 
								<tr>
									<th class="col-sm-2">내용</th>
								 	<td>내용</td>
								</tr>	
								<tr>
									<td colspan="2" >

									</td>
									
								</tr>
								<tr>
									<td colspan="2"></td>
								</tr>
							</tbody>
						</table>
								<button onclick="back();">목록으로 바로가기</button></td>
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
							<script>
/* 						$.ajax({
							url : '/allRight/lSelect.li',
							type : 'get',
							dataType : 'json',
							success : function(data) {
								console.log(data); 
								
								$table = $('#LicenseMain');
								
								var list = data.lArray;
										
										for(var i = 1; i < list.length; i++){
											
										     var value = $(this).parent().children().attr('value');
			
												if (list[i].category == value) {
			/* 									
												console.log("list[i].category: "+list[i].category);
												console.log("대분류: "+value); 
										
												$(this).parent().children().append(
													"<div class='hi'>"
													+ "<tr id='"+list[i].category+"'><td><a href='#' class='atag2' id='"+list[i].lno+"' value='"+list[i].lno+"'>"
													+ list[i].name 
													+"</a></td></tr></div>"); 
												}
											}
										
									}
								});
								
								
							},
							error : function() {
								alert("실패");
							}
						}); */
					</script>
						<br>
					</div>
				</div>
			</div>
		</div>		        
	<!-- </div> -->
</body>
</html>