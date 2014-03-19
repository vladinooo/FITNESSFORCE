function passwordValidation() {
	$("#password").keyup(checkPasswordsMatch);
	$("#password2").keyup(checkPasswordsMatch);
	$("#create-user-form").submit(canSubmit);
}

function canSubmit() {
	var password = $("#password").val();
	var password2 = $("#password2").val();

	if (password != password2) {
		$(".passwdMatchError").text("Passwords don't match!");
		return false;
	} else {
		return true;
	}
}

function checkPasswordsMatch() {
	var password = $("#password").val();
	var password2 = $("#password2").val();

	if (password.length > 0 || password2.length > 0) {

		if (password != password2) {
			$(".passwdMatchError").text("Passwords don't match!");
		} else {
			$(".passwdMatchError").text("");
		}
	}
}