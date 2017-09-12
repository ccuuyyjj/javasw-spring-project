<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fullcalendar.print.min.css" media='print'/>
<script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fullcalendar.min.js"></script>
<script>

	$(document).ready(function() {
		$('#calendar, .fc-event-container').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				//right: 'month,agendaWeek,agendaDay'
                right:' '
			},
			defaultDate: '2017-09-12',
			navLinks: false, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
			  <c:forEach var="avail" items="${availList}">	
				{
					id: '${avail.getDate()}',
					start: '${avail.getDate()}'
				},
			   </c:forEach>	
			],
			selectable: true,
			selectHelper: false,
			select: function(start, end) {
				console.log("start : "+start.format());
		    	console.log("end : "+end.format());
				var startForm =  start.format();
				var endForm = end.format();
				 
				var startYear 	= startForm.split('-')[0];
				var startMonth 	= startForm.split('-')[1];
				var startDay 		= startForm.split('-')[2];
				var endYear 		= endForm.split('-')[0];
				var endMonth 	= endForm.split('-')[1];
				var endDay 		= endForm.split('-')[2];
				
				var startDate = startMonth+'/'+startDay+'/'+startYear;
				var endDate = endMonth+'/'+endDay+'/'+endYear;

				var date1 = new Date(startDate);
				var date2 = new Date(endDate);
				var timeDiff = Math.abs(date2.getTime() - date1.getTime());
				var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
				
		        check_date(startDate, diffDays); 
			},
			eventClick: function(calEvent, jsEvent, view) {
				
				var startForm =  calEvent.start.format();
				var startYear 	= startForm.split('-')[0];
				var startMonth 	= startForm.split('-')[1];
				var startDay 		= startForm.split('-')[2];
				var startDate = startMonth+'/'+startDay+'/'+startYear;
				
				check_date(startDate, 1);
			}
			
		});
			
	});

function check_date(startDate, diff){
	console.log("startDate="+startDate);
	console.log("diff="+diff);
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/host/check_date",
		   data: {
			   "start" : startDate,
			   "diff" : diff
			   },
		   DateType: "html",
		   cache: false,
		   success: function(msg){
			console.log(msg);
			var arr = msg.split("@");
			for(var i=0; i<arr.length; i++){
				var subArr = arr[i].split("|");
				var day = subArr[0].split("/")[2]+"-"+subArr[0].split("/")[0]+"-"+subArr[0].split("/")[1];
				var available = subArr[1];
				console.log("s=>"+day);
				console.log("a=>"+available);
				
				var eventData = {
					id:day,	
					start: day
				};
				if (available === "true") {
					$('#calendar').fullCalendar('renderEvent', eventData, true); 	
				} else {
					$('#calendar').fullCalendar('removeEvents', day);
				}
				
			}
			
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