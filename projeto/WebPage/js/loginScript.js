$(document).ready(onReady);

function onReady() {
	$("#loginButton").click(function(){login();});
};

function login() {
	var username = $('#emailInput').val();
	var password = $('#passwordInput').val();
	
	$.post(
    '../actions/login.php',
	{
		"functionName": 'login', 
		"username": username,
		"password": password
	}, 
	function(data) {
		var response = data['login'];
		switch(response) {
			case 'wrong_login':
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'success':
				window.location = "UserPage.php";
				break;
			case 'already_logged':
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'wtf':
				window.location ="Location : https://www.facebook.com";
				break;
			default:
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
        alert("Error: " + error);
    });

}