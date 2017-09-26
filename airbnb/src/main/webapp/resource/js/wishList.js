/**
 * 
 */
$(document).ready(function(){
	
				$(".insert").on("click", function(){
					event.preventDefault();
					var check='';
	                $.each($(".w-check"), function(){
	                	check = $(this).is(":checked");
	                	console.log("반복문 check = "+check)
	                	if(check == true){
	                		result = $(this).parent("label").text();
	                		return result;
	                	}
	                });
					console.log("result = "+result);
						var title = result;
						var data = $("#wishform").serialize();
						console.log("data = "+data);
						console.log("title = "+title);
						$.ajax({
							type:"POST",
							url:"/airbnb/mypage/wishlist",
							data:{data, title},
							success:function(data){
								e.preventDefault();
								$('.mask, .wishListWindow').hide();
								alert("위시리스트 등록 완료");
		        			}				
						});
				});
								
                $(".wbtn").on("click", function(){
                    event.preventDefault();
                    var target = $(this).parent();
                    $(this).hide();
                    $("#newwl").show();
                });
                $(".wl-input").on("input", function(){
                    var name = $(".wl-input").val();
                    console.log("name = "+name);
                    if(name === ""){
                        $(".wbtn4").prop("disabled", true);
                    }else{
                        $(".wbtn4").prop("disabled", false);
                    }  
                });
            });
