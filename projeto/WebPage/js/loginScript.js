$(document).ready(onReady);

function onReady() {
	$("#loginButton").click(function(){login();return false;});
	$("#recoverPassword").click(function(){recoverPassword();return false;});
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
				swal("Wrong Login!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'success':
				swal("Login successfull!");
				window.location = "UserPage.php?idPage=" + data['id'];
				break;
			case 'already_logged':
				swal("Already logged in!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'banned':
				swal("You are banned from this site.");
				break;
			default:
				swal("Login failed!");
				break;
		}
	}).fail(function (error) {
       alert("Error: " + error);
    });
	return false;
}

function recoverPassword() {
	var e_mail = $('#recoverField').val();
	
	$.post(
    '../api/recover_password.php',
	{
		"functionName": 'login', 
		"e_mail": e_mail
	}, 
	function(data) {
		var response = data['recoverPassword'];
		switch(response) {
			case 'e_mail doesn\'t exist':
				swal("The e-mail doesn't exist on our site.");
				break;
			case 'success':
				swal("Check your e-mail!");
				break;
			case 'error':
				swal("Stop cracking the site");
				break;
			default:
				swal("Error");
				break;
		}
	}).fail(function (error) {
       // alert("Error: " + error);
    });
	return false;
}