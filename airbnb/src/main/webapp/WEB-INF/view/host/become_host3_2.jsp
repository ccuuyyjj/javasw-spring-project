<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.print.min.css" media='print'/>
<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				//right: 'month,agendaWeek,agendaDay'
                right:' '
			},
			defaultDate: '2017-09-12',
			navLinks: false, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
               console.log("start : "+start.format());
               console.log("end : "+end.format());
				start =  start.format();
				end = end.format();
				 
				
				var startYear = start.split('-')[0];
				var startMonth = start.split('-')[1];
				var startDay = start.split('-')[2];
				var endYear = end.split('-')[0];
				var endMonth = end.split('-')[1];
				var endDay = end.split('-')[2];
				
				startDate = startMonth+'/'+startDay+'/'+startYear;
				endDate = endMonth+'/'+endDay+'/'+endYear;

				var date1 = new Date(startDate);
				var date2 = new Date(endDate);
				var timeDiff = Math.abs(date2.getTime() - date1.getTime());
				var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

				console.log("startday : " +start);
				console.log("diffDays : " +diffDays);
				
               check_date(startDate, diffDays);
               
                	 
				
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			/*events: [
				{
					title: 'All Day Event',
					start: '2017-09-01'
				},
				{
					title: 'Long Event',
					start: '2017-09-07',
					end: '2017-09-10'
				},
				
			]*/
		});
			
	});

function check_date(start, diff){
	console.log("start="+start);
	console.log("diff="+diff);
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/host/check_date",
		   data: {
			   "start" : start,
			   "diff" : diff
			   },
		   DateType: "html",
		   cache: false,
		   success: function(msg){
			//console.log("start"+"${start}");
			//console.log("available"+"${available}");
			console.log(msg);
		  },
		  error:function(a, b, c){
				console.log(a, b, c);
			}
	});
	
}
</script>     
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row w3-center">
		<h2>예약 가능한 날짜를 설정해주세요.</h2>
	</div>
	<div class="w3-row host-row">&nbsp;</div>
	<div class="calendar-wrap">
		<div id='calendar'></div>
	</div>
	<form method="post" action="${pageContext.request.contextPath}/host/become_host3_2">	
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-red w3-right" value="완료">
		</div>
	</form>
	<div class="empty"></div>
</div>	

<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	