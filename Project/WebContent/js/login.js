var id = document.querySelector('#id');
var pw1 = document.querySelector('#pswd1');

var check_id = true;
var check_pw = true;

id.addEventListener("keyup", checkId);
pw1.addEventListener("keyup", checkPw);

function caps_lock(e) {
	var keyCode = 0;
	var shiftKey = false;
	keyCode = e.keyCode;
	shiftKey = e.shiftKey;
	if (((keyCode >= 65 && keyCode <= 90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
		$(".error_next_box").show();
	} else {
		$(".error_next_box").hide();
	}
}

function checkId() {
    if(id.value === "") {
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
}

function check_login() {
	var check_all = check_id && check_pw;
	console.log("체크 : ", check_all);
	if(check_all === false) {
		alert("아이디와 비밀번호를 입력해주세요.");
		return false;
	} else {
		return true;
	}
}
 