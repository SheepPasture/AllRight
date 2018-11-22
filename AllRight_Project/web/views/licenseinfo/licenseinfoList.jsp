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
	<!-- JQuery -->
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
<!-- 	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->

<style>

a {
	text-align:center;
	padding: 5px;
}

.hi {
	background-color: white;
	padding: 10px;
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
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
				</div>

				<div class="col-sm-8 text-center">
					<h2 align="left">자격증정보</h2>
					<br />
					<div>
						<div class="text-center"" id="LicenseMain" style="border: 1px solid gray;">
					</div>

					<script>
						$.ajax({
							url : '/allRight/lSelect.li',
							type : 'get',
							dataType : 'json',
							success : function(data) {
								console.log(data); 
/* 								console.log(data.list); */
								
								$table = $('#LicenseMain');
								
								var list = data.lArray;
								var l = data.list;

								for(var i = 1; i < l.length; i++){
								
									$table.append(
										"<ul class='nav nav-tabs nav-justified' role='tablist'><li class='tit' role='presentation'>"+
										"<a href='#' class='atag1' id='"+l[i].listName+"' value='"+l[i].listName+"'>"
										+l[i].listName +
										"</a></li></ul>" );  
								}			
								
								$('.atag1').on('click', function() {
									
									if($(this).hasClass('active')) {
										// 이미 선택 되었을 경우
										$(this).children().remove();
										$(this).removeClass('active');
										
									} else {
										// 아직 선택하지 않았을 경우
										$('.atag1').each(function(index, value){
											if ($(value).hasClass('active')){
												$(value).children().remove();
												$(value).removeClass('active');
											} 
										});
										
										$(this).addClass('active');
										
										for(var i = 1; i < list.length; i++){
											
										     var value = $(this).parent().children().attr('value');
			
												if (list[i].category == value) {
			/* 									
												console.log("list[i].category: "+list[i].category);
												console.log("대분류: "+value);  */
										
												$(this).parent().children().append(
													"<div class='hi'>"
													+ "<tr id='"+list[i].category+"'><td><a href='#' class='atag2' id='"+list[i].lno+"' value='"+list[i].lno+"'>"
													+ list[i].name 
													+"</a></td></tr></div>"); 
												}
											}	
										
										$('.atag2').on('click', function() {
											var lno = this.id;
											location.href="<%=request.getContextPath()%>/lView.li?lno=" + lno;
										});
										
									}
								});
								
								
							},
							error : function() {
								alert("실패");
							}
						});
					</script>
					<br>
				</div>
			</div>
		</div>		        
	</div>
</body>
</html>