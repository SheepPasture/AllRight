<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.sheep.jsp.member.model.vo.Member, com.sheep.jsp.userLicense.model.vo.*,com.sheep.jsp.licenseinfo.model.vo.*, java.util.*"%>
<%
	/* Member m = (Member)session.getAttribute("member");  */
	/* ArrayList<Member> m = (ArrayList<Member>)request.getAttribute("list"); */
	ArrayList<LicenseInfo> al = (ArrayList<LicenseInfo>) request.getAttribute("l");
	String msg = (String) request.getAttribute("msg");
	String dday = (String) request.getAttribute("dday");
	/*  ArrayList dayArr = request.getAttribute("dayArr");  */
%>
<!-- 
-필기시험원서접수시작 일자 
필기시험원서접수종료 일자 
-필기시험일자
-필기시험 합격(예정)자 발표일자 
-응시자격 서류제출 및 필기시험 합격자 결정시작일자 
응시자격 서류제출 및 필기시험 합격자 결정종료일자 
-면접시험원서접수시작 일자 
면접시험원서접수종료 일자 
-면접시험시작일자
면접시험종료일자
-합격자발표일자
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
	/* var dlname;
	var ddate;*/
	var dday; 
	var result;

	var a = [{title: 'title1', start:'2018-11-11' },{title: 'title1', start:'2018-11-11'}]
	event = a; 

			$.ajax({
			url : "<%=request.getContextPath()%>/lMylist.li", 

			type : "POST",
			async: false
			, dataType : "json"  
			     , error : function(request, status, error) {
			     alert("에러");
			    }
			    , success : function(data) {
  
			    	var list = data.list;
			    	var dl = data.list.length/11;
					var arr = [];
				 	for(var i =0; i< list.length ; i++ ){
							
				 	
				 			
			 
				 		
				 			// start date 구분하기		
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
				 	
				 // 최근일정 구하기
				 var date = new Date();
				 var year = date.getFullYear();
				 var month = date.getMonth()+1;
				 var day = date.getDate();
				    if ((day+"").length < 2) {
				        day = "0" + day;
				    }
				 
	
				 for(var j = 0; j <list.length ; j++ ){
				 		var date1 = new Date(year, month ,day);
						var date2 = new Date(list[j].date.substr(0,4),list[j].date.substr(5,2),list[j].date.substr(8,2));
						var diff = date1-date2;
						dday = parseInt(diff/( 24 * 60 * 60 * 1000))); 
				 		/* if(!(list[j].title.match(/종료/))){
				 			console.log(today-list[j].date);
				 		result.put("dlname",list[j].title);
				 		result.put("ddate",list[j].date);
				 		
				 		
				 		
				 		} */
				 	/* var day = data.day;
				 	console.log(day.length); */
			
				 	}
					event=arr;
				 	
			    }	 
		});


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

	
	
 	<%--  $(document).ready(function() {
		
		var title1 = "<%=al.get(0).getlName()%>";
		var title2 = "<%=al.get(1).getlName()%>";
		var title3 = "<%=al.get(2).getlName()%>";
		var date1 = "<%=al.get(0).getlDate()%>";
		var date2 = "<%=al.get(1).getlDate()%>";
		console.log(title1);
		var date3 = "<%=al.get(2).getlDate()%>"; 
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
				      
				     /*  events:events(), */
				      events:
		      
				      /* scheduleData, */
				
				    	     [ 

				    		  	 	{
				    		          title: title1,
				    		          start: date1
				    		        }, 
				    		        
				    		        {
					    		          title: title2,
					    		          start: date2
					    		    }/* ,
					    		    {
					    		          title: title3,
					    		          start: date3
					    		    } */
				    		        
				    		  ]  
				       
					<%--    {
					   <% for (LicenseInfo l : al){%>
					   	title : <%=l.getlName()%>,
					    start : <%=l.getlDate()%>
					   <%}%>
					   },
				   <%System.out.println("sd");%> 
				  		/* 	{
				  			for(int i =0; i<3; i++){
				  				title : ''+i,
				  				start : '2018-11-'+i+""
				  			}
				  		}, */
				  
				    	});
		function events(){
			  
			/*  String title1[] = String[]{}; */
 	 				
			 <%for(int i =0; i<al.size(); i++){
				/* title1[i] = al.get(i).getlName(); */
				System.out.println(al.get(0).getlName());
			}
			%>  
			
			<%for(LicenseInfo l : al){%>
			
			  sdata={title:"<%=l.getlName()%>",date:"<%= l.getlDate()%>"};
			   console.log(sdata);
			  /*  console.log(l); */
			   <%
			   System.out.println(l.);
			  
				}%>
			
			  /*  console.log(sdata); */
			/* 
			[	{
		          title:'asd',
		          start: '2018-11-12' 
	 	 		}
		        
	    	  ] */
				var sdata=[];
			   for(var i=0 ; i < <%=al.size()%>; i++){
				   <%for(LicenseInfo l : al){%>
				   sdata[i]={title:"<%=l.getlName()%>",date:"<%= l.getlDate()%>"};
				   <%}%>
				   console.log(i + ":"+sdata[i]);
				   console.log(<%=al.size()%>);
			   }
			  
		}
			   
			   <%for(LicenseInfo l : al){%>
				var i =0;
			   sdata[i]={title:"<%=l.getlName()%>",date:"<%= l.getlDate()%>"};
			 	console.log(i+" : "+sdata[i]);  
				/* console.log("----"); */
				title : sdata.title;
				start : sdata.date;
				i++;
				<%}%>
				/* console.log(sdata); */
		
		
  }); --%>
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

	<%@ include file="/views/common/header.jsp"%>
	<!-- HEADER-END -->
	<br>
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- NAV -->
			<div class="col-sm-2 sidenav"
				style="display: inline-block; height: 500px;">
				<%@ include file="/views/common/myPageNav.jsp"%>
			</div>
			<!-- NAV END-->
			<br>
			<div class="col-sm-2 sidenav"
				style="display: inline-block; background: ivory">

				<%-- 	<%@ include file="/views/common/myPageNav.jsp" %> --%>

			</div>

			<div id="showView"
				style="width: 70%; height: 100%; display: inline-block;">
				<div>
					<h1>일정관리</h1>
					일정정보
					<div style="background-color: ivory">
						<table id="info" border=1; style="width: 100%; heigh: 100px;">
							<thead>
								<tr style="text-align: center">
									<th></th>
									<th>자격증 이름</th>
									<th>일정</th>
									<th>시행처</th>
									<th>남은기간</th>
								</tr>
							</thead>

							<%
								if (al != null) {
							%>
							<%
								for (LicenseInfo l : al) {
							%>
							<tr>
								<th>1</th>
								<td><%=l.getlName()%></td>
								<td><%=l.getlDate()%></td>

								<td>큐넷</td>
								<td style="color: red">D <%=l.getdDay()%></td>
							</tr>
							<%
								}
							%>
							<%
								} else {
							%>
							<tr>
								<td colspan="5"><%=msg%></td>
								<%
									}
								%>
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