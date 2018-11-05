<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='../../resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='../../resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='../../resources/js/moment.min.js'></script>
<script src='../../resources/js/jquery.min.js'></script>
<script src='../../resources/js/fullcalendar.min.js'></script>
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
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

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
	
	<!-- <div id="test">
		<p id ="sdate">2018-11-20</p>
		<p id="edate">2018-11-25</p>
	</div> -->
</body>
</html>