<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Online Auction- Where business happens!</title>
      <!-- Bootstrap Core CSS -->
      <link href="../css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom CSS -->
      <link href="../css/OnlineAuctionItemPageSeller.css" rel="stylesheet">
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
      <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- jQuery -->
      <script src="../js/jquery.js"></script>
      <script>
         var i = 0;
         
         var counterBack = setInterval(function(){
           i+=2;
           if(i<=100){
               $('.progress-bar').css('width', i+'%');
               $('#ProgressStatus').text(i +"%");
           } else {
           clearTimeout(counterBack);
           }
         }, 1000);
         
         function startTimer(duration, display) {
         var timer = duration, minutes, seconds;
         setInterval(function () {
        if( i<=100){
            if(i >= 90 && i <=94){
                $("#AlertStyle").removeClass("panel panel-success").addClass("panel panel-warning");
				$("#auctionStatus .panel-body").css('background-color','#fdfaee');}
         minutes = parseInt(timer / 60, 10)
         seconds = parseInt(timer % 60, 10);
         
         minutes = minutes < 10 ? "0" + minutes : minutes;
         seconds = seconds < 10 ? "0" + seconds : seconds;
         
         display.text(minutes + ":" + seconds);
         
         if (--timer < 0) {
           timer = duration;
         }
     }else if(i>100 && i<=104){
        i = 105; //codigo todo trolha mas depois vai ser mudado! ;)
        $("#AlertStyle").removeClass("panel panel-warning").addClass("panel panel-danger");
        $(".panel-heading").text("Auction closed!");
		$("#auctionStatus .panel-body").css('background-color','#f7ebeb');
     }
         }, 1000);
         }
         
         jQuery(function ($) {
         var fiveMinutes = 49,
         display = $('#time');
         startTimer(fiveMinutes, display);
         });
         
      </script>

   </head>
    {include file='common/bar.tpl'}
   <body>
      <!-- Page Content -->
      <div class="container">
         <div class="row">
            <div class="col-md-3">
               <div class="text-center">
                  <p class="lead">André Fagotinho Maia</p>
               </div>
               <div class="thumbnail">
                  <img src="../images/users/maia.jpg" style="width:500px;height:360px" alt="iphone6s">
               </div>
               <div class="list-group">
                  <a href="#" class="list-group-item">
                     <p class="text-center">User rating:</p>
                     <div class="ratings">
                        <p class="pull-right">3 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-user"> André Costa Maia</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="fa fa-venus-mars"> Male</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-envelope"> andrefagotinhomaia@gmail.com</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-earphone"> 919856475</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p>Total sales: 10</p>
                  </a>
               </div>
               <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
            </div>
            <div class="col-md-9">
               <div
                  class="thumbnail">
                  <h4 class="text-center"
                     id="ItemName">iPhone 6s</h4>
               </div>
               <div
                  class="thumbnail">
                  <div id="myCarousel" class="carousel
                     slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-
                           target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                     </ol>
                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox">
                        <div
                           class="item active">                            <img
                           src="../images/ProductsImages/iphone6s-1.jpg" alt="iphone6s"></div>
                        <div class="item">
                           <img src="../images/ProductsImages/iphone6s-2.jpg" alt="iphone6s">
                        </div>
                        <div class="item">
                           <img src="../images/ProductsImages/iphone6s-3.jpg" alt="iphone6s">
                        </div>
                        <div class="item">
                           <img src="../images/ProductsImages/iphone6s-4.jpg" alt="iphone6s">
                        </div>
                     </div>
                     <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                         <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                           <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                           <span class="sr-only">Next</span>
                        </a>                   
                  </div>
                  <div class="caption-full">
                     <!-- <h4 class="pull-
                        right">92.75€</h4> --> 
                    <strong>Item description:</strong><br>                  
                     <p>The iPhone 6S and iPhone 6S Plus (stylized as iPhone 6s and iPhone 6s Plus) are smartphones designed by Apple Inc. The devices are part of the iPhone series and were announced on September 9, 2015, at the Bill Graham Civic Auditorium in San Francisco by Apple Inc. CEO Tim Cook. The iPhone 6S and iPhone 6S Plus jointly serve as successors to the iPhone 6 and iPhone 6 Plus of 2014. The iPhone 6S and iPhone 6S Plus are the performance versions over their respective predecessors, featuring improved hardware specifications, including 3D Touch, a force-sensitive touchscreen; upgraded rear-facing and front-facing cameras; a faster processor; a new chassis made of a stronger 7000 series aluminium alloy;second-generation fingerprint recognition Touch ID; improved LTE and Wi-Fi connectivity; and a new rose gold finish in addition to the space gray, silver, and gold finishes found on the previous models, while maintaining an identical design. The devices ship with iOS 9 preinstalled. As of September 28, 2015, 13 million iPhone 6S and 6S Plus models have been sold, setting a new first-weekend sales record, up from the 10 million iPhone 6 and 6 Plus units sold the previous year.                      
                     </p>
                  </div> 
            </div>
			<div class="panel-group" id="auctionStatus">
					<div class="panel panel-success " id="AlertStyle">
					<div class="panel-heading">
						<div class="inline-form">
							<strong>Alert! </strong>Auction closes in <span id="time">00:50</span> minutes!
						</div>
					</div>
					<div class="panel-body">
					<div class="form-group">
						<div class="progress">
							<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"style="width:0%">
								<p id="ProgressStatus">0</p><!-- Auction closes in <span id="time">00:30</span> minutes!-->
							</div>
						</div>
                        </div>
					</div>
				</div>
               </div>
               <div class="container-fluid" id="auctionInfo">
    <div class="row">
        <div class="col-lg-5">
            <div  id="latestUsers">
      <div class="panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Latest Bidders: </h3>
         </div>
         <div class="panel-body">
            <div class="list-group">
               <a href="#" class="list-group-item">
               <span class="badge">just now</span>
               <i class="fa fa-fw fa-user"></i> Daniel Reis
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">4 minutes ago</span>
               <i class="fa fa-fw fa-user"></i> Ricardo Lopes
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">23 minutes ago</span>
               <i class="fa fa-fw fa-user"></i> Daniel Reis
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">46 minutes ago</span>
               <i class="fa fa-fw fa-user"></i> Ricardo Lopes
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">1 hour ago</span>
               <i class="fa fa-fw fa-user"></i> Daniel Reis
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">2 hours ago</span>
               <i class="fa fa-fw fa-user"></i> João Bernardo
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">yesterday</span>
               <i class="fa fa-fw fa-user"></i> Miguel Botelho
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">two days ago</span>
               <i class="fa fa-fw fa-user"></i> Daniel Reis
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">three days ago</span>
               <i class="fa fa-fw fa-user"></i> Miguel Botelho
               </a>
               <a href="#" class="list-group-item">
               <span class="badge">three days ago</span>
               <i class="fa fa-fw fa-user"></i> João Bernardo
               </a>
            </div>
            <div class="text-right">
               <a href="http://blackrockdigital.github.io/startbootstrap-sb-admin/#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
            </div>
         </div>
      </div>
   </div>
        </div>
        <div class="col-lg-7">
            <div id="biddersTable">
      <div class="panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Transactions Panel</h3>
         </div>
         <div class="panel-body">
            <div class="table-responsive">
               <table class="table table-bordered table-hover table-striped">
                  <thead>
                     <tr>
                        <th>Position</th>
                        <th>User</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>EUR</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <th>Daniel Reis</th>
                        <td>10/21/2013</td>
                        <td>3:29 PM</td>
                        <td>€98.75</td>
                     </tr>
                     <tr>
                        <td>2</td>
                        <th>Ricardo Lopes</th>
                        <td>10/21/2013</td>
                        <td>3:20 PM</td>
                        <td>€90.12</td>
                     </tr>
                     <tr>
                        <td>3</td>
                        <th>João Bernardo</th>
                        <td>10/21/2013</td>
                        <td>3:03 PM</td>
                        <td>€80.99</td>
                     </tr>
                     <tr>
                        <td>4</td>
                        <th>Miguel Botelho</th>
                        <td>10/21/2013</td>
                        <td>3:00 PM</td>
                        <td>€78.29</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                     <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="text-right">
               <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
            </div>
         </div>
      </div>
   </div>
        </div>
    </div>
</div>
         </div>
      </div>
   </body>
   {include file='common/foot.tpl'}
</html>