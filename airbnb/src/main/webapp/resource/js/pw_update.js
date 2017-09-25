
$.urlParam = function(name){
    var results = new RegExp("[\?&]" + name + "=([^&#]*)").exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}

var res = $.urlParam("result");

switch(res){
case "pre_pw": alert("이전 비밀번호가 일치하지 않습니다"); location.href="setting";   break;
case "wrong":alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다");	location.href="setting"; break;	
case "success":alert("비밀번호 변경 완료!"); 	location.href="setting"; break;
case "delete":alert("비밀번호가 일치하지 않습니다");location.href="setting"; break;
}

