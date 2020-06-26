var id = document.querySelector('#id');
var pw1 = document.querySelector('#pswd1');
var error = document.querySelectorAll('.error_next_box');

var check_id = true;
var check_pw = true;
var check_caps = true;

id.addEventListener("keyup", checkId);
id.addEventListener("change", checkId);
pw1.addEventListener("keyup", checkPw);

function caps_lock(e) {
	var keyCode = 0;
	var shiftKey = false;
	keyCode = e.keyCode;
	shiftKey = e.shiftKey;
	if (((keyCode >= 65 && keyCode <= 90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
		$(".error_next_box").show();
		var check_caps = false;
	} else {
		$(".error_next_box").hide();
		var check_caps = true;
	}
	console.log("캡스락 : ", check_caps);
}

function checkId() {
	var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        check_id = false;
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
        check_id = false;
    } else {
        check_id = true;
    }
    console.log("아이디 : ", check_id);
}

function checkPw() {
    if(pw1.value === "") {
        check_pw = false;
    } else {
        check_pw = true;
    }
    console.log("비밀번호 : ", check_pw);
    console.log("비번 캡스락 : ", check_caps);
}

function check_login() {
	var check_all = check_id && check_pw;
	console.log("체크 : ", check_all);
	if(check_all === false) {
		alert("아이디와 비밀번호를 확인해주세요.");
		return false;
	} else if(check_caps === false) {
		alert('캡스락을 꺼주세요.')
		return false;
	} else {
		return true;
	}
}
 