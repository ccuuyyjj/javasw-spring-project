$(document).ready(function(){

	var dateFormat = "mm/dd/yy",
	  from = $( "#startDate" )
	    .datepicker({
	      defaultDate: "+1w",
	      changeMonth: true,
	      numberOfMonths: 2
	    })
	    .on( "change", function() {
	      to.datepicker( "option", "minDate", getDate( this ) );
	      
	     //체크인날짜를 선택하면 체크아웃날짜가 일시적으로 없어져서 hidden값에 별도로 넣어준다.
	      $("#from").val( $( "#startDate" ).val());
	      var arr = $( "#startDate" ).val().split('/');
	      $( "#startDate" ).val(arr[2]+'.'+arr[0]+'.'+arr[1]);
	      
	      if($( "#to" ).val() != ''){
	    	  arr = $( "#to" ).val().split('/');
			  $( "#endDate" ).val(arr[2]+'.'+arr[0]+'.'+arr[1]);  
	      }
	      
	    }),
	  to = $( "#endDate" ).datepicker({
	    defaultDate: "+1w",
	    changeMonth: true,
	    numberOfMonths: 2
	  })
	  .on( "change", function() {
	    from.datepicker( "option", "maxDate", getDate( this ) );  
	    
	  //체크아웃날짜를 선택하면 체크인날짜가 일시적으로 없어져서 hidden값에 별도로 넣어준다.
	      $("#to").val( $( "#endDate" ).val());
	  
	    var arr = $( "#endDate" ).val().split('/');
	    $( "#endDate" ).val(arr[2]+'.'+arr[0]+'.'+arr[1]);
	      
	      if($( "#from" ).val() != ''){
	    	  arr = $( "#from" ).val().split('/');
		      $( "#startDate" ).val(arr[2]+'.'+arr[0]+'.'+arr[1]);
	      }
	      
	  });
	
	
	
	function getDate( element ) {
	  var date;
	  try {
	    date = $.datepicker.parseDate( dateFormat, element.value );
	  } catch( error ) {
	    date = null;
	  }
	
	  return date;
	}
	
	$("#checkDate").on("click", function(){
	    $("#dateWrap").hide();
	    $("#changDate").show();
	});    
	
	
	$("#personInput").on("blur ", function(){
		if($("#personInput").val() != null && $("#personInput").val() <= 0){
			$("#personInput").val('');
		}
		
	});
	
});	