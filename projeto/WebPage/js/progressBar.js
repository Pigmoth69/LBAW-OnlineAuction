$(document).ready(onReady);

function onReady() {
       var i = 0;

        var counterBack = setInterval(function() {
            i += 2;
            if (i <= 100) {
                $('.progress-bar').css('width', i + '%');
                $('#ProgressStatus').text(i + "%");
            } else {
                clearTimeout(counterBack);
            }
        }, 1000);

        function startTimer(duration, display) {
            var timer = duration,
                minutes, seconds;
            setInterval(function() {
                if (i <= 100) {
                    if (i >= 90 && i <= 94) {
                        $("#AlertStyle").removeClass("panel panel-success").addClass("panel panel-warning");
                        $(".panel-body").css('background-color', '#fdfaee');
                    }
                    minutes = parseInt(timer / 60, 10)
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    display.text(minutes + ":" + seconds);

                    if (--timer < 0) {
                        timer = duration;
                    }
                } else if (i > 100 && i <= 104) {
                    i = 105; //codigo todo trolha mas depois vai ser mudado! ;)
                    $("#AlertStyle").removeClass("panel panel-warning").addClass("panel panel-danger");
                    $(".panel-heading").text("Auction closed!");
                    $(".panel-body").css('background-color', '#f7ebeb');
                    $("#bidAction").css('display', 'none');
                }
            }, 1000);
        }

        jQuery(function($) {
            var fiveMinutes = 49,
                display = $('#time');
            startTimer(fiveMinutes, display);
        });
};
/*
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
};*/