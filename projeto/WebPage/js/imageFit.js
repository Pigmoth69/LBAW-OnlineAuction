$('.teste img').each(function(i, item) {
	console.log("Estou no: "+i);
    var img_height = $(item).height();
    var div_height = $(item).parent().height();
	var img_width = $(item).width();
    var div_width = $(item).parent().width();
	console.log("   Img heigh: "+img_height);
	console.log("   Div heigh: "+div_height);
	
    if(img_height<div_height){
        //IMAGE IS SHORTER THAN CONTAINER HEIGHT - CENTER IT VERTICALLY
        var newMargin = (div_height-img_height)/2+'px';
        $(item).css({'margin-top': newMargin });
		var newLeftMargin = (div_width - img_width)/2+'px';
		$(item).css({'margin-left': newLeftMargin });
    }else if(img_height>div_height){
        //IMAGE IS GREATER THAN CONTAINER HEIGHT - REDUCE HEIGHT TO CONTAINER MAX - SET WIDTH TO AUTO  
        $(item).css({'width': 'auto', 'height': '100%'});
        //CENTER IT HORIZONT	ALLY
        var newMargin = (div_width-img_width)/2+'px';
        $(item).css({'margin-left': newMargin});
    }
	
	
	
});