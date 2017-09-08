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
                right:''
			},
			defaultDate: '2017-09-12',
			navLinks: false, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
               
                date_change();		
				/*var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					 $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true	
				}$('#calendar').fullCalendar('unselect');*/
				
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

function date_change(){
	$.ajax({ 
		type: 'post' , 
		url: '/list.html' , 
		dataType : 'html' , 
		success: function(data) { 
			$("#listDiv").html(data); 
		} 
	});	
}

</script>     
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="row w3-center">
		<h2>예약 가능한 날짜를 설정해주세요.</h2>
	</div>
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