//maxlength 체크
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
    }    
}
//숫자 3자리 콤마
function numberWithCommas(x) { 
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
}

// 특정일 선택막기
function enableAllTheseDays(date) {
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    for (i = 0; i < enabledays.length; i++) {
        if($.inArray(y + '-' +("00" + (m + 1)).slice(-2) + '-' + d,enabledays) != -1) {
            return [true];
        }
    }
    return [false];
} 

$(document).ready(function(){
	//인원  자릿수 체크
	$(".inputNum").on("blur ", function(){
		if($(".inputNum").val() != null && $(".inputNum").val() <= 0){
			$(".inputNum").val('');
		}
		
	});
	
	//상세페이지 메뉴 상단 고정
    var jbOffset = $( '.w3-top' ).offset();
    $( window ).scroll( function() {
    	$( '.btnFixed' ).fadeIn();
    	if($( document ).scrollTop()==0 &&  jbOffset.top==0){
       	  	//$( '.btnFixed' ).css("top", 600);
    		$( '.btnFixed' ).fadeOut();
    	}		
    	else if ( $(window).scrollTop() >= jbOffset.top ) {
    		$( '.btnFixed' ).css("top", "130px");
      }
      else {
    	  $( '.btnFixed' ).css("top", 600);
      }
    	
    });	
});