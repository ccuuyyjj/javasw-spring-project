//maxlength 체크
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
    }    
}
$(document).ready(function(){
	$(".inputNum").on("blur ", function(){
		if($(".inputNum").val() != null && $(".inputNum").val() <= 0){
			$(".inputNum").val('');
		}
		
	});
});