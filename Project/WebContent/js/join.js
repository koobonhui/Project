var id = document.querySelector('#id');

var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name');

var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');

var gender = document.querySelector('#gender');

var email = document.querySelector('#email');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');

var check_id = false;
var check_pw = false;
var check_pw2 = false;
var check_name = false;
var chaek_birth = false;
var check_gender = false;
var check_phone = false;

/*이벤트 핸들러 연결*/

// -------- 아이디 양식 확인 -----------
//id.addEventListener("keyup", checkId);
//id.addEventListener("focus", checkId);
id.addEventListener("change", checkId);
// -------- 아이디 중복 확인 -----------
//id.addEventListener("blur", overlap);
id.addEventListener("blur", checkId);
// -------- 비번 양식 확인 -----------
pw1.addEventListener("keyup", checkPw);
pw1.addEventListener("keydown", checkPw);
pw1.addEventListener("change", checkPw);
pw1.addEventListener("focus", checkPw);
pw2.addEventListener("keyup", comparePw);
pw2.addEventListener("change", comparePw);
pw2.addEventListener("focus", comparePw);
// -------- 이름 양식 확인 -----------
userName.addEventListener("keyup", checkName);
userName.addEventListener("change", checkName);
userName.addEventListener("focus", checkName);
// -------- 생년월일 양식 확인 -----------
yy.addEventListener("keydown", isBirthCompleted);
yy.addEventListener("change", isBirthCompleted);
mm.addEventListener("keyup", isBirthCompleted);
mm.addEventListener("click", isBirthCompleted);
mm.addEventListener("change", isBirthCompleted);
dd.addEventListener("change", isBirthCompleted);
dd.addEventListener("keyup", isBirthCompleted);
// -------- 성별 양식 확인 -----------
gender.addEventListener("click",checkgender);
gender.addEventListener("change",checkgender);
// -------- 휴대폰 양식 확인 -----------
mobile.addEventListener("keyup", checkPhoneNum);
mobile.addEventListener("change", checkPhoneNum);
mobile.addEventListener("focus", checkPhoneNum);

/*콜백 함수*/
function checkgender() {
	 if(gender.value === "성별") {
	        error[5].style.display = "block";
	        check_gender = false;
	    } else {
	        error[5].style.display = "none";
	        check_gender = true;
	    }
	    console.log("성별 : ", check_gender);
}

function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.color = "red";
        error[0].style.display = "block";
        check_id = false;
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.color = "red";
        error[0].style.display = "block";
        check_id = false;
    } else {
    	error[0].innerHTML = "";
    	overlap();
    }
    
    console.log("아이디 : ", check_id);
}

function overlap() {		// 아이디 중복 확인
	var check = id.value;
//	if(id.value === "") {
//        error[0].innerHTML = "필수 정보입니다.";
//        error[0].style.color = "red";
//        error[0].style.display = "block";
//        check_id = false;
//	} else {
		$.ajax({
			type : "POST",
		    url : "memberoverlapaction.do",
		    data : {"check" : check},
		    success : function(result) {
		    	if(result.trim() == "true") {
		    		error[0].innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
		            error[0].style.color = "red";
		            error[0].style.display = "block";
		            check_id = false;
		    	} else {
		    		error[0].innerHTML = "멋진 아이디네요!";
		            error[0].style.color = "#08A600";
		            error[0].style.display = "block";
		            check_id = true;
		    	}
		    }
		})
//	}
	console.log("아이디중복 : ", check_id);
}

function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        pwMsg.style.display = "block";
        pwImg1.src = "video/m_icon_pass.png";
        error[1].style.display = "block";
        check_pw = false;
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.style.color = "red";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        
        pwMsg.style.display = "block";
        pwImg1.src = "video/m_icon_not_use.png";
        check_pw = false;
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "video/m_icon_safe.png";
        check_pw = true;
    }
    console.log("비밀번호 : ", check_pw);
}

function comparePw() {
    if(pw2.value === pw1.value && !(pw2.value === "" && pw1.value === "")) {
        pwImg2.src = "video/m_icon_check_enable.png";
        error[2].style.display = "none";
        check_pw2 = true;
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "video/m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
        check_pw2 = false;
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
        check_pw2 = false;
    }
    console.log("비밀번호 확인 : ", check_pw2);
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
        check_name = false;
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
        check_name = false;
    } else {
        error[3].style.display = "none";
        check_name = true;
    }
    console.log("이름 : ", check_name);
}

function isBirthCompleted() {
    var yearPattern = /[0-9]{4}/;

    if(!yearPattern.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        error[4].style.display = "block";
        check_birth = false;
    } else {
    	check_birth = true;
        isMonthSelected();
    }


    function isMonthSelected() {
        if(mm.value === "월") {
            error[4].innerHTML = "태어난 월을 선택하세요.";
        	check_birth = false;
        } else {
        	check_birth = true;
            isDateCompleted();
        }
    }

    function isDateCompleted() {
        if(dd.value === "") {
            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
        	check_birth = false;
        } else {
        	check_birth = true;
            isBirthRight();
        }
    }
}

function isBirthRight() {
    var datePattern = /\d{1,2}/;
    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
    	check_birth = false;
    } else {
    	check_birth = true;
        checkAge();
    }
}

function checkAge() {
	error[4].style.display = "none";
	check_birth = true;
	console.log("생년월일 : ", check_birth);
}

function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

    if(mobile.value === "") {
        error[6].innerHTML = "필수 정보입니다.";
        error[6].style.display = "block";
        check_phone = false;
    } else if(!isPhoneNum.test(mobile.value)) {
        error[6].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[6].style.display = "block";
        check_phone = false;
    } else {
        error[6].style.display = "none";
        check_phone = true;
    }
    console.log("휴대폰 : ", check_phone);
}

function check_join() {
	var check_all = check_id && check_pw && check_pw2 && check_name && check_birth && check_gender && check_phone;
	console.log("체크 : ", check_all);
	if(check_all === false) {
		alert("회원가입 양식을 확인해주세요.");
		return false;
	} else {
		return true;
	}
}