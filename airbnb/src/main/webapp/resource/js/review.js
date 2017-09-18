$(document).ready(function() {
	
	$("#show_write").on("click",function(){
		console.log("하이~~");
		$("#write").toggle("normal");
		$("#show_write").css("display","none");
	});
	
	$("#cancel_write").on("click",function(){
		$("#write").toggle("fast");
		$("#show_write").css("display","block");
	});
});