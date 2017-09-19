/**
 * 
 */

$(document).ready(function(){
     	$(".WishList").on("submit", function(){
     		event.preventDefault();
     		
     		console.log("data 정보 = "+$(this).serialize());
     		$.ajax({
     			url:"/airbnb/mypage/wishlist",
     			type:"post",
     			data:$(this).serialize(),
     			success:function(res){
    				alert("등록 완료!");
    			},
    			error:function(){
    				alert("등록 과정에서 오류가 발생했습니다");
    			}
     		});
     	});
});