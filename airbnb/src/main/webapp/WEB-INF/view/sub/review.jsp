<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="reviewsContainer">
    <div class="reviews">
    	<h3>후기 ${total }개
    	<c:choose>
    	<c:when test="${avg==1 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==2 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==3 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==4 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    		<c:when test="${avg==5 }">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		<img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
    		</c:when>
    	</c:choose>
    		
    	</h3>
    	
    </div>

	<div class="detailContainer">
		<c:forEach var="list" items="${review}">
	    <div class="detailReview">
	        <div>${list.email }</div>
	        <div>${list.reg }</div>
	        <br>
	        <div>${list.detail }</div>
	    </div>
		</c:forEach>
	   
	     <form id="write"  action="${pageContext.request.contextPath}/sub/review/${room.no}" method="POST">
                <input id ="star"type="radio" name="rating"  value="1"checked>
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                
                <input id ="star"type="radio" name="rating" value="2"  >
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15"> 
                
               <input id ="star"type="radio" name="rating" value="3">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                                                          
                <input id ="star"type="radio" name="rate" value="4" >
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                
                <input id ="star"type="radio" name="rating" value="5" >
                 <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15"/>
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <br><br>
                <textarea  name="detail" placeholder="후기를 남겨주세요."rows="7" id="detail_board" ></textarea>
                
                <div id="btn">
                <input id="cancel_write" type="button" value="취소">
                <input type="submit" value="작성하기">
                </div>
              </form>
			<br>
	    <div class="pageNo">
	        <div class="page-unit"><a href="#">1</a></div>
	        <div class="page-unit"><a href="#">2</a></div>
	        <div class="page-unit"><a href="#">3</a></div>
	        <div class="page-unit"><a href="#">4</a></div>
	        <div class="page-unit"><a href="#">5</a></div>
	        <div class="page-unit"><a href="#">▶</a></div>
	    </div>
		<button id="show_write"  style="float: right">후기 쓰기</button>
	 </div>   
</div>    