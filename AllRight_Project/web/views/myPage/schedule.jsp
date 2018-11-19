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
<!-- <link href="/allRight/resources/css/style.css" rel="stylesheet"
	type="text/css" /> -->

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
	
				 	
				 	
				 	}// for-end
				 	
					event=arr;
	  
				  //테스트
				   tableTest(list);
		 
			  }	 // success-end
		});// ajax-end
		
		
		
		function tableTest(list){
			
			 /*  $('input[name="category"]:radio[value="all"]').prop('checked',true); */
		/* console.log( $('input[name="category"]:radio[value="all"]').prop('checked',true).val()); */

			 var result;
			 result = "-";
			
			 
					 // 라디오 조건 저장하기
				 	$("input:radio").click(function test(){	
			 
					  		/* console.log("함수쪽 " +$(this).index());  */
		                	var idx = $(this).index();
		
		                	var str;
		                	var j=0;
		                	
		                	switch(idx){
			                	case 1 : result="-";break;
			                	case 3 : result="접수";break;

			                	case 5 : result="시험"&&result!="접수";break;

			                	default: result="합격";break;
		
		                	 }
        				
		                	$('#tb').children().siblings().empty();
		                	var str="";
			  	 				for(var k = 0 ; k<list.length; k++){
									// dday 
			  	 					if(list[k].dday<0){
					  	 				// 버튼과 일치내용 all:전체	receipt원서 접수 일자	 testdate 시험일자	pass 합격일자
				    					if(list[k].title.match(result)!=null){
				    						console.log(list[k].title);
					    					str = "<tr>"
					    					  +"<td>"+k+"</td>"
					    					  +"<td>"+list[k].title+"</td>"
					    					  +"<td>"+list[k].date+"</td>"
					    					  +"<td>시행처</td>"

					    					  +"<td style='color:red' >D "+list[k].dday+"</td>"

					    					  +"</tr>";
											$('#tb').append(str);
											j++;
											if(j>6)break;
				    					}
			  	 					}
		    			     }//for end
				 		
				 	});
			 

		}// table function end
		
		
		
		$('#calendar').fullCalendar({
			header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listWeek'
	        
	      },
	      /*  titleFormat: {
	    	   month: "yyyy년 MMMM",
	    	   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
	    	   day: "yyyy년 MMM d일 dddd"
	      },  */
	      monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	      monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	      dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	      dayNamesShort: ["일","월","화","수","목","금","토"],
	      buttonText: {
	      today : "오늘",
	      month : "월별",
	      week : "주별",
	      day : "일별",
	      },
	      defaultDate: new Date(),
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: event
	    
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

th {
	text-align: center;
}
td {
	text-align: center;
}
table{
	 padding-bottom: 5px; 
	 width: 100%; 
	
}

</style>
</head>
<body  style="background:white">

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


			<div class="col-sm-8 text-center" id="showView">
				<!-- style="width: 70%; height: 100%; display: inline-block;" -->
				<div>
					<h1>일정관리</h1>

					<!-- <fieldset>
		          		<legend><small>최근일정</small></legend> -->		
			          <input type="radio" name="category" value="all" id="all"><label for="all">전체</label>&nbsp; &nbsp; 
			          <input type="radio" name="category" value="receipt" id="receipt"><label for="receipt">원서접수 알자</label>&nbsp; &nbsp; 
			          <input type="radio" name="category" value="testdate" id="testdate"><label for="testdate">시험일자</label>&nbsp; &nbsp;
			          <input type="radio" name="category" value="pass"id="pass"><label for="pass">합격일자</label>&nbsp; &nbsp;
      				 <!-- </fieldset> -->
					<div >

						<table id="info" border=1; style="width: 100%; heigh: 100px;"  cellspacing='0'
	cellpadding='0'>
							<thead>
								<tr style="text-align: center">
									<th></th>
									<th>자격증 이름</th>
									<th>일정</th>
									<th>시행처</th>
									<th>남은기간</th>
								</tr>
							</thead>
							<tbody id = "tb">
							
							
							</tbody>
							
							<%-- <%
								if (al != null) {
							%>
							<%
								for (LicenseInfo l : al) {
							%> --%>
							<tr>
								<%-- <th>1</th>
								<td><%=l.getlName()%></td>
								<td><%=l.getlDate()%></td>

								<td>큐넷</td>
								<td style="color: red">D <%=l.getdDay()%></td> --%>
							</tr>
							<%-- <%
								}
							%>
							<%
								} else {
							%> --%>
							<tr>
								<%-- <td colspan="5"><%=msg%></td> --%>
								<%-- <%
									}
								%> --%>
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
</div>

		<!-- <div id="test">
		<p id ="sdate">2018-11-20</p>
		<p id="edate">2018-11-25</p>
	</div> -->
</body>
</html>