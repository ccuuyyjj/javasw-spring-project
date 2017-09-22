

$(document).ready(function(){

	
//예약 취소
	$(".final_rsv").on("click",function(){
		console.log($(this).parent().prev().val());
		$.ajax({
			type:"POST",
			url:"/airbnb/mypage/delete",
			data:{
				"no":$(this).parent().prev().val()
			},
			success:function(data){
				if(data=="true"){
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
	$(".move_rsv").on("click",function(e){

		location.href="/airbnb/sub/detail/"+$(this).prev().val();
	});
	
});