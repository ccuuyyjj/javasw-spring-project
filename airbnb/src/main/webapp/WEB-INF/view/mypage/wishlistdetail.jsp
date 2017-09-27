<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wishlistdetail.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wishlist.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/message.css"/>
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
<c:choose>
	<c:when test="${roomcount > 0}">
		<div class="d-row dfont">${wltitle}</div>
            <div class="d-row">${roomcount}개</div>
	            <c:forEach var="room" items="${roomlist}">
		            <div class="d-box">
		                <div class="d-img" style="background-image: url(${room.photoUrl})">
		                    <label>
		                        <input class="d-check" type="checkbox" id="d-check">
		                    </label>
		                    <div class="d-box_1">
		                        <div class="d-box_2"><span>${room.price}</span>${room.name}</div>
		                        <div class="d-box_2 dfont_2">${room.type}</div>
		                        <div class="d-box_2 dfont_2" style="margin-bottom: 0px">
		                            <spna>★</spna><spna>★</spna><spna>후기 ???개</spna>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </c:forEach>
		        </c:when>
            	<c:otherwise>
		           <div style="margin-right: 20%">
		               <div class="panel">
		                   <div class="row1">
		                       <div class="col-sm-10 col-sm-offset-1 col-md-4 col-md-offset-4 text-center space-8 space-top-8">
		                           <h3>
		                               <span>아직 등록된 숙소가 없습니다.</span>
		                           </h3>
		                           <p class="text-lead text-muted">
		                               <span>마음에 드는 숙소를 발견하셨다면 저장하실 수 있어요.<br>
							                                여행을 준비 중이라면 위시리스트에 이용해 보세요.<br>
							                                선호하는 숙소를 저장하여 위시리스트를 만들어 보세요.<br>
		                               </span>
		                           </p>
		                           <a href="/airbnb/sub/sub_list" class="btn btn-primary2 btn-large">
		                               <span>숙소 둘러보기
		                               </span>
		                           </a>
		                       </div>
		                   </div>
		               </div>
		           </div>
	            </c:otherwise>
            </c:choose>
        </div>
            </div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>