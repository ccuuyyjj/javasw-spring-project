<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>airbnb 관리자</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<body>

<!-- menu -->
<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>aibnb<br>관리자</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="${pageContext.request.contextPath}/admin/member" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white w3-gray">회원관리</a> 
    <a href="${pageContext.request.contextPath}/admin/reservations" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">예약현황</a> 
    <a href="${pageContext.request.contextPath}/admin/sales" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">매출현황</a> 
  </div>
</nav>
<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
  <div class="w3-container" id="member" style="margin-top:75px">
   		member
  </div>
</div>
</body>
</html>