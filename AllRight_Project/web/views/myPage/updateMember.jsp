<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"%>

<%
	Member m = (Member)session.getAttribute("member");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="../../css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="../../css/style.css" media="screen" title="no title" charset="utf-8">



</head>
<article class="container">
        

        <div class="col-md-12">
        <div class="page-header">
    	    <h1><small>정보 수정</small></h1>
        </div>

        <form class="form-horizontal" id="updateForm" action="/allRight/mUpdate.me" method="post">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="userId">유저아이디</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" type="text" readonly placeholder="이메일" >
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름">
          </div>
        </div>
       
       


        <div class="form-group">
          <label class="col-sm-3 control-label" for="userId">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" type="email" placeholder="이메일">
        </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label" for="userId">관심자격증</label>
        <div>
          <select name="" id="">
            <option value="">아이티</option>
            <option value="">건축</option>
            <option value="">기타</option>
          </select>
          <select name="" id="">
              <option value="">정처기</option>
              <option value="">mos</option>
              <option value="">컴활</option>
          </select>
          

        </div>
        <br>


        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" onclick="memberUpdate();">정보 수정</button>
            <button class="btn btn-danger" onclick="memberDelete();">회원 탈퇴</button>
          </div>
        </div>


        </form>
          <hr>
        </div>
      </article>
       <script>
     	function memberUpdate() {
			$("#updateForm").submit();
		}
		
		function memberDelete() {
			location.href = "/allRight/mDelete.me?userId=<%=m.getUserId()%>";
		}
      
      </script>	

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../js/bootstrap.min.js"></script>
  </body>
</html>
