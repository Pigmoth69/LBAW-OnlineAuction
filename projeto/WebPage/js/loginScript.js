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
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Wrong login..</div>";
				swal("Wrong Login!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'success':
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Login success!</div>";
				swal("Login successfull!");
				window.location = "UserPage.php?idPage=" + data['id'];
				break;
			case 'already_logged':
				//document.getElementById("loginStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Warning!</strong> Already Logged in!</div>";
				swal("Already logged in!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			default:
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Login failed..</div>";
				swal("Login failed!");
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
       // alert("Error: " + error);
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
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Wrong login..</div>";
				swal("The e-mail doesn't exist on our site.");
				break;
			case 'success':
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Login success!</div>";
				swal("Check your e-mail!");
				break;
			case 'error':
				//document.getElementById("loginStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Warning!</strong> Already Logged in!</div>";
				swal("Stop cracking the site");
				break;
			default:
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Login failed..</div>";
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
       // alert("Error: " + error);
    });
	return false;
}