<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>
<%
ArrayList<Member> m = (ArrayList<Member>)request.getAttribute("list");
ArrayList<LicenseInfo> al = (ArrayList<LicenseInfo>)request.getAttribute("list"); 
String msg = (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- CSS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	  /*   console.log($('#info').children().children().text); */
	  /*  var year=2018;
	  var month=11;
	  var date=20; */
	/*   var sdate ="'"+year+"-"+month+"-"+date+"'";	 
	  var edate ='2018-11-30';
	    */
	   
	  <%-- <%for(LicenseInfo l : al){%>
		<%
		System.out.println(l.getlName());
		System.out.println(l.getlDate());
		
		%>
	  <%}%> --%>
	 
 	
 		 $.ajax({
 			 url :"<%= request.getContextPath() %>/lMylist.li",
 			type : "GET",
 			/* dataType: 'json', */
 			success : function(data){
 			
	 		console.log(data); 
 		      
 		      },error:function() {
					console.log("수신 실패!");
			  }
 		    });
			
		   /* dataType:list, */
		/*         */
		       /*  start: start.unix(),
		        end: end.unix() */
		      /* 
		      success: function(list) {
		      /*   var events = [];
		        $(doc).find('event').each(function() {
		          events.push({
		            title: $(this).attr('title'),
		            start: $(this).attr('start') // will be parsed
		          });
		        }); */
		      /*  console.log("!1111111111");
		        console.log(data);
		         */ 

 	var scheduleData ={title:'123',start:'2018-11-11'};	  
 	 $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay,listWeek'
      },
      defaultDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      
      events:/* scheduleData, */

    	   [
    			
    		  	/* 	{
    		          title: 'Birthday Party',
    		          start: '2018-03-13T07:00:00'
    		        }, */
    		        {
    		          title: "Click for Google",
    		          start: '2018-11-03',
    		          end: '2018-11-11'
    		        } 
    		        
    		 ] 
       
	<%-- <%--    {
	   <% for (LicenseInfo l : al){%>
	   	title : <%=l.getlName()%>,
	    start : <%=l.getlDate()%>
	   <%}%>
	   },
   <%System.out.println("sd");%> --%> 
  		/* 	{
  			for(int i =0; i<3; i++){
  				title : ''+i,
  				start : '2018-11-'+i+""
  			}
  		}, */
  
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
				<!-- NAV -->
				<div class="col-sm-2 sidenav"  style="display:inline-block;height:500px; "  >
				<%@ include file="/views/common/myPageNav.jsp" %> 
				</div>
				<!-- NAV END-->
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
	
		<%if(al!=null){ %>
		<%for(LicenseInfo l : al){%>
		<tr>
		<th>1</th>
		<td><%=l.getlName()%></td>
		<td><%=l.getlDate()%></td>
		
		<td>큐넷</td>
		<td>D-</td> 
		</tr>
		<%}%>
		<%}else{%>
		<tr><td colspan="5"><%=msg%></td>
		<%}%>
		<!-- <th>2</th>
		<td>정기시험</td><td>2018-12-30</td><td>큐넷</td><td>D-</td>
		</tr> -->
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