<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css"/>   
<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script> 
<script>
     
 function initMap(){
	 var geocoder = new google.maps.Geocoder();
	 var address = "${address}";
	 geocoder.geocode({'address': address}, function(results, status) {
		 console.log("status="+status)
		 if(status === 'OK') {
			 var lat= results[0].geometry.location.lat();
	         var lng = results[0].geometry.location.lng();
	         document.getElementById('lat').value = lat; 
	         document.getElementById('lng').value = lng;
	         console.log("map="+document.getElementById('map'))
		    var map = new google.maps.Map(document.getElementById('map'), {
		       zoom: 15,
		       center: results[0].geometry.location
		    });
		    var marker = new google.maps.Marker({
		       map: map,
		       position: results[0].geometry.location
		    });
		 } else {
			 $("#msg").text("지도를 찾을 수 없습니다.");
			 $("#map").html('<img src="http://placehold.it/600x400" width="600" height="400">');
		 }
	 });
 }
    	 
     
 </script>   

<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	<div class="host-row1">
		<div class="w3-round w3-teal area-10 w3-center">1단계</div>
		<h3 id="msg">숙소의 위치입니다.</h3>
	</div>
	<div class="host-row1">
			<div id="map">
				
			</div>
	</div>
	<div class="empty"></div>
	<form method="post" id="hfrm" action = "${pageContext.request.contextPath}/host/become_host1_3">
		<input type="hidden" id="lat" name="lat" value="0">
		<input type="hidden" id="lng" name="lng" value="0">
		<input type="hidden" id="mode" name="mode" >
		<div class="w3-row host-row">
			<a href="javascript:history.back();" >뒤로</a>
			<span class="space">&nbsp;</span>
			<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="계속">
			<span class="space">&nbsp;</span>
			<input type="submit" id="save" class="w3-btn w3-round-large" value="저장 후 나가기">
		</div>
	</form>
</div>	
<script>
$(document).ready(function(){
	$("#save").on("click", function(){
		document.getElementById('mode').value = 'save';
	});
});
</script>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	