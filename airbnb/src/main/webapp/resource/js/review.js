

$(document).ready(function() {
	
	$("#show_write").on("click",function(){
		$("#write").toggle("normal");
		$("#show_write").css("display","none");
	});
	
	$("#cancel_write").on("click",function(){
		$("#write").toggle("fast");
		$("#show_write").css("display","block");
	});
	
	
	//리뷰 페이지 이동시 스크롤 이동
//	$.urlParam = function(name){
//		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
//		return results[1] || 0;
//	}
//	
//	if($.urlParam("page")!=null){
//		var scroll =$(".reviews").offset().top-120;
//		$("body").animate({	scrollTop:scroll},500);
//	}
});