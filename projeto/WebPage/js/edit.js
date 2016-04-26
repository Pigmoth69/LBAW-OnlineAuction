$(document).ready(onReady);

function onReady() {
    $("#editAdmin").click(function(){editMod();return false;});
	$("#editUser").click(function(){editUser();return false;});
	$("#editAuction").click(function(){editAuction();return false;});
};

function editUser() {
    var email = $('#emailInput').val();
	var password = $('#passwordInput').val();
	var birthdate = $('#birthdateInput').val();
	var name = $('#nameInput').val();
	var description = $('#descriptionInput').val();
    var gender = $('input[name="gender"]:checked').val();
	var country = $('#countryOptions').find(":selected").text();
	var image = $('#imageInput').val();
    
	$.post(
    '../actions/editUser.php',
	{
		"functionName": 'editUser', 
		"email": email,
		"password": password,
        "birthdate": birthdate,
        "name": name,
        "description": description,
        "gender": gender,
        "country": country,
        "image": image
	}, 
	function(data) {
		var response = data['editUser'];
		switch(response) {
            /*
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
                */
		}
	}).fail(function (error) {
       // alert("Error: " + error);
    });
	return false;
}

function editAdmin() {
    var email = $('#emailInput').val();
	var password = $('#passwordInput').val();
	var birthdate = $('#birthdateInput').val();
	var name = $('#nameInput').val();
	var image = $('#imageInput').val();
    
	$.post(
    '../actions/editAdmin.php',
	{
		"functionName": 'editUser', 
		"email": email,
		"password": password,
        "birthdate": birthdate,
        "name": name,
        "image": image,
	}, 
	function(data) {
		var response = data['editAdmin'];
		switch(response) {
			case 'success':
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Login success!</div>";
				window.location = "UserPage.php";
				break;
			case 'error':
				//document.getElementById("loginStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Warning!</strong> Already Logged in!</div>";
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
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