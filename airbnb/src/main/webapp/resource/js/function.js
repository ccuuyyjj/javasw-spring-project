//maxlength 체크
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
	}
}
// 숫자 3자리 콤마
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 특정일 선택막기
function enableAllTheseDays(date) {
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	for (i = 0; i < enabledays.length; i++) {
		if ($.inArray(y + '-' + ("00" + (m + 1)).slice(-2) + '-' + d,
				enabledays) != -1) {
			return [ true ];
		}
	}
	return [ false ];
}

$(document).ready(function() {
	// 인원 자릿수 체크
	$(".inputNum").on("blur ", function() {
		if ($(".inputNum").val() != null && $(".inputNum").val() <= 0) {
			$(".inputNum").val(1);
		}

	});

	scrollController();

	// 스크롤을 하는 경우에만 실행됨
	$(window).on('scroll', function() {
		scrollController();
	});

});
// 메인 메뉴의 위치를 제어하는 함수
function scrollController() {
	var menu = $('.menu').offset();
	if (menu != null) {
		currentScrollTop = $(window).scrollTop();
		if (currentScrollTop < 800) {
			$('#header').css('top', -(currentScrollTop));
			$('#menu').css('top', 700 - (currentScrollTop));
			$('#menu').removeClass('menu_top');
			$('#btnFixed').removeClass('btnFixed_top');
			$('#btnFixed').addClass('btnFixed');
			$('#btnFixed').css('top', menu.top);

		} else {
			$("#header").removeClass("w3-top");
			$("#header").removeClass("header-z");
			$('#btnFixed').removeClass('btnFixed');
			$('#menu').addClass('menu_top');
			$('#menu').css("top", "0px");
			$('#btnFixed').addClass('btnFixed_top');
			$('#btnFixed').css("top", "0px");
		}
	}
}
