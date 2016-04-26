$(document).ready(onReady);

function onReady() {
    //$("#deleteMod").click(function(){deleteMod();return false;});
};

function deleteMod($id) {
	console.log("ID :" + $id);
    return;
	$.post(
    '../actions/delete_mods.php',
	{
		"functionName": 'deleteMod', 
		"id": $id
	}, 
	function(data) {
		var response = data['deleteMod'];
		switch(response) {
			case 'success':
				//document.getElementById("loginStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Login success!</div>";
				//window.location = "UserPage.php";
				break;
			case 'error':
				//document.getElementById("loginStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Warning!</strong> Already Logged in!</div>";
				//window.location = "Location : " . $_SERVER['HTTP_REFERER'];
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