<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>상세페이지</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css"/>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">   
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js"></script>
        <script src="${pageContext.request.contextPath}/js/gmaps.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/js/layer_popup.js"></script>
		
        <script>
            $(document).ready(function(){
            	
            	//구글맵 생성
            	//var gmap = new GMaps({옵션});
            	var gmap = new GMaps({
                    div:"#map"//어디에(출력장소),선택자
                    ,lat:${room.lat}//위도
                    ,lng:${room.lng}//경도                 
                });
            	console.log(gmap);
                gmap.addMarker({
                    lat:${room.lat}//위도
                    ,lng:${room.lng}//경도                 
                });
            });
        </script>
    </head>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
        <div class="photo">
            <img src="${pageContext.request.contextPath}/viewPhoto/${room.no}" width="100%" height="80%">
        </div>
        <div class="container_1">
            <div class="container">
                <div class="menu">
                    <a class="atag" href="#">개요</a>
                    <a class="atag" href="#">후기</a>
                    <a class="atag" href="#">호스트</a>
                    <a class="atag" href="#">위치</a>
                </div>
            </div>
            <div>
                <div class="detailTitle">${room.name}</div>
            </div>
            <div>
                <a class="atag_1">${room.type}</a>
                <span aria-hidden="true"> · </span>
                <a class="atag_1">${room.region}</a>
                <span aria-hidden="true"> · </span>
                <a class="atag_1">후기 000개</a>
            </div>
            <div class="container_2">
                <span aria-hidden="true"> · </span>
                <div class="content">인원 ${room.capacity}명</div>
                <span aria-hidden="true"> · </span>
                <div class="content">침대 ${room.beds}개</div>
                <span aria-hidden="true"> · </span>
                <div class="content">침실 ${room.bedrooms}개</div>
            </div>
            <div class="content_1">숙소정보</div>
            <div class="content_4">
            	${room.etc}
            	<br><br><br>
            </div>
            <div class="container_3">
                <table class="reviewTable">
                            <tr>
                                <td class="content_2">시설</td>
                                <td class="content_3">
                                    엘리베이터<br>
                                    반려동물 입실 가능<br>
                                    가족/어린이 숙박에 적합<br>
                                    인터넷<br>
                                    경비원<br>
                                    부엌<br>
                                    초인종/인터폰<br>
                                    무선 인터넷<br>
                                    흡연 가능<br>
                                    헬스장<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content_2">가격</td>
                                <td class="content_3">
                                    추가 인원 요금 ₩23144 / 박 (2명 초과 시)<br>
                                    주 단위 할인율: 12%<br>
                                    월 단위 할인율: 20%<br>
                                    언제나 에어비앤비를 통해 대화를 나누세요.<br>
                                    안전한 결제를 위해 에어비앤비 웹사이트나 앱 외부에서 송금하거나 대화를 나누지 마세요.<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content_2">침대/침구</td>
                                <td class="content_3">
                                    공용 공간<br>
                                    퀸 베드 1개, 에어 메트리스 1개<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content_2">숙소 이용규칙</td>
                                <td class="content_3">
                                    흡연 금지<br>
                                    반려동물 동반에 적합하지 않음<br>
                                    파티나 이벤트 금지<br>
                                    어린이(만 2-12세)에게 안전하거나 적합하지 않음<br>
                                    체크인 가능 시간은 15:00 - 20:00입니다<br>
                                    12:00까지 체크아웃하세요<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content_2">환불정책</td>
                                <td class="content_3">
                                    이 호스트는 엄격 환불 정책을 시행합니다<br>
                                    체크인 30일 전까지 예약을 취소하면 전액 환불받을 수 있습니다.<br>
                                    30일이 남지 않은 시점에서 취소하면 1박 요금의 50%와 수수료 전액을 환불받을 수 있습니다<br>
                                </td>
                            </tr>
                            <tr>
                                <td class="content_2">안전기능</td>
                                <td class="content_3">
                                    화재 감지기<br>
                                    구급 상자<br>
                                    안전 카드<br>
                                    소화기<br>
                                </td>
                            </tr>
                    </table>
            </div>
            <!-- fixed 예약(S) -->
           	
		    <div class="btnFixed">
		    	<div class="w3-row content_1 booking-title w3-center">
		    		최소 : <span>\</span><span>295,041</span>/박
		    	</div>
		    	<div class="booking-wrap">
			    	<div class="w3-row content_1">
			    		<div class="w3-col s3">
			    			<label class="booking-menu">체크인</label>
			    		</div>
			    		<div class="w3-col s4">
			    			<input type="text" placeholder="년/월/일" class="booking-height">
			    		</div>
			    		
			    	</div>		
			    	<div class="w3-row content_1">
			    		<div class="w3-col s3">
			    			<label class="booking-menu">체크아웃</label>
			    		</div>
			    		<div class="w3-col s4">
			    			<input type="text" placeholder="년/월/일" class="booking-height">
			    		</div>
			    	</div>
			    	<div class="w3-row content_1">
			    		<div class="w3-col s12">
			    			<span>인원</span>
			    			<input type="number" class="booking-width booking-height inputNum" > 명
			    		</div>
			    	</div>
			    	<div class="w3-row w3-center">
			    			<input type="button" class="booking-width booking-height w3-red w3-round-large" value="예약 요청">
			    	</div>
			    	<div class="w3-row booking-comment">
			    		100% 환불 가능ㆍ예약 확정 전에는 요금이 청구되지 않습니다.
			    	</div>
			    	<hr>
			    	<div class="w3-row w3-center">
			    			<input type="button" class="booking-width booking-height w3-white w3-round-large" value="위시리스트에 담기">
			    	</div>
		    	</div>
		    </div>
		    <!-- btnFixed3// -->


            
            <!-- fixed 예약(E) -->
            <div class="reviewsContainer">
                <div class="reviews">후기 000개
                    <span class="star">★★★★★</span>
                </div>
            <div>
                    <table>
                            <tr>
                                <td>정확성</td>
                                <td class="star">★★★★★</td>
                                <td>위치</td>
                                <td class="star">★★★★★</td>
                            </tr>
                            <tr>
                                <td>의사소통</td>
                                <td class="star">★★★★★</td>
                                <td>청결도</td>
                                <td class="star">★★★★★</td>
                            </tr>
                            <tr>
                                <td>체크인</td>
                                <td class="star">★★★★★</td>
                                <td>가치</td>
                                <td class="star">★★★★★</td>
                            </tr>
                    </table>
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
                    <div class="detailReview">
                        <div>작성자</div>
                        <div>날짜</div>
                        <div>내용=Jay and Stephanie's cabin was a welcome escape from the day-to-day. It is a peaceful and relaxing getaway that is close to Joshua Tree National Park. Stargazing under the clear and open sky was incredible. We also enjoyed the fresh juices that were recommended to us. Thanks for a great stay!</div>
                    </div>
                    <div class="detailReview">
                        <div>작성자</div>
                        <div>날짜</div>
                        <div>내용=Jay and Stephanie's cabin is a sanctuary in the desert. Jay met me for check in and gave me the lay of the land. The cabin is just as advertised in the pictures. Exquisite. The outdoor shower is just perfect in the hot desert sun. I spent an evening painting at Joshua Tree park which is an amazing experience and a must see. I also did Angela's one day juice cleanse which was extraordinary and invigorating! I highly recommend this whole experience. I will be back!</div>
                    </div>
                    <div class="detailReview">
                        <div>작성자</div>
                        <div>날짜</div>
                        <div>내용=For my birthday, I took a long weekend at two of Stephanie and Jay's properties in the beautiful Mojave Desert -- two nights at the Homesteader Cabin and one night at the Homesteader Camp Cabin. Everything went smoothly. Communication was easy and the directions were clear. The properties themselves are really lovely -- beautifully restored with lots of thoughtful design details and artistic "grace notes." The natural setting is beautiful, and the dark night star-filled skies were a rare treat for this city dweller. I'll never forget my night under the stars in a hammock at the Homesteader Camp Cabin. On a practical note, I'm glad I left my low-riding sports car in Los Angeles and rented a mid-sized SUV for the trips. The properties are reached by dirt and sand road that can be quite bumpy.</div>
                    </div>
                    <div class="detailReview">
                        <div>작성자</div>
                        <div>날짜</div>
                        <div>내용=This place is a gem! :) really secluded and private but 
                        close to shops and Joshua tree park. The view is amazing. Loved it!
                        </div>
                    </div>
                    <div class="pageNo">
                        <div class="page-unit"><a href="#">1</a></div>
                        <div class="page-unit"><a href="#">2</a></div>
                        <div class="page-unit"><a href="#">3</a></div>
                        <div class="page-unit"><a href="#">4</a></div>
                        <div class="page-unit"><a href="#">5</a></div>
                        <div class="page-unit"><a href="#">▶</a></div>
                    </div>
                    <div class="host">
                        <div>호스트: Stephanie And Jay님</div>
                    </div>
                    <div class="host_1">
                        <span>죠슈아 트리(Joshua Tree), 캘리포니아,  미국</span>
                        <span>·</span>
                        <span>회원가입: 1월 2010</span>
                    </div>
                    <div class="host_2">
                        <div>어쩌구저쩌꾸 We are creative types who left Los Angeles in 2010 seeking a richer, more serene lifestyle inside nature. Stephanie is an architect, Jay is founder/editor of Arthur Magazine. We live in Joshua Tree full-time and rent out our three restored homestead cabins (with a fourth on the way). We're active in the local community and we also maintain ties to friends and colleagues in LA and beyond. We're excited to meet you and we offer you a warm welcome. 어쩌구저쩌구</div>
                    </div>
                    <button class="messagebtn host_3">
                    	<div>호스트에게 연락하기</div>
                    </button>
                    <div>
                        <div>지역정보</div>
                        <div id="map">지도 공간</div>
                    </div>
                    <div>정확한 위치 정보는 예약이 확정된 후 알려드립니다.</div>
                </div>
            </div>
        </div>
<%@ include file="/WEB-INF/view/template/footer.jsp" %>