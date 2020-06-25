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
 