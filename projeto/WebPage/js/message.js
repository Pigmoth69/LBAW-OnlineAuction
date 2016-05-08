$(document).ready(onReady);

function onReady() {
	/*$("#password_confirmation").keyup(checkPasswords);
	$("#registo_form").submit(function(event) {
		return checkValidity();
	});
	$("#registo_mod").submit(function(event) {
		return checkValidityMod();
	});
    */
}

function sendMessage() {
    var e_mail = $("#emailInput").val();
    var title = $("#emailTitle").val();
    var body = $("#messageText").val();
    if (e_mail = "") {
        alert("No empty fields allowed");
        return false;
    }
    sendMessagePOST();
}

function sendMessagePOST(){
	var e_mail = $("#emailInput").val();
    var title = $("#emailTitle").val();
    var body = $("#messageText").val();
	$.post(
    '../api/send_message.php',
	{
		'functionName': 'send_message', 
		'e_mail': e_mail,
        'title': title,
        'body': body
	},function(data){
		console.log(data);
		var response = data['send_message'];
			switch(response) {
				case 'e_mail doesn\'t exist':
					//document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> User already exists...</div>";
					//window.location = "RegisterPage.php";
					break;
				case 'success':
					//document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Account created successfully!</div>";
					window.location = "../index.php";
					break;
				case 'error on js':
					//document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Error!</strong> Stop cracking the site!</div>";
					break;
				default:
					//displayError("Error while processing the login...");
					break;
			}
			return true;		
	})
    .fail(function (error) {
		console.log(error);
        //alert("Error: " + error);
    });
    return false;
}