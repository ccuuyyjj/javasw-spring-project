function wrapWindowByMask(){
	// 화면의 높이와 너비를 변수로 만듭니다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();
 
    // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
    $('.mask').css({'width':maskWidth,'height':maskHeight});
 
    //fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
    $('.mask').fadeIn(1000);
    $('.mask').fadeTo("slow",0.8);
 
    // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
    var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
    var left = ( $(window).scrollLeft() + ( $(window).width() - $('.messageWindow').width()) / 2 );
    //var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
    var top = 150;
 
    // css 스타일을 변경합니다.
    $('.window').css({'left':left,'top':top, 'position':'absolute'});
    $('.messageWindow').css({'left':left,'top':top, 'position':'absolute'});
 
    // 레이어 팝업을 띄웁니다.
    //$('.window').show();
}
 
$(document).ready(function(){
	// showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
	$('.loginbtn').click(function(e){
		// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			$("#login").show();
			$("#join").hide();
            e.preventDefault();
            wrapWindowByMask();
	});
	
	$('.joinbtn').click(function(e){
		// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			$("#login").hide();
			$("#join").show();
            e.preventDefault();
            wrapWindowByMask();
	});
	
	$('.messagebtn').click(function(e){
		// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			$("#message").show();
            e.preventDefault();
            wrapWindowByMask();
	});
 
    // 닫기(close)를 눌렀을 때 작동합니다.
	$('.window .close').click(function (e) {
		e.preventDefault();
		$('.mask, .window').hide();
	});
	$('.messageWindow .close').click(function (e) {
		e.preventDefault();
		$('.mask, .messageWindow').hide();
	});
 
	// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
//	$('.mask').click(function () {
//		$(this).hide();
//		$('.window').hide();
//    });
	
		//이메일 중복 검사
		$("#email").on("blur",function(){
			$.ajax({
				type:"POST",
				url:"/airbnb/member/check",
				data:{
					"email":$("#email").val()
				},
				success:function(data){
					if(data=="false"){
						alert("중복된 아이디 입니다!!")
						$("#email").addClass("cant");
					}else{
						$("#email").removeClass("cant");
					}
				},
				error:function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); 
				}
			});
		});
	
		//중복 아닐시 데이터 전송
		$("#check").on("submit",function(){
			event.preventDefault();		//submit 이벤트를 없애자
			
			if($("#email").hasClass("cant")){
				alert("잘못된 정보 입니다!");
			}else{
				$.ajax({
					type:"POST",
					url:"/airbnb/member/join",
					data:$("#check").serialize(),
					success:function(){
						alert("회원가입 완료~")
						$(".resource").val(null);
						$(".window").css("display","none");
						$(".mask").css("display","none");
        			}				
				});
			}
		});

		//회원가입 팝업창 close 누를시 리셋
		$(".close").on("click",function(){
			$(".resource").val(null);
			$("#email").removeClass("cant");
		});
		
});