$(document).ready(onReady);

function onReady() {
    //$("#deleteMod").click(function(){deleteMod();return false;});
};

function updateRate(id) {
    switch (id) {
        case 1:
            $("#1stStar").attr('class', 'fa fa-star fa-4x');
            $("#2ndStar").attr('class', 'fa fa-star-o fa-4x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-4x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-4x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-4x');
            break;
        case 2:
            $("#1stStar").attr('class', 'fa fa-star fa-4x');
            $("#2ndStar").attr('class', 'fa fa-star fa-4x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-4x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-4x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-4x');
            break;
        case 3:
            $("#1stStar").attr('class', 'fa fa-star fa-4x');
            $("#2ndStar").attr('class', 'fa fa-star fa-4x');
            $("#3rdStar").attr('class', 'fa fa-star fa-4x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-4x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-4x');
            break;
        case 4:
            $("#1stStar").attr('class', 'fa fa-star fa-4x');
            $("#2ndStar").attr('class', 'fa fa-star fa-4x');
            $("#3rdStar").attr('class', 'fa fa-star fa-4x');
            $("#4thStar").attr('class', 'fa fa-star fa-4x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-4x');
            break;
        case 5:
            $("#1stStar").attr('class', 'fa fa-star fa-4x');
            $("#2ndStar").attr('class', 'fa fa-star fa-4x');
            $("#3rdStar").attr('class', 'fa fa-star fa-4x');
            $("#4thStar").attr('class', 'fa fa-star fa-4x');
            $("#5thStar").attr('class', 'fa fa-star fa-4x');
            break;
        default:
            break;
    }
}

function reportUser(id) {
    var motive = ("#motive").val();
	$.post(
    '../api/report_user.php',
	{
		'functionName': 'report_user', 
		'user': id,
        'motive': motive
	},function(data){
		var response = data['report_user'];
			switch(response) {
				case 'error':
					break;
				case 'success':
					break;
				case 'error on js':
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