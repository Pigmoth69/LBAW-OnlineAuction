$(document).ready(onReady);

function onReady() {
        var list = document.getElementsByClassName("timeLeft");
        var i = 0;
        for(i; i < list.length;i++){
            var totalTime = parseInt(list[i].textContent,10),display = list[i];
            totalTime--;
            var temp = getDaysHoursMinutesSeconds(parseInt(list[i].textContent,10));
            list[i].innerHTML = temp[0] +" days "+temp[1] + ":" + temp[2] + ":" + temp[3]+" hours";
            startTimer(totalTime, display);
        }    
};

function startTimer(duration, display) {
        var timer = duration,
            days, hours, minutes, seconds;
        setInterval(function() {
                var res = getDaysHoursMinutesSeconds(timer);
                days = res[0];
                hours = res[1];
                minutes = res[2];
                seconds = res[3];

                display.innerHTML =  days +" days "+hours + ":" + minutes + ":" + seconds+" hours";

                if (--timer < 0) {
                    timer = duration;
                }
        }, 1000);
};

function getDaysHoursMinutesSeconds(time){
    //CONTAS PARA OS DIAS; HORAS; MINUTOS;SEGUNDOS!
    // calculate (and subtract) whole days
    var delta = time;
    var days1 = Math.floor(delta / 86400);
    delta -= days1 * 86400;
    // calculate (and subtract) whole hours
    var hours1 = Math.floor(delta / 3600) % 24;
    delta -= hours1 * 3600;
    // calculate (and subtract) whole minutes
    var minutes1 = Math.floor(delta / 60) % 60;
    delta -= minutes1 * 60;
    // what's left is seconds
    var seconds1 = delta % 60;  // in theory the modulus is not required
    var res = [days1,hours1,minutes1,seconds1];
    //console.log("Days: "+days1+" Hours: "+hours1+" Minutes: "+minutes1+" Seconds: "+seconds1);
    return res;
};

/*if(progressBarDATA['currentSeconds']>progressBarDATA['totalTime']){
       changeLayoutFinish();
    }else{ 
        var i = (progressBarDATA['currentSeconds']*100)/progressBarDATA['totalTime'];//total %
        var increment= 100 / progressBarDATA['totalTime'];

        var firstTime = getDaysHoursMinutesSeconds(parseInt(progressBarDATA['totalTime'],10)-parseInt(progressBarDATA['currentSeconds'],10));
        $('#time').text(firstTime[0] +" days "+firstTime[1] + " hours " + firstTime[2] + " minutes " + firstTime[3]+" seconds");
        progressBarDATA['currentSeconds']++; // para atualizar os segundos logo depois de mostrar!
        $('.progress-bar').css('width', parseInt(i) + '%');
        $('#ProgressStatus').text(parseInt(i) + "%");

        if(i >= 90 && i < 100) 
            changeLayoutAlmostFinished();
        
        jQuery(function($) {
            var counterBack = setInterval(function() {
            i += increment;
                if (i <= 100) {
                    $('.progress-bar').css('width', parseInt(i) + '%');
                    $('#ProgressStatus').text(parseInt(i) + "%");
                } else {
                    clearTimeout(counterBack);
                }
            }, 1000);
            var totalTime = parseInt(progressBarDATA['totalTime'],10)-parseInt(progressBarDATA['currentSeconds'],10),
            display = $('#time');
        startTimer(totalTime, display);
        });
    }


    

function startTimer(duration, display) {
        var timer = duration,
            days, hours, minutes, seconds;
        setInterval(function() {
            if (i < 100) {
                if (i >= 90 && i <= 100) 
                    changeLayoutAlmostFinished();
                
                var res = getDaysHoursMinutesSeconds(timer);
                days = res[0];
                hours = res[1];
                minutes = res[2];
                seconds = res[3];
                
                display.text(days +" days "+hours + " hours " + minutes + " minutes " + seconds+" seconds");

                if (--timer < 0) {
                    timer = duration;
                }
            } else if (i > 100 && i <= 104) {
                i = 105; //codigo todo trolha mas depois vai ser mudado! ;)
                changeLayoutFinish();
            } 
        }, 1000);
    }

    function getDaysHoursMinutesSeconds(time){
    //CONTAS PARA OS DIAS; HORAS; MINUTOS;SEGUNDOS!
    // calculate (and subtract) whole days
    var delta = time;
    var days1 = Math.floor(delta / 86400);
    delta -= days1 * 86400;
    // calculate (and subtract) whole hours
    var hours1 = Math.floor(delta / 3600) % 24;
    delta -= hours1 * 3600;
    // calculate (and subtract) whole minutes
    var minutes1 = Math.floor(delta / 60) % 60;
    delta -= minutes1 * 60;
    // what's left is seconds
    var seconds1 = delta % 60;  // in theory the modulus is not required
    var res = [days1,hours1,minutes1,seconds1];
    //console.log("Days: "+days1+" Hours: "+hours1+" Minutes: "+minutes1+" Seconds: "+seconds1);
    return res;
    }

    function changeLayoutFinish(){
        $("#AlertStyle").removeClass("panel panel-warning").addClass("panel panel-danger");
        $(".panel-heading").text("Auction closed!");
        $(".panel-body").css('background-color', '#f7ebeb');
        $(".progress").css('background-color', '#f7ebeb');
        $("#bidAction").css('display', 'none');
        $('.progress-bar').css('width', 100 + '%');
        $('#ProgressStatus').text(100 + "%");
    }

    function changeLayoutAlmostFinished(){
        $("#AlertStyle ").removeClass("panel panel-success").addClass("panel panel-warning");
        $(".panel-body").css('background-color', '#fdfaee');
        $(".progress").css('background-color', '#fdfaee');
    }*/