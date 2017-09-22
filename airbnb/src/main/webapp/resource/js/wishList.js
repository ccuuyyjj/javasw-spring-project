/**
 * 
 */
$(document).ready(function(){
	
				$(".insert").on("click", function(){
					event.preventDefault();
					var check = $("#w-check").is(":checked");
					console.log("check =" +check);
					if(check === true){
						var title = $(".w-lb").text();
						var data = $("#wishform").serialize();
						console.log("data = "+data);
						console.log("title = "+title);
						$.ajax({
							type:"POST",
							url:"/airbnb/mypage/wishlist",
							data:{data, title},
							success:function(data){
								alert("위시리스트 등록 완료");
		        			}				
						});
					}
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
