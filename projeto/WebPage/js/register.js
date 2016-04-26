$(document).ready(onReady);

function onReady() {
	$("#password_confirmation").keyup(checkPasswords);
	$("#registo_form").submit(function(event) {
		return checkValidity();
	});
}



function checkPasswords() {
	var password = $("#password").val();
	var password_conf = $("#password_confirmation").val();
	//falta meter aqui a segurança do número mínimo de caracteres
	if (password != password_conf || password.length==0){
		$("#password").css('background-color', '#ff9a9a');
		$("#password_confirmation").css('background-color', '#ff9a9a');
		return false;	
	}
	else {
		$("#password").css('background-color', '#a6f1a6');
		$("#password_confirmation").css('background-color', '#a6f1a6');
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
	
	if ($("#birthdate").val() > today || $("#birthdate").val() < years) {
		$("#birthdate").css('color', 'red');
		$("#birthdate").css('border-color', 'red');
		return false;
	}
	else {
		$("#birthdate").css('color', 'black');
		$("#birthdate").css('border-color', '#ccc');
		return true;
	}
}

function checkEmptyFields() {
	if ($("#first_name").val() == "" || $("#last_name").val() == "" ||
	 $("#birthdate").val() == "" || $("#email").val() == "" || $("#password").val() == "" ||
	  $("#password_confirmation").val() == "") {
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
	makePOST();
	return false;	
}

function makePOST(){

	var first_name = $("#first_name").val();
	var last_name = $("#last_name").val();
	var birthdate =$("#birthdate").val();
	var gender = $('input[name="gender"]:checked').val();
	var country = $('#countryOptions').find(":selected").text();
	var password =$("#password").val();
	var email =$("#email").val();
	$.post(
    '../actions/register.php',
	{
		'functionName': 'register', 
		'first_name': first_name,
		'last_name': last_name,
		'birthdate':birthdate,
		'gender':gender,
		'country':country,
		'password':password,
		'email': email
	},function(data){
		console.log(data);
		var response = data['register'];
			switch(response) {
				case 'user_exists':
					document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> User already exists...</div>";
					//window.location = "RegisterPage.php";
					break;
				case 'success':
					document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Account created successfully!</div>";
					window.location = "../index.php";
					break;
				default:
					//displayError("Error while processing the login...");
					break;
			}
			return true;		
	})
    .fail(function (error) {
		window.location = "RegisterPage.php";
		console.log(error);
        //alert("Error: " + error);
    });
    return false;
}