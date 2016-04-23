$(document).ready(onReady);

function onReady() {
	console.log("ready1");
	$("#loginButton").click(function(){login();});
	console.log("ready2");
};

function login() {
	console.log("login!");
	var username = $('#emailInput').val();
	var password = $('#passwordInput').val();
	
	$.post(
    'actions/login.php',
	{
		"functionName": 'login', 
		"username": username,
		"password": password
	}, 
	function (data) {
		window.location="UserPage.php";	
	})
    .fail(function (error) {
        alert("Error: " + error);
    });

}