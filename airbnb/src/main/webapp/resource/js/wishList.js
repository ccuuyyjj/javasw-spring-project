/**
 * 
 */
$(document).ready(function(){
	
								
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
                
                $(".wbtn3").on("click", function(){
                	event.preventDefault();
                	$("#newwl").hide();
                	$(".wbtn").show();
                	$(".wl-input").val('');
                });
                
                $("#wbtn4").on("click", function(){
                	event.preventDefault();
                	$(".appendhere").children("div").remove();
                	var title = $(".wl-input").val();
                	console.log("title = "+title);
                	$.ajax({
                		type:"POST",
                		async: false,
						url:"/airbnb/mypage/wishlist",
						data:{title},
						beforeSend:wishlist,
						success:function(){
							alert("새로운 위시리스트가 추가되었습니다");
						}
                	})
                });
                
                $("#wldetail").on("click", function(){
                	event.preventDefault();
                	var title = $(".wl-input").val();
                	$.ajax({
                		type:"POST",
                		async: false,
						url:"/airbnb/mypage/wishlist",
						data:{title},
						success:function(){
							alert("새로운 위시리스트가 추가되었습니다");
							location.href = '/airbnb/mypage/wishlist';
						}
                	})
                });
            });


function wishlist() {
	var email = $("#email").val();
	console.log(email);
	console.log(email != '');
	console.log(email == '');
	console.log(email === '');
	if (email != '') {
		$.ajax({
			url : '/airbnb/mypage/wishlist2',
			type:"GET",
			async: false,
			dataType: "json",
			error:function(a,b,c){
				console.log("a = "+a+"b = "+b+"c = "+c);
				location.href='/airbnb/member/login';
			},
			success:function(res, code){
				console.log("res = "+res,"code = "+code);
				$("#wishList").show();
				wrapWindowByMask();
				// 반복문을 통하여 데이터를 화면에 출력
				$.each(res, function(i,d){
						console.log(d);
						createRow(d.title, i+1).appendTo($(".appendhere"));						
				});
			}				
		});
        function createRow(title, idx){
        	var div1 = $("<div/>").addClass("w-add wfont_2");
        	var div2 = $("<div/>").addClass("wlwl");
        	var label = $("<label/>").addClass("w-lb").attr("for", "w-check" + idx).text(title);
        	var input = $("<input>").attr("type", "checkbox").addClass("w-check")
        						.attr("id","w-check" + idx);
        	label.append(input);
        	div2.append(label);
        	div1.append(div2);
        	
        	return div1;
        }
	}else if(email === ''){
		location.href='/airbnb/member/login';
	}
}


function insert(roomno) {
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
		var room_no = roomno;
		console.log("room_no = "+room_no);
		console.log("title = "+title);
		$.ajax({
			type:"POST",
			url:"/airbnb/mypage/wishlist",
			async: false,
			data:{room_no, title},
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success:function(data){
				$(".w-add").remove();
				$('.mask, .wishListWindow').hide();
				alert("위시리스트 등록 완료");
			}				
		});
};