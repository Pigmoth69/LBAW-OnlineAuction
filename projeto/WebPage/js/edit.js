$(document).ready(onReady);

function onReady() {
	$("#password_confirmationEdit").keyup(checkPasswords);
    /*$("#editAdmin").submit(function(event) {
		return checkValidity();
	});*/
	$("#editUser").click(function(){editUser();return false;});
	$("#editAuction").click(function(){editAuction();return false;});
};

function checkPasswords() {
	var password = $("#passwordEdit").val();
	var password_conf = $("#password_confirmationEdit").val();
	//falta meter aqui a segurança do número mínimo de caracteres
	if (password != password_conf || password.length==0){
		$("#passwordEdit").css('background-color', '#ff9a9a');
		$("#password_confirmationEdit").css('background-color', '#ff9a9a');
		return false;	
	}
	else {
		$("#passwordEdit").css('background-color', '#a6f1a6');
		$("#password_confirmationEdit").css('background-color', '#a6f1a6');
		return true;
	}
}

function checkDate() {
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear() - 18;

	if(dd<10) {
		dd='0'+dd;
	} 

	if(mm<10) {
		mm='0'+mm;
	} 

	today = yyyy+'/'+mm+'/'+dd;
	
	var years = new Date();
	var dd = years.getDate();
	var mm = years.getMonth()+1; //January is 0!
	var yyyy = years.getFullYear() - 150;

	if(dd<10) {
		dd='0'+dd;
	} 

	if(mm<10) {
		mm='0'+mm;
	} 

	years = yyyy+'/'+mm+'/'+dd;
	
	if ($("#birthdateEdit").val() > today || $("#birthdateEdit").val() < years) {
		$("#birthdateEdit").css('color', 'red');
		$("#birthdateEdit").css('border-color', 'red');
		return false;
	}
	else {
		$("#birthdateEdit").css('color', 'black');
		$("#birthdateEdit").css('border-color', '#ccc');
		return true;
	}
}

function checkEmptyFields() {
	if ($("#first_nameEdit").val() == "" || $("#last_nameEdit").val() == "" ||
	 $("#birthdateEdit").val() == "" || $("#emailEdit").val() == "" || $("#passwordEdit").val() == "" ||
	  $("#password_confirmationEdit").val() == "") {
		return false;
	}
	else return true;
}
	
function checkValidity() {
	if (!(checkPasswords())) {
		alert("Passwords don't match.");
		return false;
	}
		
	if (!checkDate()) {
		alert("You have to be 18 years or older.");
		return false;
	}
	if (!checkEmptyFields()) {
		alert("No empty fields allowed");	
		return false;
	}
	//alert("Register successfull!!");
	editAdmin();
	return false;	
}

function editUser() {
    var email = $('#emailInput').val();
	var password = $('#passwordInput').val();
	var birthdate = $('#birthdateInput').val();
	var first_name = $("#first_name").val();
	var last_name = $("#last_name").val();
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
    var email = $('#emailEdit').val();
	var previous_password = $('#previous_passwordEdit').val();
	var password = $('#passwordEdit').val();
	var password_confirmation = $('#password_confirmationEdit').val();
	var gender = $('input[name="genderEdit"]:checked').val();
	var birthdate = $('#birthdateEdit').val();
	var first_name = $("#first_nameEdit").val();
	var last_name = $("#last_nameEdit").val();
    
	$.post(
    '../api/edit_admin.php',
	{
		"functionName": 'editAdmin', 
		"email": email,
		"previous_password": previous_password,
		"password": password,
		"password_confirmation": password_confirmation,
		"gender": gender,
        "birthdate": birthdate,
        "first_name": first_name,
		"last_name": last_name,
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