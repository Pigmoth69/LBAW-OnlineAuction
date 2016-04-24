$(document).ready(onReady);

function onReady() {
	console.log("ready1");
	$("#loginButton").click(function(){login();});
	console.log("ready2");
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
				header("Location : " . $_SERVER['HTTP_REFERER']);
				break;
			case 'success':
				window.location = "UserPage.php";
				break;
			default:
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
        alert("Error: " + error);
    });

}