$('document').ready(function() {});

function setModalUser(id) {
    $("#idToBan").val(id);
}

function bid(auction) {
    var amount = $("#AmountInput").val();
    $.post(
        '../api/bid.php', {
            'functionName': 'bid',
            'auction': auction,
            'amount': amount
        },
        function(data) {
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
        }).fail(function(error) {
        alert(error);
    });
    return false;
}

function validateAuction(bool, id) {
    $.post(
        '../api/validate_auction.php', {
            'functionName': 'validateAuction',
            'validate': bool,
            'auction': id

        },
        function(data) {
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
        }).fail(function(error) {
        alert(error);
    });
    return false;
}

function checkBanDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }

    today = yyyy + '/' + mm + '/' + dd;

    if ($("#banDate").val() < today) {
        $("#banDate").css('color', 'red');
        $("#banDate").css('border-color', 'red');
        return false;
    } else {
        $("#banDate").css('color', 'black');
        $("#banDate").css('border-color', '#ccc');
        return true;
    }
}

function auctionsCategory(id) {
    $.get(
        '../actions/auctionsCategory.php', {
            'functionName': 'auctionsCategory',
            'id': id
        },
        function(data) {
            var response = data['auctionsCategory'];
            switch (response) {
                case 'error':
                    var str = "No auctions with category " + data['category'] + ".";
                    swal(str);
                    break;
                case 'success':
                    var str = "Auctions listed by " + data['category'] + ". Homepage updated.";
                    swal(str);
                    window.location = "Home.php";
                    // ver a cena do show more
                    break;
                case 'error on js':
                    swal("Don't crack the site.");
                    break;
                default:
                    //displayError("Error while processing the login...");
                    break;
            }
            return true;
        }).fail(function(error) {
        alert(error);
    });
    return false;
}

function ban(bool, id) {
    var motive;
    var date;
    if (bool == 'banned') {
        motive = $("#motive").val();
        date = $("#banDate").val();
        id = $("#idToBan").val();
    } else {
        motive = "";
        date = "";
    }
    $.post(
        '../api/ban.php', {
            'functionName': 'ban',
            'ban': bool,
            'user': id,
            'motive': motive,
            'date': date
        },
        function(data) {
            var response = data['ban'];
            switch (response) {
                case 'error':
                    swal("Error banning user.");
                    break;
                case 'success':
                    var str = "User was " + data['banned'] + ".";
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
        }).fail(function(error) {
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
        '../api/classificate_auction.php', {
            'functionName': 'classificateAuction',
            'classification': classification,
            'auction': auction
        },
        function(data) {
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
        }).fail(function(error) {
        alert(error);
    });
    return false;
}

function reportUser(id) {
    var motive = $("#motive").val();
    $.post(
            '../api/report_user.php', {
                'functionName': 'report_user',
                'user': id,
                'motive': motive
            },
            function(data) {
                var response = data['report_user'];
                switch (response) {
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
        .fail(function(error) {
            console.log(error);
            //alert("Error: " + error);
        });
    return false;
}

function reportAuction(id) {
    var motive = $("#motive").val();
    $.post(
            '../api/report_auction.php', {
                'functionName': 'report_auction',
                'user': id,
                'motive': motive
            },
            function(data) {
                var response = data['report_auction'];
                switch (response) {
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
        .fail(function(error) {
            console.log(error);
            //alert("Error: " + error);
        });
    return false;
}

function cancelAuction(id) {
    var motive = $("#motive").val();
    $.post(
            '../api/cancel_auction.php', {
                'functionName': 'cancel_auction',
                'user': id,
                'motive': motive
            },
            function(data) {
                var response = data['cancel_auction'];
                switch (response) {
                    case 'error':
                        swal("Couldn't cancel the auction.");
                        break;
                    case 'success':
                        swal("Cancelled the auction. A moderator has received a message, you can check it on your inbox.");
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
        .fail(function(error) {
            console.log(error);
            //alert("Error: " + error);
        });
    return false;
}

function checkValidityAuction() {
    if (!checkDateAuction()) {
        alert("The date has to be superior to the current date");
        return false;
    }
    if (!checkEmptyFieldsAuction()) {
        alert("No empty fields allowed");
        return false;
    }

    $("#valorAuction").val();
    $("#dateAuction").val();
    $("#nameAuction").val();
    $("#descriptionAuction").val();
    $("#categoryAuction").val();
    return true;
}

function checkDateAuction() {

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }

    today = yyyy + '/' + mm + '/' + dd;

    var arr = $("#dateAuction").val().split("-");
    var d = new Date(yyyy, mm, dd, 0, 0, 0, 0);
    var d_t = new Date(arr[0], arr[1], arr[2], 0, 0, 0, 0);

    if (d_t < d) {
        $("#dateAuction").css('color', 'red');
        $("#dateAuction").css('border-color', 'red');
        return false;
    } else {
        $("#dateAuction").css('color', 'black');
        $("#dateAuction").css('border-color', '#ccc');
        return true;
    }
}

function checkEmptyFieldsAuction() {
    if ($("#nameAuction").val() == "" || $("#dateAuction").val() == "" || $("#valorAuction").val() == "") {
        return false;
    } else return true;
}