$(document).ready(function() {
    var h = 0;
    $(el).each(function(){
        $("ele").css({'height':'auto'});
        if($("ele").outerHeight() > h)
        {
            h = $("ele").outerHeight();
        }
    });
    $(el).each(function(){
        $("ele").css({'height':h});
    });
});