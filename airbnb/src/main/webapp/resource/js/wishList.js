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
                    $(this).remove();
                    var str1 = $("<div/>").text("이름").attr("class", "wfont_3");
                    var str2 = $("<div/>").attr("class", "wl-box_4").html('<input class="wl-input" type="text" required placeholder="위시리스트의 제목을 지정하세요">');
                    var str4 = $("<div/>").attr("class", "wl-box_5").html('<button class="wbtn3" >취소</button><button class="wbtn4" disabled>목록 만들기</button>');
                    str1.appendTo(target);
                    str2.appendTo(target);
                    str4.insertAfter(target);
                });
            });
