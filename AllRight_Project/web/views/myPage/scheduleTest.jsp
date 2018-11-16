<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>
<%
	/* Member m = (Member)session.getAttribute("member");  */
	/* ArrayList<Member> m = (ArrayList<Member>)request.getAttribute("list"); */
%>
<!-- 
필기시험원서접수시작 일자 
필기시험원서접수종료 일자 
필기시험일자
필기시험 합격(예정)자 발표일자 
응시자격 서류제출 및 필기시험 합격자 결정시작일자 
응시자격 서류제출 및 필기시험 합격자 결정종료일자 
면접시험원서접수시작 일자 
면접시험원서접수종료 일자 
면접시험시작일자
면접시험종료일자
합격자발표일자
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <link href="/allRight/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/allRight/resources/css/flexslider.css" rel="stylesheet"
	type="text/css" />
<link href="/allRight/resources/css/prettyPhoto.css" rel="stylesheet"
	type="text/css" />
<link href="/allRight/resources/css/animate.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/allRight/resources/css/owl.carousel.css" rel="stylesheet">
<link href="/allRight/resources/css/style.css" rel="stylesheet"
	type="text/css" />

<link href='/allRight/resources/css/fullcalendar.min.css'
	rel='stylesheet' />
<link href='/allRight/resources/css/fullcalendar.print.min.css'
	rel='stylesheet' media='print' />
<script src='/allRight/resources/js/moment.min.js'></script>
<script src='/allRight/resources/js/jquery.min.js'></script>
<script src='/allRight/resources/js/fullcalendar.min.js'></script>

<script>

$(document).ready(function() { 
var event= [] ;

var a = [{title: 'title1', start:'2018-11-11' },{title: 'title1', start:'2018-11-11'}]
event = a; 

		$.ajax({
		url : "<%=request.getContextPath()%>/sTest.sc", 

		type : "POST",
		async: false
		, dataType : "json"  
		     , error : function(request, status, error) {
		     alert("에러");
		    }
		    , success : function(data) {
		    	  var resultText = "";
		    	 
		    	 for(var index in data.list){
		    		 var user = data.list[index];
		    		resultText +=user.title + ", ";
					resultText +=user.date +"\n";
				
		    	 }
		    	  
		    	var list = data.list;
		    	var dl = data.list.length/11;
				var arr = [];
			 	for(var i =0; i< list.length ; i++ ){
	
						if(list[i].title.match(/시작/)!=null){
							arr[i] = { title : list[i].title , 
									 start : list[i].date ,
									 end : list[i+1].date 
									 }
							if(arr[i]==null)arr={};
							i++;
							arr[i]={};
							
						}else{
							arr[i] = {title :list[i].title ,
									 start : list[i].date 
								}
						}
						if(!status) arr[i] + ",";
				
				}

				event=arr;
			
			 	a=arr;
		    }	 
	});
 	console.log("어후 ..." + event);

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
      events: event
    
 	});
	

});



/*  	 $(document).ready(function() { */
		

		<%-- var date3 = "<%=al.get(2).getlDate()%>";  --%>
				 	 /* $('#calendar').fullCalendar({
				      header: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'month,agendaWeek,agendaDay,listWeek'
				      },
				      defaultDate: new Date(),
				      navLinks: true, // can click day/week names to navigate views
				      editable: true,
				      eventLimit: true, // allow "more" link when too many events
				    
				      events:
		 
				
				    	     [ 

				    		  	 	{
				    		          title: 'title1',
				    		          start:'2018-11-11'
				    		        }, 
				    		        
				    		        {
					    		          title: 'title2',
					    		          start: '2018-11-12'
					    		    }
					    	
				    		  ]  
		
				  
				    	}); */
				 	
				 	 
				/*  	$(document).ready(function() {
				 		  
				 		  $.ajax({
				 		   
				 		     type : "POST"
				 		     , url : "/allRight/sTest.sc" //Request URL
				 		     , dataType : "json" //전송받을 데이터�� 타입
				 		                 , contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				 		     , error : function(request, status, error) {
				 		     alert("에러");
				 		     }
				 		     , success : function(data) {
				 		     setCalendar(data.data);
				 		 
				 		    }
				 		   });
				 		  
				 		 
				 		 });
				 		 
				 		 function setCalendar( data ){
				 		  var date = new Date();
				 		  var d = date.getDate();
				 		  var m = date.getMonth();
				 		  var y = date.getFullYear();
				 		  var jsonData = JSON.stringify(data).replace(/\"/gi,"");
				 		 
				 		  
				 		  $('#calendar').fullCalendar({
				 	
				 		   editable: false,
				 		   events: eval(jsonData)
				 		  });
				 		
				 		  
				 		 }  */
				 		 
/* 				 	 
				 	 
				 	 
				 	 
		
		
  }); */
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

th {
	text-align: center;
}

#info tr>td:last {
	color: red;
}
</style>
</head>
<body>

	<!-- HEADER -->


	<!-- HEADER-END -->
	<br>
	<div class="container-fluid text-center">
		<div class="row content">



			<div>
				<h1>일정관리</h1>
				일정정보 <br>
				<hr>
				<br>
				<div id='calendar'></div>

			</div>


		</div>


		<!-- <div id="test">
		<p id ="sdate">2018-11-20</p>
		<p id="edate">2018-11-25</p>
	</div> -->
</body>
</html>