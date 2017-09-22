

$(document).ready(function() {
	
	$("#show_write").on("click",function(){
		$("#write").toggle("normal");
		$("#show_write").css("display","none");
	});
	
	$("#cancel_write").on("click",function(){
		$("#write").toggle("fast");
		$("#show_write").css("display","block");
	});
	
	//파라미터 가져오기
	$.urlParam = function(name){
	    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
	    if (results==null){
	       return null;
	    }
	    else{
	       return results[1] || 0;
	    }
	}
	
	//리뷰 페이지 이동시 스크롤 이동
	if($.urlParam("page")!=null){
		var scroll =$(".reviews").offset().top-120;
		$("body").animate({	scrollTop:scroll},500);
	}
});