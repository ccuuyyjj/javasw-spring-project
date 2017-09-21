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
                        <div class="d-container">
                            <div class="d-container_9">호스트 아이디</div>
                            <div class="d-container_1">여행 세부정보</div>
                            <div class="d-container_2">${name}</div>
                            <div class="d-container_6">
                                <div class="d-container_3">
                                    <span class="span_1">체크인
                                        <div class="d-container_5">${checkin}</div>
                                    </span>
                                </div>
                                <div class="d-container_8">
                                    <span class="span_1">▷
                                    </span>
                                </div>
                                <div class="d-container_3">
                                    <span class="span_1">체크아웃
                                        <div class="d-container_5">${checkout}</div>
                                    </span>
                                </div>
                            </div>
                            <div class="d-container_4"><span class="span_1">게스트</span>
                                <div class="d-container_5">${quantity}명</div>
                            </div>
                            <div class="d-container_1">
                            언제나 에어비앤비를 통해 대화하세요.
                            </div>
                            <div class="d-container_7">
                            안전한 결제를 위해 에어비앤비 웹사이트나 앱 외부에서 송금하거나 대화를 나누지 마세요.
                            </div>
                        </div>
                </div>
                <div class="container_2 area-58">
                    <div class="container_10">
                    	<form action="${room_no}" method="post">
                    		<input type="hidden" name='name' value="${name}">
                            <input type="hidden" name="room_no" value="${room_no}">
                            <input type="hidden" name="checkin" value="${checkin}">
                            <input type="hidden" name="checkout" value="${checkout}">
                            <input type="hidden" name="quantity" value="${quantity}">
                            <input type="hidden" name="price" value="${price}">
	                        <textarea rows="6" cols="50" name="question"></textarea>
	                        <div class="container_3">
	                            <div class="container_4">
	                                <div class="container_5">
	                                	<input type="submit" class="m-btn" value="메세지 보내기">
	                                </div>
	                            </div>
	                        </div>
                        </form>
                    </div>
                    <div class="container_6"></div>
                    <c:forEach var="message" items="${message}">
                    <div class="container_8">
                        <div class="container_7">아이디</div>
                        <div>${message.question}
                        </div>
                        <div class="container_9">${message.date}
                        </div>
                    </div>
                    </c:forEach>
                </div>
        </div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>