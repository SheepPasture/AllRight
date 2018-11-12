<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLRight</title>
<!-- 제이쿼리 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<button id="selectBtn">테스트</button>
	<script>
		$(function(){
			$('#selectBtn').click(function(){
				$.ajax({
					url : "/com/test.do",
					type : "get",
					success : function(data){
						console.log(data);
						$select = $('#selectTest');
						$select.find("option").remove();
						for(var i = 0; i < data.length; i++){
							
							$select.append("<option value='"+ data[i].qNo +"'>"
											+data[i].qContent
											+data[i].qPre
											+data[i].qAnswer+"</option>");
						}
					}, error : function(data){
						console.log("에러");
					}
				});
			});
		})
	</script>

</body>
</html>