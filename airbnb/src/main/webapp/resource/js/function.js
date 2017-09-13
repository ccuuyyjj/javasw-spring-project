//maxlength 체크
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
    }    
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
    	console.log("doc="+$( document ).scrollTop())
    	console.log("top="+jbOffset.top)
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