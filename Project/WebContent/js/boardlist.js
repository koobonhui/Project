var search = document.querySelector('#search');

var check_search = false;

search.addEventListener("keyup", checksearch);

function checksearch() {
    if(search.value === "") {
    	check_search = false;
    } else {
    	check_search = true;
    }
    console.log("검색어 비었니? : ", check_search);
}

function check() {
	if(check_search === false) {
		alert("검색어를 입력해 주세요.");
		return false;
	} else {
		return true;
	}
}
 