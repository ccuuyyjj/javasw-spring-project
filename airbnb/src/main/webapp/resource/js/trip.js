

$(document).ready(function(){
	
	
//예약 취소
	$(".final_rsv").on("click",function(){
		$.ajax({
			type:"POST",
			url:"/airbnb/mypage/delete",
			data:{
				"no":$("#cancel_no").val()
			},
			success:function(data){
				if(data=="true"){
					console.log("??");
					location.reload();
					alert("예약 취소 완료");
				}
			},
			error:function(request,status,error){
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
			}
		});
	});
	
//지나간 여행페이지 이동
	$("#move_rsv").on("click",function(){
		console.log("gdgd");
		console.log($(".move_no").val());
//		location.href="/airbnb/sub/detail"+$(".move_no").val();
	});
	
});