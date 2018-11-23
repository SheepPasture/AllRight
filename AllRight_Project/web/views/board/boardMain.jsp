<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.sheep.jsp.licenseinfo.model.vo.*" %> 
 <%
 LicenseInfo li = (LicenseInfo)request.getAttribute("li");
ArrayList<LicenseInfo> llist =  (ArrayList<LicenseInfo>)request.getAttribute("llist");
 %> 
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
/*   padding: 80px 140px 80px 80px;  */
  padding: 80px 80px;
  background-color: white;
  border: 1px solid gray;
  color: gray;
  border-radius: 0;
  transition: .2s;
  text-decoration:none;
/*    WIDTH: 100pt;  */
	/*HEIGHT: 60pt; */
}

.listbtn a {
/*   	margin: auto;  */
/*   	padding: auto; */
    text-decoration: none;
/*     font-size: 100px; */
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
				<div id="boardlist" class="boardlist col-sm-8 text-center">
					<br /><br />
<!-- 					<input type="button" class="listbtn" value="아이티" id="button" name="1" onclick="it();"/>
					<input type="button" class="listbtn" value="요리"  id="button" onclick="cook();"/>
					<input type="button" class="listbtn" value="건축"  id="button" onclick="architecture();"/>
					<input type="button" class="listbtn" value="도시"  id="button" onclick="city();"/>
					<input type="button" class="listbtn" value="토목"  id="button"  onclick="civil();"/> -->

					<script>		
					
<%-- 					$( document ).ready( function() {
		                 
		                $("#button").click(function(){
		 					var name = $(this).attr('name');
		 					console.log(name);
		 					
		 					location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + name;
		                });
		         
		            }); --%>
		            
					$.ajax({
						url : '/allRight/lSelect.li',
						type : 'get',
						dataType : 'json',
						success : function(data) {
							$table = $('#boardlist');
							
							var list = data.lArray;
							var l = data.list;
							
							console.log(l.length);

							for(var i = 1; i < l.length; i++){
								$table.append(
									"<input type='button' class='listbtn' id='"+i+"' value='"+l[i].listName+"' id='button'/>" );
							}
							
							$('.listbtn').on('click', function(){
								
								console.log(this.id);
								var id = this.id;
								
								location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + id; 
							});
						
						}
					});
					
<%--  						function it(){
							var bid = 1;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}
						
						function cook(){
							var bid = 2;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}
						
						function architecture(){
							var bid = 3;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}
						
						function city(){
							var bid = 4;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						}
						
						function civil(){
							var bid = 5;
							location.href="<%=request.getContextPath()%>/selectList.bo?bid=" + bid;
						} --%>

					</script>
			</div>
		</div>
</body>
</html>