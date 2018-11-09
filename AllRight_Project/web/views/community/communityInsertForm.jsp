<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- SUMMERNOTE -->
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script> 

</head>
<body>
	 <%-- <%@ include file="/views/common/header.jsp" %> --%>

	<!-- PAGE -->
	<div id="page">

		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="#">건설기계운전</a></p>
					<p><a href="#">건설배관</a></p>
					<p><a href="#">건축</a></p>
					<p><a href="#">경비/청소</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<br>	
					<h3 align="left">글쓰기</h3>
					  <div id="summernote"  class="col-sm-10" style="border: 1px solid tomato"></div>
					  <script>
					  	$('#summernote').summernote({
				            lang: 'ko-KR',
				            height: 500,
				            toolbar: [
				                ['font', ['fontsize', 'bold', 'color', 'height']],
				                ['para', ['ul', 'ol', 'paragraph']]
				              ],
				            placeholder: '최대 3000자 이내로 입력하세요.',
				            shortcuts: false
					  	});
					  </script>
				</div>
			</div>
			<br />
 				<button id="save" class="btn btn-primary" onclick="save()" type="submit">Save</button>
				<button id="back" class="btn btn-primary" onclick="back()" type="button">Back</button>
		 		<script>

					function save(){
						location.href='/allRight/selectList.ann';
					}
					
					function back(){
						location.href='/allRight/selectList.ann';
					}
					
		 		</script> 
		</div>

	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>
