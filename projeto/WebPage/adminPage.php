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
    <?php
        include 'templates/bar.php';
    ?>
      
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
      </body>

</html>