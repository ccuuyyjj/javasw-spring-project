<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/messageDetail.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/layer_popup.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script src="js/datepicker.js"></script>
<script src="js/function.js"></script>
<script src="js/layer_popup.js"></script>  
</head>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<body>
	<div class="container_1">
                <div class="area-33">
                    1
                </div>
                <div class="container_2 area-58">
                    <div class="container_3">
                        <textarea rows="6" cols="60"></textarea>
                        <div class="container_4">
                            <div class="container_5">
                                <botton class="m-btn">메세지 보내기</botton>
                            </div>
                        </div>
                    </div>
                    <div class="container_6"></div>
                    <div class="container_8">
                        <div class="container_7">이름</div>
                        <div>내용
                        </div>
                        <div class="container_9">날짜
                        </div>
                    </div>
                </div>
        </div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>