function toggleEdit(target) {
	console.log(target.tagName);
	console.log(target.className);
	if (target.tagName == "BUTTON" || target.tagName == "A") {
		// var value = $(target).val();
		// $(target).parent().text(value);
	} else if ($(target).find("input[type=text]").length != 0) {
		var value = $(target).find("input[type=text]").val();
		$(target).text(value);
	} else if (target.className == "m_name" || target.className == "m_phone"
			|| target.className == "m_authority") {
		var edit = $("<input>");
		edit.attr("type", "text");
		edit.attr("id", target.className.substring(2));
		edit.css("width", (parseInt($(target).css("width")) - 54));
		edit.val($(target).text());
		$(target).empty();
		$(target).append(edit);
		var submit = $("<button>");
		submit.attr("onclick", "modify(this);");
		submit.text("저장");
		$(target).append(submit);
	} else if (target.className == "m_pwreset") {
		var no = $(target).parent().find(".m_no").text();
		var url = "/airbnb/admin/member/tempPw?no=" + no;
		location.href(url);
	}
}
function modify(target) {
	var no = $(target).parent().parent().find(".m_no").text();
	var type = $(target).parent().find("input[type=text]").attr("id");
	var value = $(target).parent().find("input[type=text]").val();
	var data = "no=" + no + "&" + type + "=" + value;
	$.ajax({
		url : "/airbnb/admin/member/modify",
		type : "post",
		data : data,
		beforeSend : function(xhr) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			if (token != undefined)
				xhr.setRequestHeader(header, token);
		},
		success : function(res) {
			if (res)
				$(target).parent().text(value);
			else
				$(target).parent().find("input[type=text]").css("border-color",
						"red");
		}
	});
}
function tempPw(no) {
	var data = "no=" + no;
	$.ajax({
		url : "/airbnb/admin/member/tempPw",
		type : "post",
		data : data,
		beforeSend : function(xhr) {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			if (token != undefined)
				xhr.setRequestHeader(header, token);
		},
		success : function(res) {
			$(".tempPw").html("<h3>새 비밀번호 : " + res + "</h3>");
			$(".gen").remove();
		}
	});
}
$(document).ready(function() {
	$(".m_row").on("click", function(e) {
		toggleEdit(e.target);
	});
});