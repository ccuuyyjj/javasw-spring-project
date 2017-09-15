<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp" %>    
<div class="w3-main w3-content w3-padding" style="max-width:800px;margin-top:100px">
	<div class="empty"></div>
	
		<div class="host-row1">
			<h2>숙소의 모습을 보여 주세요.</h2>
		</div>
		
		<form method="post" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data">
			<input type="hidden" name="mode" id="mode">
			<div class="filebox"> 
				<label for="ex_file">업로드</label> 
				<input type="file" id="ex_file" name="file" > ${photourl}
			</div>
			
			<div id="holder" class="w3-center area-80">
				<c:if test="${photourl != null}">
					<img src="${pageContext.request.contextPath}/viewPhoto/${room.no}">
				</c:if>
					
			</div>
			<div class="empty"></div>	
			<div class="w3-row host-row">
				<a href="javascript:history.back();" >뒤로</a>
				<span class="space">&nbsp;</span>
				<input type="submit" id="after" class="w3-btn w3-white w3-border" value="나중에">
				<input type="submit" id="continue" class="w3-btn w3-round-large w3-green" value="계속" style="display:none;" >
				<span class="space">&nbsp;</span>
				<input type="submit" id="save" class="w3-btn w3-round-large" value="저장 후 나가기">
			</div>
		</form>
</div>		
<script>
$(document).ready(function(){
	$("#save").on("click", function(){
		document.getElementById('mode').value = 'save';
	});
});
</script>		
<script>
var upload = document.getElementById('ex_file'),
holder = document.getElementById('holder');

upload.onchange = function (e) {
	e.preventDefault();
	
	var file = upload.files[0],
	reader = new FileReader();
	
	reader.onload = function (event) {
		
		var filename = upload.value;
		console.log("name=>"+filename);
		var fileName = filename.slice(filename.indexOf(".") + 1).toLowerCase();

		if(fileName != "jpg" && fileName != "png" &&  fileName != "gif"){
			holder.style.backgroundColor = "gray";
			holder.innerHTML = "<h2>이미지 파일은 (jpg, png, gif) 형식만 등록 가능합니다.</h2>";
			fileName = "";
			return;
		}
		
		var img = new Image();
		img.src = event.target.result;
		
		// note: no onload required since we've got the dataurl...I think! :)
		if (img.width > 400) { // holder width
	  		img.width = 400;
		}
		img.height = 200;
		holder.innerHTML = '';
		holder.appendChild(img);
		
		$("#after").hide();
		$("#continue").show();
	};
	reader.readAsDataURL(file);
	
	return false;
};
</script>

	
<%@ include file="/WEB-INF/view/template/footer.jsp" %>    	