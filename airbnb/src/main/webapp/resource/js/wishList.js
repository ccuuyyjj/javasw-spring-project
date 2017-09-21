/**
 * 
 */
$(document).ready(function(){
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
