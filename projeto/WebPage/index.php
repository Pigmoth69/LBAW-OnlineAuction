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
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom CSS -->
      <link href="css/OnlineAuctionHomepage.css" rel="stylesheet">
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
      <link rel="icon" href="images/bidme.png"/>
      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style>
      </style>
   </head>
   <body>
      <!-- Navigation -->
      <?php 
        include 'templates/bar.php';
      ?>

      <!-- Page Content -->
      <div class="container">
      <div class="row">
         <div class="col-md-3">
            <p class="lead">Total items:</p>
            <ul class="list-group">
               <a href="#" class="list-group-item"><span class="badge">2</span>All Categories</a>
               <a href="#" class="list-group-item"><span class="badge">132</span>Antiques</a>
               <a href="#" class="list-group-item"><span class="badge">24</span>Art</a>
               <a href="#" class="list-group-item"><span class="badge">121</span>Baby</a>
               <a href="#" class="list-group-item"><span class="badge">56</span>Books</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Business &amp; Industrial</a>
               <a href="#" class="list-group-item"><span class="badge">45</span>Cameras &amp; Photo</a>
               <a href="#" class="list-group-item"><span class="badge">0</span>Cell Phones &amp; Accessories</a>
               <a href="#" class="list-group-item"><span class="badge">1</span>Clothing, Shoes &amp; Accessories</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Coins &amp; Paper Money</a>
               <a href="#" class="list-group-item"><span class="badge">34</span>Collectibles</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Computers/Tablets &amp; Networking</a>
               <a href="#" class="list-group-item"><span class="badge">0</span>Consumer Electronics</a>
               <a href="#" class="list-group-item"><span class="badge">11</span>Crafts</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Dolls &amp; Bears</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>DVDs &amp; Movies</a>
               <a href="#" class="list-group-item"><span class="badge">98</span>eBay Motors</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Entertainment Memorabilia</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Gift Cards &amp; Coupons</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Health &amp; Beauty</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Home &amp; Garden</a>
               <a href="#" class="list-group-item"><span class="badge">46</span>Jewelry &amp; Watches</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Music</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Musical Instruments &amp; Gear</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Pet Supplies</a>
               <a href="#" class="list-group-item"><span class="badge">12</span>Pottery &amp; Glass</a>
               <a href="#" class="list-group-item"><span class="badge">11</span>Real Estate</a>
               <a href="#" class="list-group-item"><span class="badge">10</span>Specialty Services</a>
               <a href="#" class="list-group-item"><span class="badge">98</span>Sporting Goods</a>
               <a href="#" class="list-group-item"><span class="badge">85</span>Sports Mem, Cards &amp; Fan Shop</a>
               <a href="#" class="list-group-item"><span class="badge">1662</span>Stamps</a>
               <a href="#" class="list-group-item"><span class="badge">122</span>Tickets &amp; Experiences</a>
               <a href="#" class="list-group-item"><span class="badge">324</span>Toys &amp; Hobbies</a>
               <a href="#" class="list-group-item"><span class="badge">2000</span>Travel</a>
               <a href="#" class="list-group-item"><span class="badge">400</span>Video Games &amp; Consoles</a>
               <a href="#" class="list-group-item"><span class="badge">100</span>Everything Else</a>
            </ul>
         </div>
         <div class="col-md-9">
            <div class="row carousel-holder">
               <div class="col-md-12">
                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="item active">
                           <img class="slide-image" src="images/slider/slider1.jpg" style="width:800px%;height:300px;" alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="images/slider/slider2.jpg" style="width:800px%;height:300px;" alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="images/slider/slider3.jpg" style="width:800px%;height:300px;" alt="">
                        </div>
                     </div>
                     <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                     <span class="glyphicon glyphicon-chevron-left"></span>
                     </a>
                     <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                     <span class="glyphicon glyphicon-chevron-right"></span>
                     </a>
                  </div>
               </div>
            </div>
            <!-- Onde começam os artigos para leiloar-->
            <div class="row">
               <!--artigo1 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="form-inline">
                     <div class="thumbnail">
                        <div class="teste">
							<img src="images/auction/auction1.jpg" alt="">
						</div>
                        <div class="caption">
                           <h4 class="text-center"><a href="#">Stone Moai</a></h4>
                           <p>Moais, também conhecidas como Cabeças da Ilha de Páscoa é o nome que designa as mais de 887 estátuas gigantescas de pedra espalhadas pela Ilha de Páscoa, no Chile, construídas por volta de 1200 d.C. a 1500 d.C. pelo povo Rapanui.</p>
                        </div>
                        <div class="ratings">
                           <h5>Seller: <a href="#">Daniel Reis</a></h5>
                           <p class="pull-right">15 reviews</p>
                           <p>
                              <span class="glyphicon glyphicon-star"></span>
                              <span class="glyphicon glyphicon-star"></span>
                              <span class="glyphicon glyphicon-star"></span>
                              <span class="glyphicon glyphicon-star"></span>
                              <span class="glyphicon glyphicon-star"></span>
                           </p>
                        </div>
                        <div class="price_tag">
                           <h4 class="text-center">Current bid: 99.75€</h4>
                           <p class="text-center">Time left:  2h 42min 50s</p>
                           <p class="text-center">Number of bids: 0</p>
                        </div>
                        <div class="text-center" >
                           <div class="form-inline">
                              <a class="btn btn-danger" href="#">More Info</a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!--artigo2 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction2.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Uncharted 4 PS4</a></h4>
                        <p>Uncharted 4: A Thief's End is an upcoming action-adventure third-person shooter platform video game developed by Naughty Dog and 222published by Sony Computer Entertainment for the PlayStation 4 video game console. It is the sequel to Uncharted 3: Drake's Deception, and is the fourth and final installment in the Uncharted series starring Nathan Drake, as well as the last in the series to be developed by Naughty Dog. The game will be released worldwide on May 10, 2016.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Miguel Botelho</a></h5>
                        <p class="pull-right">45 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 20.56€</h4>
                        <p class="text-center">Time left:  19h 14min 10s</p>
                        <p class="text-center">Number of bids: 4</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 3 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction3.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Throne Jewelry</a></h4>
                        <p>Crown jewels is the traditional English term for the elements in metalwork or jewellery of the royal regalia of a particular former or current monarchy state. They are often only used for the coronation of a monarch and a few other ceremonial occasions, though the monarch may also be often shown wearing them in portraits, as they symbolize the power and continuity of the monarchy. Though additions to them may be made, since medieval times the existing items are typically passed down unchanged as they symbolize the continuity of the monarchy.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">João Bernardo</a></h5>
                        <p class="pull-right">2 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 5892.75€</h4>
                        <p class="text-center">Time left:  10h 54min 22s</p>
                        <p class="text-center">Number of bids: 4</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 4 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction4.jpg" alt="">
					</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Ancient Bracelet</a></h4>
                        <p>Incredible 40,000-year-old bracelet believed to be the oldest ever found suggests ancient human race used drills which were just like modern tools</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Ricardo Mariz</a></h5>
                        <p class="pull-right">5 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 5.892.75€</h4>
                        <p class="text-center">Time left:  9h 5min 2s</p>
                        <p class="text-center">Number of bids: 10</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 5 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
					<div class="teste">
							<img src="images/auction/auction5.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">BMW e46</a></h4>
                        <p>The BMW E46 is a compact executive car which was produced by BMW from 1998 to 2007. It was introduced in May 1998 in the sedan body style. In 1999, a coupé and touring body style became available to all markets, and the sedan was released in the United States. A convertible and hatchback body style was released in 2000, the latter only for Europe, South Africa, Australia and New Zealand. The BMW E90 replaced the E46 sedans in late 2004, however the E46 coupe and convertible body styles remained in production until 2007.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Élcio Lopes</a></h5>
                        <p class="pull-right">12 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 25.892.75€</h4>
                        <p class="text-center">Time left:  9h 5min 2s</p>
                        <p class="text-center">Number of bids: 23</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 6 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction6.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Old Bycicle</a></h4>
                        <p>A bicycle, often called a bike or cycle, is a human-powered, pedal-driven, single-track vehicle, having two wheels attached to a frame, one behind the other. A bicycle rider is called a cyclist, or bicyclist.
                           Bicycles were introduced in the 19th century in Europe and as of 2003, more than 1 billion have been produced worldwide, twice as many as the number of automobiles that have been produced.[2] They are the principal means of transportation in many regions. They also provide a popular form of recreation, and have been adapted for use as children's toys, general fitness, military and police applications, courier services, and bicycle racing.
                        </p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Daniel Reis</a></h5>
                        <p class="pull-right">12 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 0.75€</h4>
                        <p class="text-center">Time left:  29h 5min 2s</p>
                        <p class="text-center">Number of bids: 0</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 7 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction7.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Old book</a></h4>
                        <p>Book collecting is the collecting of books, including seeking, locating, acquiring, organizing, cataloging, displaying, storing, and maintaining whatever books are of interest to a given individual collector. The love of books is bibliophilia, and someone who loves to read, admire, and collect books is a bibliophile.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Élcio Lopes</a></h5>
                        <p class="pull-right">12 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 125.892.75€</h4>
                        <p class="text-center">Time left:  5h 52min 2s</p>
                        <p class="text-center">Number of bids: 100</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 8 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction8.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">CR7 Train ball</a></h4>
                        <p>Book collecting is the collecting of books, including seeking, locating, acquiring, organizing, cataloging, displaying, storing, and maintaining whatever books are of interest to a given individual collector. The love of books is bibliophilia, and someone who loves to read, admire, and collect books is a bibliophile.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Miguel Botelho</a></h5>
                        <p class="pull-right">45 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 256.56€</h4>
                        <p class="text-center">Time left:  10h 14min 10s</p>
                        <p class="text-center">Number of bids: 10</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 9 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction9.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">Princess Cathlyn dress</a></h4>
                        <p>Barbie in the 12 Dancing Princesses is a direct-to-video computer animated Barbie film directed by Greg Richardson and loosely based on the fairytale "The Twelve Dancing Princesses".[1] It is part of the Barbie film series and features the voice of Kelly Sheridan as Barbie. This film was released on February 21, 2006.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Miguel Botelho</a></h5>
                        <p class="pull-right">45 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 120.256.56€</h4>
                        <p class="text-center">Time left:  11h 25min 10s</p>
                        <p class="text-center">Number of bids: 1025</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- artigo 10 -->
               <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                     <div class="teste">
							<img src="images/auction/auction10.jpg" alt="">
						</div>
                     <div class="caption">
                        <h4 class="text-center"><a href="#">iPhone 6s</a></h4>
                        <p>The BMW E46 is a compact executive car which was produced by BMW from 1998 to 2007. It was introduced in May 1998 in the sedan body style. In 1999, a coupé and touring body style became available to all markets, and the sedan was released in the United States. A convertible and hatchback body style was released in 2000, the latter only for Europe, South Africa, Australia and New Zealand. The BMW E90 replaced the E46 sedans in late 2004, however the E46 coupe and convertible body styles remained in production until 2007.</p>
                     </div>
                     <div class="ratings">
                        <h5>Seller: <a href="#">Élcio Lopes</a></h5>
                        <p class="pull-right">12 reviews</p>
                        <p>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star"></span>
                           <span class="glyphicon glyphicon-star-empty"></span>
                        </p>
                     </div>
                     <div class="price_tag">
                        <h4 class="text-center">Current bid: 92.75€</h4>
                        <p class="text-center">Time left:  39h 5min 2s</p>
                        <p class="text-center">Number of bids: 23</p>
                     </div>
                     <div class="text-center" >
                        <div class="form-inline">
                           <a class="btn btn-danger" href="#">More Info</a>
                        </div>
                     </div>
                  </div>
               </div>
               <!--<div class="col-sm-4 col-lg-4 col-md-4">
                  <h4><a href="#">Like this template?</a>
                  </h4>
                  <p>If you like this template, then check out <a target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this tutorial</a> on how to build a working review system for your online store!</p>
                  <a class="btn btn-primary" target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View Tutorial</a>
                  </div>-->
                  
                  </div>
            </div>
         </div>
      </div>
      <!-- /.container -->
      <div class="container">
         <hr>
         <!-- Footer -->
         <footer>
            <div class="row">
               <div class="col-lg-12">
                  <p>Copyright &copy; BidMe-OnlineAuction Limited &reg; </p>
               </div>
            </div>
         </footer>
      </div>
      <!-- /.container -->
      <!-- jQuery -->
      <script src="js/jquery.js"></script>
      <!-- Bootstrap Core JavaScript -->
      <script src="js/bootstrap.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
      <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>-->
	  <script src="js/imageFit.js"></script>
   </body>
</html>