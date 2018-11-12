<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<title>ALLRight</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>

<!--   	<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script> -->
<!-- 	<script src="/allRight/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" /> -->

<!--  	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>  --> 

    <link href="resources/dist/summernote.css" rel="stylesheet">
    <script src="resources/dist/summernote.js"></script>

    <!-- include summernote-ko-KR -->
	<script src="lang/summernote-ko-KR.js"></script>
	
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
   	 <%@ include file="/views/common/header.jsp" %>   

	<!-- PAGE -->
	<div id="page">

		<div class="container-fluid text-center">    
			<div class="row content">
				<br>
				<div class="col-sm-2 sidenav">
					<p><a href="/allRight/selectList.ann">공지사항</a></p>
					<p><a href="/allRight/community/communityList.jsp">커뮤니티</a></p>
					<p><a href="/allRight/license/licenseinfo.jsp">자격증정보</a></p>
				</div>
				<div class="col-sm-8 text-left">
					<h3 align="left">글쓰기</h3>
										<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<table class="view">
							<tbody>
								<tr>
									<th class="col-sm-2">제목</th>
									<td></td>
								</tr>
								<tr>
									<th class="col-sm-2">내용</th>
									<td>
										<form method="post">
										  <textarea id="summernote" name="editordata" class="col-sm-8" style="border: 1px solid tomato"></textarea>
										</form>
									</td>
								</tr>			
							</tbody>
						</table>
<!-- 					  <div id="summernote"  class="col-sm-10" style="border: 1px solid tomato"></div> -->
					  <script>
					  $('#summernote').summernote();
/* 					  	$('#summernote').summernote({
				            lang: 'ko-KR',
				            height: 500,
				            weight: 500,
				            minHeight: null,      // 최소 높이값(null은 제한 없음)
				            maxHeight: null, 
				            toolbar: [
				                ['font', ['fontsize', 'bold', 'color', 'height']],
				                ['para', ['ul', 'ol', 'paragraph']]
				              ],
				            placeholder: '최대 3000자 이내로 입력하세요.',
				            focus: true, 
				            shortcuts: false
					  	}); */
					  </script> 
				</div>
			<br />
			<div align="center">
 				<button id="save" class="btn btn-primary" onclick="save()" type="submit">Save</button>
				<button id="back" class="btn btn-primary" onclick="back()" type="button">Back</button>
			</div>
			</div>
		 		<script>

					function save(){
						location.href='/allRight/selectList.ann';
					}
					
					function back(){
						location.href='/allRight/selectList.ann';
					}
					
		 		</script> 
		</div>
	</div>
	<!-- FOOTER -->
	<footer>
			
	</footer><!-- //FOOTER -->
	

</div>
</body>
</html>
