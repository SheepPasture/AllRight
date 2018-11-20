<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>

<title>ALLRight</title>
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>

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
				<div class="comu col-sm-8 text-center" style="border:1px soild tomato;">
					<button id="it" onclick="it();" style="height:50pt; weight:100pt;" value="1">아이티</button>	
					<script>
					
						function it(){
							var bid = 1;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}

					</script>
				</div>
			</div>
		</div>
</body>
</html>