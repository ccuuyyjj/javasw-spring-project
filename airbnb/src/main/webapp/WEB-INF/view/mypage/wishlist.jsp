<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>메세지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/message.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wishlist.css"/>
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
<%@ include file="/WEB-INF/view/template/header.jsp" %>
</head>
<div class="wl-container area-60">
                <div class="wl-container_3">
                    <div class="wl-container_1 area-70">위시리스트
                    </div>
                    <div class="wl-container_2">
                        <button class="wl-btn">
                            <span class="wl-span">위시리스트 만들기</span>
                        </button>
                    </div>
                </div>
                <div class="wl-container_3">
                    <div class="wl-container_4 area-70">내 위시리스트
                    </div>
                    <div class="wl-container_2">
                         <span>2개의 리스트</span>
                    </div>
                </div>
                <div class="wl-page">
                    <div class="wl-page_list">
                        <a href="#"><img
                            src="${pageContext.request.contextPath}/img/photo.jpg"> <br>
                        </a>
                    </div>
                    <div class="wl-page_list">
                        <a href="#"><img
                            src="${pageContext.request.contextPath}/img/photo.jpg"> <br>
                        </a>
                    </div>
                    <div class="wl-page_list">
                        <a href="#"><img
                            src="${pageContext.request.contextPath}/img/photo.jpg"> <br>
                        </a>
                    </div>
                    <div class="page_list">
                        <a href="#">
                            <div class="d W">
                                <div class="w">
                                    <div class="wl">관심</div>
                                    <div class="wl2">숙소2개</div>
                                </div>
                            </div>
                        </a>
                    </div>
	           </div>
            </div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>