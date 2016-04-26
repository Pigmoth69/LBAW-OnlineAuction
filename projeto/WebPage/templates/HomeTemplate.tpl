{include file='common/head.tpl'}
{include file='common/bar.tpl'}
<body>

      <!-- Page Content -->
      <div id="loginStatus"></div>
      <div class="container">
      <div class="row">
         <div class="col-md-3">
            <p class="lead">Total items:</p>
            <ul class="list-group">
                <a href="" class="list-group-item"><span class="badge">
              {$total_no = 0}
              {foreach $categorias as $categoria}
                {$no = getNoElementsOfCategory($categoria.id_categoria)}
                {$total_no = $total_no + $no}
              {/foreach}
              {$total_no}</span>All Categories</a>
              {foreach $categorias as $categoria}
                {$no = getNoElementsOfCategory($categoria.id_categoria)}
                {$total_no = $total_no + $no}
                <a href="" class="list-group-item"><span class="badge">{$no}</span>{$categoria.descricao}</a>
              {/foreach}
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
                           <img class="slide-image" src="../images/slider/slider1.jpg" style="width:800px%;height:300px;" alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="../images/slider/slider2.jpg" style="width:800px%;height:300px;" alt="">
                        </div>
                        <div class="item">
                           <img class="slide-image" src="../images/slider/slider3.jpg" style="width:800px%;height:300px;" alt="">
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
                     <img src="../images/auction/auction1.jpg" alt="">
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
                           <h4 class="text-center"> 99.75€</h4>
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
                     <img src="../images/auction/auction2.jpg" alt="">
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
                        <h4 class="text-center"> 20.56€</h4>
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
                     <img src="../images/auction/auction3.jpg" alt="">
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
                        <h4 class="text-center"> 5892.75€</h4>
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
                     <img src="../images/auction/auction4.jpg" alt="">
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
                        <h4 class="text-center"> 5.892.75€</h4>
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
                     <img src="../images/auction/auction5.jpg" alt="">
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
                        <h4 class="text-center"> 25.892.75€</h4>
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
                     <img src="../images/auction/auction6.jpg" alt="">
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
                        <h4 class="text-center"> 0.75€</h4>
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
                     <img src="../images/auction/auction7.jpg" alt="">
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
                        <h4 class="text-center"> 125.892.75€</h4>
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
                     <img src="../images/auction/auction8.jpg" alt="">
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
                        <h4 class="text-center"> 256.56€</h4>
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
                     <img src="../images/auction/auction9.jpg" alt="">
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
                        <h4 class="text-center"> 120.256.56€</h4>
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
                     <img src="../images/auction/auction10.jpg" alt="">
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
                        <h4 class="text-center"> 92.75€</h4>
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
   </body>
   <script src="../js/imageFit.js"></script>
   {include file='common/foot.tpl'}
</html>