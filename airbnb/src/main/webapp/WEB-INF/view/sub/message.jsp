<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/message.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">    
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
function button_event(){
	if (confirm("정말 삭제하시겠습니까??") == false){    //취소
		event.preventDefault();
		alert("취소 되었습니다.");		
	}else{   //확인
		document.form.submit();
	}
}
</script>
<div class="w3-main w3-content w3-padding"
	style="max-width: 100%; margin-top: 100px">
	<div class="menu-wrap">
		<ul class="w3-center">
			<li class="hover"><a
				href="${pageContext.request.contextPath}/sub/message">메시지</a>
			</li>
			<li><a href="${pageContext.request.contextPath}/mypage/rooms">숙소
					목록</a></li>
			<li><a
				href="${pageContext.request.contextPath}/mypage/trips">여행 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/setting">계정
					관리</a></li>
			<li><a href="${pageContext.request.contextPath}/mypage/wishlist">위시
					리스트</a></li>
		</ul>
	</div>
	<div class="w3-row">
        <div class="container1" style="margin-top: 0">
            <div>
                <div id="inbox-container" class="page-container-responsive page-container-inbox space-7 space-top-7">
                    <div class="row1 inbox-nav">
                        <div class="col-sm-12">
                            <div class="row1">
                                <div class="col-sm-12 col-md-7 h4"">
                                    <ul class="tabs tabs--inbox"">
                                        <li data-reactid="7">
                                            <a href="/#" class="tab-item" role="tab" aria-selected="true" tabindex="-1">
                                                여행
                                            </a>
                                        </li>
                                        <li data-reactid="10">
                                            <a href="/#" class="tab-item" role="tab" aria-selected="false" tabindex="0">
                                                호스팅
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-sm-12 col-md-5 space-1 text-right">
                                    <div class="select select-large inbox-dropdown">
                                        <select>
                                            <option selected="" value="all">모든 여행 메시지(${count}개)
                                            </option>
                                            <option value="starred">중요표시(0개)
                                            </option>
                                            <option value="unread">읽지 않음(0개)
                                            </option>
                                            <option value="hidden">숨긴 메시지(0개)
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                    	<c:when test="${count == 0}">
	                        <div class="">
	                            <div class="panel">
	                                <div class="row1">
	                                    <div class="col-sm-10 col-sm-offset-1 col-md-4 col-md-offset-4 text-center space-8 space-top-8">
	                                        <h3>
	                                            <span>아직 메시지가 없습니다.</span>
	                                        </h3>
	                                        <p class="text-lead text-muted">
	                                            <span>여행을 준비하며 호스트에게 받는 메시지가 여기에 표시됩니다.
	                                            </span>
	                                        </p>
	                                        <a href="/airbnb/sub/sub_list" class="btn btn-primary btn-large">
	                                            <span>숙소 둘러보기
	                                            </span>
	                                        </a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>                    		
                        </c:when>
                        <c:otherwise>
                        	<div class="">
	                            <div class="panel">
	                                <div class="row1">
	                                    <div class="col-sm-10 col-sm-offset-1 col-md-4 col-md-offset-4 text-center">
	                                        <c:forEach var="message" items="${message}" varStatus="status">
												<table class="m_table">
		                                            <tr>
		                                              	<td class="m_padding m_area-10">${message.host_name}</td>
		                                                <td class="m_padding m_area-20">${message.name}<br>${message.date}</td>
		                                                <td class="m_padding m_area-50"><a href="messageDetail/${message.room_no}">${message.question}</a></td>
		                                                <td class="m_padding m_area-10">￦${message.price}</td>
		                                                <td class="m_padding m_area-10">
			                                                <form action="messagedelete">
			                                                	<input type="hidden" name="room_no" value="${message.room_no}">
			                                                	<input type="submit" value="삭제" class="w3-btn w3-round w3-red" onclick="button_event();">		                                                
			                                                </form>
		                                                </td>
		                                            </tr>
	                                           	</table>
	                                           	<div class="m_border"></div>
											</c:forEach>
	                                    </div>
	                                </div>
	                            </div>
                        </c:otherwise>
                   	</c:choose>
                    </div>
                </div>
            </div>
            <div class="empty"></div>
    	</div>
 	</div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>