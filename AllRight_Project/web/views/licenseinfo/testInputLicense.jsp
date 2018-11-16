<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 자격증 입력용</title>
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>

<h1>임시로 자격증 입력을 위해 버튼을 눌러 주세요</h1>
<h2>추후에 관리자 페이지로 삽입할 예정</h2>
<br />
<button id="push">자격증 입력</button>
<script>
	$("#push").click(function(){
		console.log("실행!");
		
		$.ajax({
			url : "/allRight/lInput.do",
			type : "get",
			data : {
				
			}, success : function(data){
				alert("자격증 저장 성공!");
			}, error : function() {
				alert("실패!");
			}, complete : function() {
				alert("자격증 저장을 시작합니다. 잠시 기다려 주세요!");
			}
		});
		
	});
</script>

</body>
</html>