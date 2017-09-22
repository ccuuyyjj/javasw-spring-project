<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css"/>
<script>
function changeTab1(){
	$("#tab1").addClass("on");
	$("#tab2").removeClass("on");
	$("#tab3").removeClass("on");
	$("#menu1").show();
	$("#menu2").hide();
	$("#menu3").hide();
}
function changeTab2(){
	$("#tab2").addClass("on");
	$("#tab1").removeClass("on");
	$("#tab3").removeClass("on");
	$("#menu1").hide();
	$("#menu2").show();
	$("#menu3").hide();
}
function changeTab3(){
	$("#tab3").addClass("on");
	$("#tab1").removeClass("on");
	$("#tab2").removeClass("on");
	$("#menu1").hide();
	$("#menu2").hide();
	$("#menu3").show();
}
function cngoption(pNo){
	switch(pNo){
	case 1:
		
		break;
	case 2:
		break;
	case 3:
		break;
	}
	
	var string = "no="+pNo+"&"
	
	$.ajax({
		   type: "POST",
		   url: "${pageContext.request.contextPath}/mypage/transaction_history",
		   data: { 
			   "no" : pNo,
			   "step" : pVal
			   },
		   DateType: "html",
		   cache: false,
		   success: function(msg){
			   if(msg == "OK"){
				   window.location.reload();
			   }
		   },
		  error:function(a, b, c){
				console.log(a, b, c);
			}
	});
	
}
</script>
<div class="w3-main w3-content w3-padding" style="max-width:100%;margin-top:100px">
	<div class="menu-wrap">
	    <ul class="w3-center">
	        <li>
	            <a href="${pageContext.request.contextPath}/sub/message">메시지</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/rooms">숙소 목록</a>
	        </li>
	        <li>
	            <a href="${pageContext.request.contextPath}/mypage/trips">여행 목록</a>
	        </li>
	        <li class="hover">
	            <a href="${pageContext.request.contextPath}/mypage/setting">계정 관리</a>
	        </li>
	    </ul>
	</div>
	<div class="w3-row">
		<div class="w3-col s4 w3-white w3-center submenu_wrap">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mypage/setting">계정관리</a></li>
				<li class="hover"><a href="${pageContext.request.contextPath}/mypage/transaction_history">대금수령내역</a></li>
			
			</ul>
		</div>
		
	  	<div class="w3-col l6 m3 s4 w3-white w3-center subcontent">
	  		<div class="subtab">
				<ul>
					<li id="tab1" class="on"><a href="javascript:changeTab1();">수령완료 내역</a></li>
					<li id="tab2"><a href="javascript:changeTab2();">수령예정 내역</a></li>
					<li id="tab3"><a href="javascript:changeTab3();">총 수입</a></li>
				</ul>
			</div>
			<!-- 수령완료 내역 -->
			<div class="area-100 tab-item"  id="menu1">
				<form id="rfrm" method="post" >
				<div class="w3-row">
			  		<div class="w3-col s3  text-right host-row1">
				  		<select class="host-select" name="hostName">
							<option value="all">모든 숙소</option>
							<c:forEach var="names"  items="${nameList}">
								<option>${names}</option>
							</c:forEach>
						</select>
		  			</div>
			  		<div class="w3-col s3 w3-center host-row1">	
				  		<select class="host-select" name="startMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
								<option value="${i}">시작: ${i}월</option>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1">	
				  		<select class="host-select" name="endMonth">
				  			<c:forEach begin="1" end="12" step="1" var="i">
				  				<c:if test="${i eq 12}">
				  					<option value="${i}" selected>종료:${i}월</option>
				  				</c:if>
				  				<c:if test="${i != 12}">
									<option value="${i}" >종료:${i}월</option>
								</c:if>	
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1 searchbtn">
			  			<input type="button" onClick="JavaScript:cngoption(1)" value="검색" class="w3-button w3-gray w3-small">
			  		</div>
			  	</div>
			  	</form>
			  	<div class="host-row1 area-100" id="sub1">	
			  		<table class="history_table" >
			  			<thead>
			  				<th>날짜</th>
			  				<th>종류</th>
			  				<th>상세정보</th>
			  				<th>금액</th>
			  				<th>수령 완료 금액</th>
			  			</thead>
			  			<tbody>
			  				<td colspan="5" align="center"><b>거래 없음</b></td>
			  			</tbody>
			  		</table>
			  	</div>	
			  	
	  		</div>
	  		
	  		<!-- 수령예정 내역 -->
			<div class="area-100 tab-item"  id="menu2" style="display:none;">
				<div class="w3-row">
			  		<div class="w3-col s3  text-right host-row1">
				  		<select class="host-select">
							<option>모든 숙소</option>
						</select>
		  			</div>
			  	</div>
			  	<div class="host-row1 area-100">	
			  		<table class="history_table" >
			  			<thead>
			  				<th>날짜</th>
			  				<th>종류</th>
			  				<th>상세정보</th>
			  				<th>입금처</th>
			  				<th>금액</th>
			  			</thead>
			  			<tbody>
			  				<td colspan="5" align="center"><b>거래 없음</b></td>
			  			</tbody>
			  		</table>
			  	</div>	
			  	
	  		</div>
	  		
	  		<!-- 총 수입 내역 -->
			<div class="area-100 tab-item"  id="menu3" style="display:none;">
				<form id="afrm" method="post" action="#">
				<div class="w3-row">
			  		<div class="w3-col s3 w3-center host-row1">	
				  		<select class="host-select">
				  			<c:forEach begin="1" end="12" step="1" var="i">
								<option value="${i}">시작: ${i}월</option>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1">	
				  		<select class="host-select">
				  			<c:forEach begin="1" end="12" step="1" var="i">
								<option value="${i}">종료:${i}월</option>
							</c:forEach>
						</select>
			  		</div>
			  		<div class="w3-col s2 host-row1 searchbtn">
			  			<input type="button" onClick="JavaScript:cngoption(1)" value="검색" class="w3-button w3-gray w3-small">
			  		</div>
			  	</div>
			  	</form>
			  	<div class="host-row1 area-100">	
			  		<table class="history_table" >
			  			<thead>
			  				<th>날짜</th>
			  				<th>종류</th>
			  				<th>상세정보</th>
			  				<th>총 수입</th>
			  			</thead>
			  			<tbody>
			  				<td colspan="4" align="center"><b>거래 없음</b></td>
			  			</tbody>
			  		</table>
			  	</div>	
	  		</div>
		</div>
	</div>
</div>	
<div class="empty"></div>
<div class="empty"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp" %>