<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="reviewsContainer">
    <div class="reviews">
    	<h3>후기 000개</h3>
    	
    </div>

	<div class="detailContainer">
	    <div class="detailReview">
	        <div>작성자</div>
	        <div>날짜</div>
	        <div>내용=This place is absolutely beautiful and very special. Jay was a great host. He greeted us upon our arrival and was very polite and helpful. If you're looking for an experience and some peace and quiet, this place is perfect.</div>
	    </div>
	    <div class="detailReview">
	        <div>작성자</div>
	        <div>날짜</div>
	        <div>내용=Beautiful cabin providing a unique Joshua Tree experience! Stephanie and Jay are extremely attentive hosts!</div>
	    </div>
	     <form id="write" >
                <input id ="star"type="radio" name="rate"  value="1"checked>
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                
                <input id ="star"type="radio" name="rate" value="2"  >
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15"> 
                
               <input id ="star"type="radio" name="rate" value="3">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                                                          
                <input id ="star"type="radio" name="rate" value="4" >
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png" width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                <img src="${pageContext.request.contextPath}/img/star.png"width="15" height="15">
                
                <input id ="star"type="radio" name="rate" value="5" >
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