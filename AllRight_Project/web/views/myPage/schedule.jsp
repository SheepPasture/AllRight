<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- CSS -->
	<!-- <link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
	<link href="/allRight/resources/css/flexslider.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="/allRight/resources/css/animate.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">
	<link href="/allRight/resources/css/style.css" rel="stylesheet" type="text/css" />
   
	<link href='/allRight/resources/css/fullcalendar.min.css' rel='stylesheet' />
	<link href='/allRight/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
	<script src='/allRight/resources/js/moment.min.js'></script> 
	<script src='/allRight/resources/js/jquery.min.js'></script>  
	<script src='/allRight/resources/js/fullcalendar.min.js'></script>
<script>
  $(document).ready(function() {
	  console.log($('#info').children().children().text);
	  var year=2018;
	  var month=11;
	  var date=20;
	  var sdate ="'"+year+"-"+month+"-"+date+"'";
	 /*  console.log(sdate); */
	 
	 var edate ='2018-11-30';
	  
    $('#calendar').fullCalendar({
    	
    
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: '2018-11-03',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      
      events: [
       
        {
          title: 'Birthday Party',
          start: '2018-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          start: '2018-11-03',
          end: '2018-11-11'
        } ,
        {
            title: 'test',
            start: sdate,
            end: edate
        }
         
       
      ]
    });
  });
</script>
<style>
/*   body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  } */
  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }
  th{
  	text-align:center;
  }
  #info tr>td:last{
  color:red;
  }
</style>
</head>
<body>
	<!-- HEADER -->
	
	<%@ include file="/views/common/header.jsp" %>
	<!-- HEADER-END -->
	<br>
	 	<div class="container-fluid text-center">    
			<div class="row content">
				<div class="col-sm-2 sidenav"  style="display:inline-block; "  >
					<p><a id="s" href="/allRight/views/myPage/myPageMain.jsp">회원정보수정</a></p>
					<p><a href="/allRight/views/myPage/schedule.jsp">관심자격증 정보</a></p>
					<p><a href="<%= request.getContextPath() %>/bMyList.bo" >게시글 관리</a></p>
					<p><a href="/allRight/views/myPage/viewTest.jsp">기출문제 관리</a></p>
				</div>
				<br>
				<div class="col-sm-2 sidenav"  style="display:inline-block; background:ivory"  >
				
			<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>
				
				 </div> 
			
			  	<div id="showView" style="width:70%;height:100%; display:inline-block; ">
					<div>
		<h1>일정관리</h1>
		일정정보
		<div style="background-color:ivory">
		<table id="info"border=1; style="width:100%;heigh:100px;">
		<thead>
		<tr style="text-align:center"><th></th><th>자격증 이름</th><th>일정</th><th>시행처</th><th>남은기간</th>
		</tr>
		</thead>
		
		<tr>
		<th>1</th>
		<td>정처기</td><td>2018-12-30</td><td>큐넷</td><td>D-</td>
		</tr>
		<th>2</th>
		<td>정기시험</td><td>2018-12-30</td><td>큐넷</td><td>D-</td>
		</tr>
		</table>
		</div>
		<br>
		<hr>
		<br>
	 	 <div id='calendar'></div>
	</div> 
				</div>
			
		</div>
	 
	 
	<!-- <div id="test">
		<p id ="sdate">2018-11-20</p>
		<p id="edate">2018-11-25</p>
	</div> -->
</body>
</html>