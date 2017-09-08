/**
 * 
 */
 /*메뉴 */
      $(document).ready(function(){
          /*메뉴 클릭, 이동 시*/
            $(".b").on("click",function(){
                     $(".b").next().not($(this).next()).hide();
                    $(this).next().toggle('fast');
             }); 
            $("html").on("click",function(a){
            	console.log(a);
            	if(!a.target.classList.contains("b") &&!a.target.classList.contains("slider")  ){
            		$(".slider").hide('fast');
            		
            	}
            });
          
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