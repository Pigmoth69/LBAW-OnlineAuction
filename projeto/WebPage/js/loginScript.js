$(document).ready(onReady);

function onReady() {
	$("#loginButton").click(function(){login();return false;});
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
				document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Wrong login..</div>";
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case 'success':
				document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Login success!</div>";
				window.location = "UserPage.php";
				break;
			case 'already_logged':
				document.getElementById("loginStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Warning!</strong> Already Logged in!</div>";
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			default:
				document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Login failed..</div>";
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
       // alert("Error: " + error);
    });
	return false;
}