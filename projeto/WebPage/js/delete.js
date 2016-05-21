$(document).ready(onReady);

function onReady() {
    //$("#deleteMod").click(function(){deleteMod();return false;});
};

function deleteMod($id) {
	$.post(
    '../api/delete_mods.php',
	{
		"functionName": 'deleteMod', 
		"id": $id
	}, 
	function(data) {
		var response = data["deleteMod"];
		switch(response) {
			case "mod deleted":
				//document.getElementById("adminStatus").innerHTML = "<div class=\"alert alert-success\"><strong>Success!</strong> Moderator deleted!</div>";
				swal("Moderator deleted!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
			case "mod not deleted":
				//document.getElementById("adminStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Error!</strong> Moderator not deleted!</div>";
				swal("Moderator not deleted!");
				window.location = "Location : " . $_SERVER['HTTP_REFERER'];
				break;
            case "user not admin":
                //document.getElementById("adminStatus").innerHTML ="<div class=\"alert alert-warning\"><strong>Error!</strong> You are not an administrator!</div>";
				swal("You are not an administrator!");
                break;
			default:
			    //document.getElementById("adminStatus").innerHTML = "<div class=\"alert alert-danger\"><strong>Error!</strong> Fail.</div>";
				swal("Error!");
				//displayError("Error while processing the login...");
				break;
		}
	}).fail(function (error) {
       // alert("Error: " + error);
    });
	return false;
}