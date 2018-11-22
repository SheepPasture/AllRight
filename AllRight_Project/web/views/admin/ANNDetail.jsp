<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sheep.jsp.member.model.vo.Member"
    import="com.sheep.jsp.point.model.vo.Point ,java.util.*, com.sheep.jsp.announcement.model.vo.* , com.oreilly.servlet.*"%>
    

<%
	Member m = (Member)session.getAttribute("member");
	Point pt = (Point)session.getAttribute("point");
  	Object level=session.getAttribute("level");   
  	Announcement a = (Announcement)request.getAttribute("announcement");

%>


<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="/allRight/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/allRight/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>뉴스 게시판 수정</title>
	 <script src="/allRight/resources/js/jquery.min.js" type="text/javascript"></script>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/allRight/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/allRight/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="/allRight/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/allRight/assets/css/themify-icons.css" rel="stylesheet">
	
	
	 <style type="text/css">
   
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

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<%= request.getContextPath() %>/admin.jsp"  class="simple-text">
                <b>A L L</b> R I G H T 
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="<%= request.getContextPath() %>/admin.jsp">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                 <li class="active">
                    <a href="<%= request.getContextPath() %>/selectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>공지 게시판 수정</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/newsSelectList.ad">
                        <i class="ti-pencil-alt2"></i>
                        <p>뉴스 게시판 수정</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/bReportList.ad">
                        <i class="ti-face-sad"></i>
                        <p>신고된 글 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/commentList.co">
                        <i class="ti-face-sad"></i>
                        <p>신고된 댓글 관리</p>
                    </a>
                </li>
             <li>
                    <a href="<%= request.getContextPath() %>/views/admin/newLicense.jsp">
                        <i class="ti-plus"></i>
                        <p>자격증 추가</p>
                    </a>
                </li>
                <!-- 
                <li>
                    <a href="maps.html">
                        <i class="ti-map"></i>
                        <p>Maps</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-bell"></i>
                        <p>Notifications</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="upgrade.html">
                        <i class="ti-export"></i>
                        <p>Upgrade to PRO</p>
                    </a>
                </li> -->
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">공지 게시판 수정</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <div class="loginArea" >
	 <% if(m != null && m.getUserId().equals("admin")) {%>
		
		<div style="float:left; width:250px;">
		<form id="loginForm" action="/allRight/mLogin.me" method="post">
			<div id="userInfo" style = "padding-top:23px;">
			<label><%= m.getUserName() %>님의 방문을 환영합니다.</label><br>

		</div>
		
		</div>
		
		<div class="btns" style = "float:left; padding-right:15px;">
				<input type="button" class="btn btn-danger" value="로그아웃" onclick="logout()" />
			</div>
			
		</form>

	<% } else {
	request.setAttribute("msg","관계자 외에 접근이 불가능한 페이지입니다.");
	request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
} %>
	
	</div>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">   
         <div class="row content">
				
				<div class="col-sm-11 text-left">
					
					<% if(a != null) { %>
					<!-- 게시판(뷰)시작 -->
					<div class="board_area">
						<form id="updateForm" method="post">
						<table class="view">
							<tbody>
								<tr>
									<th>제목</th>
 									<td class="title"><%= a.getAtitle()%></td>
									<th><div>글번호</div><br /><div>조회수</div></th>
									<td><div><%= a.getAno() %></div><br /><div><%= a.getAcount() %></div></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>등록일시</th>
				 					<td><%= a.getAdate() %></td>
								</tr> 
								<tr>
									<th>내용</th>
								 	<td colspan="3"><%= a.getAcontent() %></td>
								</tr>			
								<tr>
									<td colspan="5">
										<input id="ano" name="ano" type="hidden" value="<%= a.getAno() %>"/>
									</td>
									
								</tr>
								<% } else { 
							 		request.setAttribute("msg", "회원만 가능한 서비스 입니다."); 
									request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
								} %>
								<tr>
									<th>이전글&nbsp; ▲</th>
									
									<td colspan="3"><a href="#" onclick="before();">
										<%= a.getAno()-1 %>번째 글입니다.
									</a></td>
								</tr>
								<tr>
									<th>다음글&nbsp; ▼</th>
									<td colspan="3"><a href="" onclick="after();"><%= a.getAno()+1 %>번째 글입니다.</a></td>
								</tr>
							</tbody>
						</table>
 						<div class="btn_area2">
 								<button class="btn btn-primary" onclick="back();">목록으로 바로가기</button>
 								
 								<button class="btn btn-danger" onclick="del();">삭제</button>
								<button class="btn btn-warning" onclick="edit();">수정</button>
						</div> </form>
						<script>
							function before(){
								var ano = $("#ano").val();
								location.href="/allRight/annBefore.ad?"+"ano="+ano;
							}
							
							function after(){
								var ano = $("#ano").val();
								location.href="/allRight/annAfter.ad?"+"ano="+ano;
							}
						
							function edit(){
								var ano = $("#ano").val();
			 		 			$("#updateForm").attr("action", "<%=request.getContextPath()%>/annUpView.ad?ano="+ano);
			 		 		}
						
							function back(){	
								$("#updateForm").attr("action","<%=request.getContextPath() %>/selectList.ad");
							}
							
							function del(){
								var ano = $("#ano").val();
								$("#updateForm").attr("action","<%=request.getContextPath() %>/annDelete.ad?ano="+ano);
							}
						</script>
					</div>		
				</div>
			</div>
  
            </div>
        </div>

         <footer class="footer">
            <div class="container-fluid">
               
            </div>
        </footer>

    </div>
    
    <script type="text/javascript">
    function logout(){
		location.href = "/allRight/mLogout.me";
	}
    </script>
    
</div>


</body>

 
</html>