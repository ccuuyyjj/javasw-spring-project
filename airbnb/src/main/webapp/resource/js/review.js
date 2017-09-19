$(document).ready(function() {
	
	$("#show_write").on("click",function(){
		$("#write").toggle("normal");
		$("#show_write").css("display","none");
	});
	
	$("#cancel_write").on("click",function(){
		$("#write").toggle("fast");
		$("#show_write").css("display","block");
	});
	
	//페이지 이동시 스크롤바 고정
		var scroll =$(".reviews").offset().top-150;
		$("body").animate({	scrollTop:scroll},500);
		//500은 이동 시간
});