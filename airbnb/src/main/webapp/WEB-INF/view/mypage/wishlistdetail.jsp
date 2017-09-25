<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wishlistdetail.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wishlist.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layer_popup.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<div class="wl-container area-70">
            <div style="margin-left: 20%">
<div class="d-row dfont">관심 위시리스트 제목</div>
            <div class="d-row">숙소 2개</div>
            <c:forEach var="room" items="${roomlist}">
	            <div class="d-box">
	                <div class="d-img">
	                    <label>
	                        <input class="d-check" type="checkbox" id="d-check">
	                    </label>
	                    <div class="d-box_1">
	                        <div class="d-box_2"><span>${roomlist.price}</span>${roomlist.name}</div>
	                        <div class="d-box_2 dfont_2">${roomlist.type}</div>
	                        <div class="d-box_2 dfont_2" style="margin-bottom: 0px">
	                            <spna>★</spna><spna>★</spna><spna>후기 ???개</spna>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </c:forEach>
            <div class="d-box">
                <div class="d-img">
                    <label>
                        <input class="d-check" type="checkbox" id="d-check">
                    </label>
                    <div class="d-box_1">
                        <div class="d-box_2"><span>￦21884</span>Romantic front lake Como attic </div>
                        <div class="d-box_2 dfont_2">아파트 전체, 침대 2개</div>
                        <div class="d-box_2 dfont_2" style="margin-bottom: 0px">
                            <spna>★</spna><spna>★</spna><spna>후기 ???개</spna>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>