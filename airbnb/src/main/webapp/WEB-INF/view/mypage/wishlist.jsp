<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>airbnb</title>
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
<div class="wl-container area-70">
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
                         <span>${count}개의 리스트</span>
                    </div>
                </div>
	                <c:choose>
					<c:when test="${count > 0}">
	                <div class="wl-page">
	                <c:forEach var="wishlist" items="${title}" varStatus="status">
	                    <div class="wl-page_list">
	                        <a href="${pageContext.request.contextPath}/mypage/wishlistdetail/${wishlist.title}/${roomcount[status.index]}">
	                            <div class="d" style="background-image: url(${photo[status.index]})">
	                                <div class="w">
	                                    <div class="wl">${wishlist.title}</div>
	                                    <div class="wl2">${roomcount[status.index]}개</div>
	                                </div>
	                            </div>
	                        </a>
	                    </div>
			    	</c:forEach>
	                </div>
					    	</c:when>
		            	<c:otherwise>
				           <div style="margin-right: 6%">
				               <div class="panel">
				                   <div class="row1">
				                       <div class="col-sm-10 col-sm-offset-1 col-md-4 col-md-offset-4 text-center space-8 space-top-8">
				                           <h3>
				                               <span>아직 등록된 위시리스트가 없습니다.</span>
				                           </h3>
				                           <p class="text-lead text-muted">
				                               <span>마음에 드는 숙소를 발견하셨다면 위시리스트를 만들어 저장하실 수 있어요.<br>
									                                여행을 준비 중이라면 위시리스트에 이용해 보세요.<br>
									                                선호하는 숙소를 저장하여 위시리스트를 만들어 보세요.<br>
				                               </span>
				                           </p>
				                       </div>
				                   </div>
				               </div>
				           </div>
			            </c:otherwise>
		            </c:choose>
			</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>