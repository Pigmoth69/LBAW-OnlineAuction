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
    <link href="css/OnlineAuctionAdminPage.css" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <!-- Navigation -->
   <!-- Navigation -->
      <nav class="navbar navbar-default" role="navigation">
         <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li>
                     <img src="images/bidme.png" alt="BidMeLogo" style="width:120px;height:50px;">
                  </li>
                  <li>
                     <form class="navbar-form navbar-left" role="search" id="cenas">
                        <div class="form-group">
                           <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <div class="form-group">
                           <select class="selectpicker" data-live-search="true" >
                              <option selected="selected">All Categories</option>
                              <option>Antiques</option>
                              <option>Art</option>
                              <option>Baby</option>
                              <option>Books</option>
                              <option>Business &amp; Industrial</option>
                              <option>Cameras &amp; Photo</option>
                              <option>Cell Phones &amp; Accessories</option>
                              <option>Clothing, Shoes &amp; Accessories</option>
                              <option>Coins &amp; Paper Money</option>
                              <option>Collectibles</option>
                              <option>Computers/Tablets &amp; Networking</option>
                              <option>Consumer Electronics</option>
                              <option>Crafts</option>
                              <option>Dolls &amp; Bears</option>
                              <option>DVDs &amp; Movies</option>
                              <option>eBay Motors</option>
                              <option>Entertainment Memorabilia</option>
                              <option>Gift Cards &amp; Coupons</option>
                              <option>Health &amp; Beauty</option>
                              <option>Home &amp; Garden</option>
                              <option>Jewelry &amp; Watches</option>
                              <option>Music</option>
                              <option>Musical Instruments &amp; Gear</option>
                              <option>Pet Supplies</option>
                              <option>Pottery &amp; Glass</option>
                              <option>Real Estate</option>
                              <option>Specialty Services</option>
                              <option>Sporting Goods</option>
                              <option>Sports Mem, Cards &amp; Fan Shop</option>
                              <option>Stamps</option>
                              <option>Tickets &amp; Experiences</option>
                              <option>Toys &amp; Hobbies</option>
                              <option>Travel</option>
                              <option>Video Games &amp; Consoles</option>
                              <option>Everything Else</option>
                           </select>
                        </div>
                        <button type="submit" class="btn btn-default">Make Search!</button>
                     </form>
                  </li>
                  <li>
                     <p class="navbar-text">Already have an account?</p>
                  </li>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                     <b>Login</b> 
                     <span class="caret"></span>
                     </a>
                     <ul id="login-dp" class="dropdown-menu">
                        <li>
                           <div class="row">
                              <div class="col-md-12">
                                 Login via
                                 <div class="social-buttons">
                                    <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
                                    <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
                                 </div>
                                 or
                                 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                       <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
                                    </div>
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputPassword2">Password</label>
                                       <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                                       <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                    </div>
                                    <div class="form-group">
                                       <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                                    </div>
                                    <div class="checkbox">
                                       <label>
                                       <input type="checkbox"> keep me logged-in
                                       </label>
                                    </div>
                                 </form>
                              </div>
                              <div class="bottom text-center">
                                 New here ? <a href="#"><b>Join Us</b></a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container -->
      </nav>
      
      <div class="container">
        <div class="row">
            <div class="col-md-3">
               <div class="text-center">
                  <p class="lead">André Fagotinho Maia</p>
               </div>
               <div class="thumbnail">
                  <img src="images/users/maia.jpg" style="width:500px;height:360px" alt="Maia">
               </div>
               <div class="list-group">
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
               </div>
               <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
            </div>
            <div class="col-md-9">
                <p class="lead">Moderators</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Row</th>
                            <th>Name</th>
                            <th>E-mail</th>
                            <th>Cell Phone Number</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="info">
                            <td>1</td>
                            <td>Daniel Reis</td>
                            <td>mock@hotmail.com</td>
                            <td>912345678</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>2</td>
                            <td>Ricardo Mariz</td>
                            <td>mock@gmail.com</td>
                            <td>913456789</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>3</td>
                            <td>João Bernardo</td>
                            <td>mock@live.com.pt</td>
                            <td>912345679</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>4</td>
                            <td>José Mendes</td>
                            <td>mock@portugalmail.pt</td>
                            <td>912345677</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                    </tbody>
                </table>
        </div>
      </div>
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
      <!-- jQuery -->
      <script src="js/jquery.js"></script>
      <!-- Bootstrap Core JavaScript -->
      <script src="js/bootstrap.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
      <!-- (Optional) Latest compiled and minified JavaScript translation files -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>
      </body>

</html>