$(document).ready(onReady);

function onReady() {
    //$("#deleteMod").click(function(){deleteMod();return false;});
};

function updateRate(id) {
    switch (id) {
        case 1:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star-o fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            break;
        case 2:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            break;
        case 3:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            break;
        case 4:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            break;
        case 5:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star fa-3x');
            $("#5thStar").attr('class', 'fa fa-star fa-3x');
            break;
        default:
            break;
    }
}

function classificateAuction(classification) {
    $.post(
        '../api/classificateAuction.php',
        {
            'functionName' : 'classificateAuction',
            'classification' : classification
        },function(data) {
            var response = data['classificateAuction'];
            switch (response) {
                case 'error':
                    swal("Error classificating auction.");
                    break;
                case 'success':
                    var str = "Auction classificated with " + data['classification'] + " stars.";
                    swal(str);
                    break;
                case 'error on js':
                    swal("Don't crack the site.");
					break;
				default:
					//displayError("Error while processing the login...");
					break;
            }
        }
    )
}

function reportUser(id) {
    var motive = $("#motive").val();
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
                    swal("Couldn't report the user.");
					break;
				case 'success':
                    swal("Reported the user. A moderator has received a message, you can check it on your inbox.");
					break;
				case 'error on js':
                    swal("Don't crack the site.");
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