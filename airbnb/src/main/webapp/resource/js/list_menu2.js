/**
 * 
 */
 /*메뉴 */
      $(document).ready(function(){
          /*메뉴 클릭, 이동 시*/
            $(".b").on("click",function(){
                     $(".b").next().not($(this).next()).css("display","none");
                    $(this).next().toggle('fast');
                }); 
          $("html").on("click",function(){
        	  $(".add_type").css("display","none");
          });
//          /*상단 메뉴 고정*/
//          var menu2 = $(".menu2").offset(); // 변수 선언 
//          $(window).scroll(function(){ //윈도우가 스크롤 될때 함수를 실행
//        	  
//        	  console.log($(document).scrollTop(), menu2.top);
//              if($(document).scrollTop() > menu2.top){ //menu2의 top이 스크롤 top보다 작을 때 실행
//                  $(".menu2").addClass("fixed"); //fixed 클래스 추가
//                  $(".empty-90").css("display","block");
//              }else{
//                  $(".menu2").removeClass("fixed"); 
//                  $(".empty-90").css("display","none");
//              }
//          });
    });
      
//     히스토그램
      function betterParseFloat(x){
      if(isNaN(parseFloat(x)) && x.length > 0)
        return betterParseFloat(x.substr(1));
      return parseFloat(x);
    }
    function usd(x){
      x = betterParseFloat(x);
      if(isNaN(x))
        return "₩0";
      var dollars = Math.floor(x);
//      var cents = Math.round((x - dollars) * 100) + "";
//      if(cents.length==1)cents = "0"+cents;
      return "₩"+dollars;
    }