function checkPasswords(){
	var password = $("#password").val();
	var password_conf = $("#password_confirmation").val();

	if (password != password_conf){
		$("#password").css('color','red');
		$("#password_confirmation").css('color','red');
			
	}

}