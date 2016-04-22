$("#registo_form").submit(function(event) {
	return checkValidity();
});

function checkPasswords() {
	var password = $("#password").val();
	var password_conf = $("#password_confirmation").val();

	if (password != password_conf){
		$("#password").css('color','red');
		$("#password_confirmation").css('color','red');
		return false;	
	}
	else {
		$("#password").css('color','black');
		$("#password_confirmation").css('color','black');
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
	
	console.log("ano: " + $("#birthdate").val());
	
	if ($("#birthdate").val() > today || $("#birthdate").val() < years) {
		$("#birthdate").css('color', 'red');
		return false;
	}
	else {
		$("#birthdate").css('color', 'black');
		return true;
	}
}

function checkEmptyFields() {
	if ($("#first_name").val() == "" || $("#last_name").val() == "" || $("#birthdate").val() == "" || $("#email").val() == "" || $("#password").val() == "" || $("#password_confirmation").val() == "") {
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
	
	return true;	
}