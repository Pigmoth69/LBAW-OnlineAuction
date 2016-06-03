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

function sendMessage(mail) {
    var e_mail = $("#emailInput").val();
    var title = $("#emailTitle").val();
    var body = $("#messageText").val();
    if (e_mail = "") {
        swal("No empty fields allowed");
        return false;
    }
    if (e_mail.trim() == mail.trim()) {
        swal("You can't send messages to yourself");
        return false;
    }
    sendMessagePOST();
}

function sendMessagePOST() {
    var e_mail = $("#emailInput").val();
    var title = $("#emailTitle").val();
    var body = $("#messageText").val();
    $.post(
            '../api/send_message.php', {
                'functionName': 'send_message',
                'e_mail': e_mail,
                'title': title,
                'body': body
            },
            function(data) {
                console.log(data);
                var response = data['send_message'];
                switch (response) {
                    case 'e_mail doesn\'t exist':
                        //document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> User already exists...</div>";
                        swal("E'mail doesn't exist!");
                        //window.location = "RegisterPage.php";
                        break;
                    case 'success':
                        //document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Account created successfully!</div>";
                        swal("Message sent!");
                        window.location = "MessagePage .php";
                        break;
                    case 'error on js':
                        swal("Stop cracking the site!");
                        //document.getElementById("registerStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Error!</strong> Stop cracking the site!</div>";
                        break;
                    default:
                        //displayError("Error while processing the login...");
                        break;
                }
                return true;
            })
        .fail(function(error) {
            console.log(error);
            //alert("Error: " + error);
        });
    return false;
}