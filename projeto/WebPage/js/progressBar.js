$(document).ready(onReady);

function onReady() {
    var i = 0;
    console.log(progressBarDATA); // all data refering to auction!
    $('#time').text(progressBarDATA['timeLeft']);

    var counterBack = setInterval(function() {
        i += 0.01;
        console.log("oi?..");
        if (i <= 100) {
            $('.progress-bar').css('width', i + '%');
            $('#ProgressStatus').text(i + "%");
        } else {
            clearTimeout(counterBack);
        }
    }, 500);

    function startTimer(duration, display) {
        var timer = duration,
            minutes, seconds;
        setInterval(function() {
            if (i <= 100) {
                if (i >= 90 && i <= 94) {
                    $("#AlertStyle ").removeClass("panel panel-success").addClass("panel panel-warning");
                    $(".panel-body").css('background-color', '#fdfaee');
                }
                hours = parseInt(timer / 3600,10)
                minutes = parseInt(timer / 60, 10)
                seconds = parseInt(timer % 60, 10);

                hours = hours < 10 ? "0" + hours : hours;
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.text(hours + ":" + minutes + ":" + seconds);

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
        var fiveMinutes = parseInt(progressBarDATA['totalTime'],10)-parseInt(progressBarDATA['currentSeconds'],10),
            display = $('#time');
        startTimer(fiveMinutes, display);
    });
};