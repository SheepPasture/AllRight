<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>

<title>ALLRight</title>
<script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
<style>

.boardlist {
	border: 1px solid #f5f5f5;
	height: 1000px;
}

.listbtn {
  margin: 10px 10px 5px 10px;
  padding: 80px 80px; 
  background-color: white;
  border: 1px solid gray;
  color: gray;
  border-radius: 0;
  transition: .2s;
  text-decoration:none;
}

.listbtn a {
  	margin: auto; 
    text-decoration: none;
    font-size: 100px;
}
.listbtn:hover, .btn:focus {
  border: 1px solid #767676;
  background-color: #f5f5f5;
  color: #767676;
  text-decoration:none;
}

.listbtnd {
  height: 30px;
  weight: 30px;
  background-color: white;
  border: 1px solid lightgray;
  color: gray;
  border-radius: 0;
  transition: .2s;
  text-decoration:none;
  }

  </style>
</head>
<body>
<!-- PAGE -->
	<div id="page">

		<%@ include file="/views/common/header.jsp"%>

		<div class="container-fluid text-center">
			<div class="row content">
				<br />
				<div class="side col-sm-2 sidenav">
					<p><a href="selectList.ann">공지사항</a></p>
					<p><a href="<%= request.getContextPath() %>/selectList.bo">커뮤니티</a></p>
					<p>
						<a href="#">자격증정보</a>
					</p>
				</div>
				<div class="boardlist col-sm-8 text-center">
					<br /><br />
					<input type="button" class="listbtn" value="IT" onclick="it();"/>
					<input type="button" class="listbtn" value="요리" onclick="cook();"/>
					<input type="button" class="listbtn" value="건축" onclick="#"/>
					<input type="button" class="listbtn" value="도시" onclick="#"/>
					<input type="button" class="listbtn" value="토목" onclick="#"/>
					<br />
					<input type="button" class="listbtn" value="IT" onclick="it();"/>
					<input type="button" class="listbtn" value="요리" onclick="cook();"/>
					<input type="button" class="listbtn" value="건축" onclick="#"/>
					<input type="button" class="listbtn" value="도시" onclick="#"/>
					<input type="button" class="listbtn" value="토목" onclick="#"/>
					<script>
					
						function it(){
							var bid = 1;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}

					</script>
			</div>
		</div>
</body>
</html>