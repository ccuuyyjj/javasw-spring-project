$(document).ready(function() {
	var page = $(".w3-main > .w3-container").attr("id");
	var idx = 0;

	switch (page) {
	case "member":
		idx = 0;
		break;
	case "reservations":
		idx = 1;
		break;
	case "sales":
		idx = 2;
		break;
	}

	$("#menulist").children("a").eq(idx).addClass("w3-gray");
});