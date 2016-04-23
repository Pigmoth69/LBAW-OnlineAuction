<?php
      $path = '../database/categories.php';
      if(!file_exists($path))
            $path = 'database/categories.php';
      try {
            include_once($path);
      }
      catch(PDOException $e) {
            echo $e;
            return -1;
      }
      /*
      $path = '../actions/login.php';
      if(!file_exists($path))
            $path = 'actions/login.php';
      try {
            if (!file_exists($path))
                  include_once($path);
      }
      catch(PDOException $e) {
            echo $e;
            return -1;
      }
      */
?>
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
       <!-- jQuery -->
      <script src="js/jquery.js"></script>
      <!-- Bootstrap Core JavaScript -->
      <script src="js/bootstrap.min.js"></script>
      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
      <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>-->
	  <script src="js/imageFit.js"></script>
        <script src="js/loginScript.js"></script>
      
   </head>
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
                        <a href="index.php">
                              <img src="images/bidme.png" alt="BidMeLogo" style="width:120px;height:50px;">
                              </a>
                  </li>
                  <li>
                     <form class="navbar-form navbar-left" role="search" id="cenas">
                        <div class="form-group">
                           <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <div class="form-group">
                           <select class="selectpicker" data-live-search="true" >
                              <option selected="selected">All Categories</option>
                              
                              <?php
                                    $categorias = getAllCategories();
                                    $html = "";
                                    foreach($categorias as $categoria) {
                                        $html .= "<option>";
                                        $html .= $categoria['descricao'] . "</option>";
                                    }
                                    echo $html;
                              ?>
                           </select>
                        </div>
                        <button type="submit" class="btn btn-default">Make Search!</button>
                     </form>
                  </li>
                  <?php
                        //
                  ?>
                  <!-- start log -->
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
                                 <form class="form" role="form" method="post" accept-charset="UTF-8" id="login-nav">
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                       <input type="email" class="form-control" id="emailInput" placeholder="Email address" required>
                                    </div>
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputPassword2">Password</label>
                                       <input type="password" class="form-control" id="passwordInput" placeholder="Password" required>
                                       <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                    </div>
                                    <div class="form-group" onsubmit="js/loginScript.js">
                                       <button method="post"type="submit" class="btn btn-primary btn-block" id="loginButton">Sign in</button>
                                    </div>
                                    <div class="checkbox">
                                       <label>
                                       <input type="checkbox"> keep me logged-in
                                       </label>
                                    </div>
                                 </form>
                              </div>
                              <div class="bottom text-center">
                                 New here ? <a href="RegisterPage.php"><b>Join Us</b></a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </li>
                  <!-- end log -->
                  <li><a href="#"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container -->
      </nav>