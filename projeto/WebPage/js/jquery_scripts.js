$(document).ready(onReady); 

function bid(auction) {
     var amount = $("#AmountInput").val();
     $.post(
         '../api/bid.php',
         {
            'functionName' : 'bid',
            'auction' : auction,
            'amount' : amount
         },function(data) {
            var response = data['bid'];
            switch (response) {
                case 'error':
                    swal("Error bidding on this auction.");
                    break;
                case 'success':
                    var str = "Auction bidded with " + data['amount'] + ".";
                    swal(str);
                    var str1 = "Current bid: " + data['amount'];
                    $("#sizing-addon1").text(str1);
                    break;
                case 'error on js':
                    swal("Don't crack the site.");
					break;
				default:
					//displayError("Error while processing the login...");
					break;
            }
            return true;
        }).fail(function (error) {
            alert(error);
        });
    return false;
}

function validateAuction(bool, id) {
     var motive = "";
     $.post(
        '../api/validate_auction.php',
        {
            'functionName' : 'validateAuction',
            'validate' : bool,
            'auction' : id
        },function(data) {
            var response = data['validateAuction'];
            switch (response) {
                case 'error':
                    swal("Error validating auction.");
                    break;
                case 'success':
                    var str = "Auction was " + data['validate'] + ".";
                    swal(str);
                    break;
                case 'error on js':
                    swal("Don't crack the site.");
					break;
				default:
					//displayError("Error while processing the login...");
					break;
            }
            return true;
        }).fail(function (error) {
            alert(error);
        });
    return false;
}

function updateRate(id, auction) {
    switch (id) {
        case 1:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star-o fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            classificateAuction(1, auction);
            break;
        case 2:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star-o fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            classificateAuction(2, auction);
            break;
        case 3:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star-o fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            classificateAuction(3, auction);
            break;
        case 4:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star fa-3x');
            $("#5thStar").attr('class', 'fa fa-star-o fa-3x');
            classificateAuction(4, auction);
            break;
        case 5:
            $("#1stStar").attr('class', 'fa fa-star fa-3x');
            $("#2ndStar").attr('class', 'fa fa-star fa-3x');
            $("#3rdStar").attr('class', 'fa fa-star fa-3x');
            $("#4thStar").attr('class', 'fa fa-star fa-3x');
            $("#5thStar").attr('class', 'fa fa-star fa-3x');
            classificateAuction(5, auction);
            break;
        default:
            break;
    }
}

function classificateAuction(classification, auction) {
    $.post(
        '../api/classificate_auction.php',
        {
            'functionName' : 'classificateAuction',
            'classification' : classification,
            'auction' : auction
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
            return true;
        }).fail(function (error) {
            alert(error);
        });
    return false;
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

function reportAuction(id) {
    var motive = $("#motive").val();
	$.post(
    '../api/report_auction.php',
	{
		'functionName': 'report_auction', 
		'user': id,
        'motive': motive
	},function(data){
		var response = data['report_auction'];
			switch(response) {
				case 'error':
                    swal("Couldn't report the auction.");
					break;
				case 'success':
                    swal("Reported the auction. A moderator has received a message, you can check it on your inbox.");
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