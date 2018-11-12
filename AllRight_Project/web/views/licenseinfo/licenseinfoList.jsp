<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sheep.jsp.announcement.model.vo.*" %> 
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
	<link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />


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
					<p><a href="<%= request.getContextPath() %>/views/community/communityList.jsp">커뮤니티</a></p>
					<p><a href="/views/license/licenseinfo.jsp">자격증정보</a></p>
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
					<br /><br /><br /><br /><br /><br /><br /><br />
				</div>

				<div class="col-sm-8 text-center" style="border: 1px solid to">
					<h2 align="left">자격증정보</h2>
					<br />
					<div role="tabpanel">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li role="presentation"><a href="#건설기계운전" aria-controls="건설기계운전" role="tab" data-toggle="tab" id="건설기계운전"><span>건설기계운전</span></a></li>
							<li role="presentation"><a href="#건설배관" aria-controls="건설배관" role="tab" data-toggle="tab" id="건설배관">건설배관</a></li>
							<li role="presentation"><a href="#건축" aria-controls="건축" role="tab" data-toggle="tab" id="건축">건축</a></li>
							<li role="presentation"><a href="#경비청소" aria-controls="경비청소" role="tab" data-toggle="tab" id="경비청소">경비청소</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane" id="건설기계운전">
								<table class="table table-justified">
									<tr>
										<td colspan="1"><a href="#">굴삭기운전기능사</a></td>
										<td colspan="1"><a href="#">기중기운전기능사</a></td>
										<td colspan="1"><a href="#">로더운전기능사</a></td>
										<td colspan="1"><a href="#">롤러운전기능사</a></td>
									</tr>
									<tr>
										<td colspan="1"><a href="#">불도저운전기능사</a></td>
										<td colspan="1"><a href="#">양화장치운전기능사</a></td>
										<td colspan="1"><a href="#">지게차운전기능사</a></td>
										<td colspan="1"><a href="#">천공기운전기능사</a></td>
									</tr>
									<tr>
										<td colspan="1"><a href="#">컨테이너크레인운전기능사</a></td>
										<td colspan="1"><a href="#">타워크레인운전기능사</a></td>
									</tr>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="건설배관">
								<table class="table table-justified">
									<tr>
										<td colspan="1"><a href="#">배관기능사</a></td>
										<td colspan="1"><a href="#">배관기능장</a></td>
										<td colspan="1"><a href="#">배관산업기사</a></td>
									</tr>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="건축">
								<table class="table table-justified">
									<tr>
										<td colspan="1"><a href="#">굴삭기운전기능사</a></td>
										<td colspan="1"><a href="#">기중기운전기능사</a></td>
										<td colspan="1"><a href="#">로더운전기능사</a></td>
										<td colspan="1"><a href="#">롤러운전기능사</a></td>
									</tr>
									<tr>
										<td colspan="1"><a href="#">불도저운전기능사</a></td>
										<td colspan="1"><a href="#">양화장치운전기능사</a></td>
										<td colspan="1"><a href="#">지게차운전기능사</a></td>
										<td colspan="1"><a href="#">천공기운전기능사</a></td>
									</tr>
									<tr>
										<td colspan="1"><a href="#">컨테이너크레인운전기능사</a></td>
										<td colspan="1"><a href="#">타워크레인운전기능사</a></td>
									</tr>
								</table>
							</div>
							<div role="tabpanel" class="tab-pane" id="경비청소">
								<table class="table table-justified">
									<tr>
										<td colspan="1"><a href="#">세탁기능사</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
	
					<br>
			
					<!-- Nav tabs -->
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li role="presentation"><a href="#건설기계운전2" aria-controls="건설기계운전2" role="tab" data-toggle="tab" id="건설기계운전2"><span>건설기계운전2</span></a></li>
						<li role="presentation"><a href="#건설배관2" aria-controls="건설배관2" role="tab" data-toggle="tab" id="건설배관2">건설배관2</a></li>
						<li role="presentation"><a href="#건축2" aria-controls="건축2" role="tab" data-toggle="tab" id="건축2">건축2</a></li>
						<li role="presentation"><a href="#경비청소2" aria-controls="경비청소2" role="tab" data-toggle="tab" id="경비청소2">경비청소2</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpane1" class="tab-pane" id="건설기계운전2">
							<table class="table table-justified">
								<tr>
									<td colspan="1"><a href="#">굴삭기운전기능사</a></td>
									<td colspan="1"><a href="#">기중기운전기능사</a></td>
									<td colspan="1"><a href="#">로더운전기능사</a></td>
									<td colspan="1"><a href="#">롤러운전기능사</a></td>
								</tr>
								<tr>
									<td colspan="1"><a href="#">불도저운전기능사</a></td>
									<td colspan="1"><a href="#">양화장치운전기능사</a></td>
									<td colspan="1"><a href="#">지게차운전기능사</a></td>
									<td colspan="1"><a href="#">천공기운전기능사</a></td>
								</tr>
								<tr>
									<td colspan="1"><a href="#">컨테이너크레인운전기능사</a></td>
									<td colspan="1"><a href="#">타워크레인운전기능사</a></td>
								</tr>
							</table>
						</div>
						<div role="tabpane1" class="tab-pane" id="건설배관2">
							<table class="table table-justified">
								<tr>
									<td colspan="1"><a href="#">배관기능사</a></td>
									<td colspan="1"><a href="#">배관기능장</a></td>
									<td colspan="1"><a href="#">배관산업기사</a></td>
								</tr>
							</table>
						</div>
						<div role="tabpane1" class="tab-pane" id="건축2">
							<table class="table table-justified">
								<tr>
									<td colspan="1"><a href="#">굴삭기운전기능사</a></td>
									<td colspan="1"><a href="#">기중기운전기능사</a></td>
									<td colspan="1"><a href="#">로더운전기능사</a></td>
									<td colspan="1"><a href="#">롤러운전기능사</a></td>
								</tr>
								<tr>
									<td colspan="1"><a href="#">불도저운전기능사</a></td>
									<td colspan="1"><a href="#">양화장치운전기능사</a></td>
									<td colspan="1"><a href="#">지게차운전기능사</a></td>
									<td colspan="1"><a href="#">천공기운전기능사</a></td>
								</tr>
								<tr>
									<td colspan="1"><a href="#">컨테이너크레인운전기능사</a></td>
									<td colspan="1"><a href="#">타워크레인운전기능사</a></td>
								</tr>
							</table>
						</div>
						<div role="tabpane1" class="tab-pane" id="경비청소2">
							<table class="table table-justified">
								<tr>
									<td colspan="1"><a href="#">세탁기능사</a></td>
								</tr>
							</table>
						</div>
					</div>
				
				</div>

				
			</div>
		</div>		        
	</div>
</body>
</html>