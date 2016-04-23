<?php
    include_once 'database/users.php';
    if(session_id() == '') {
        session_start();
     if (count($_SESSION) === 0) {
         header("Location: index.php");
         exit();
     }
     if (is_admin($_SESSION['user']))
        header("Location: AdminPage.php");
}
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
      <link href="css/OnlineAuctionUserPage.css" rel="stylesheet">
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
      <!-- Main -->
      <div class="container">
         <div class="row">
            <div class="col-md-3">
               <hr>
               <ul class="nav nav-stacked">
               <a href="#"><strong><i class="glyphicon glyphicon-list" id="opt" ></i> Options </strong></a>
               <ul class="nav nav-stacked collapse in" id="userMenu">
                  <!-- <li class="active"> <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li> -->
                  <li><a href="MessagePage.php"><i class="glyphicon glyphicon-envelope"></i> Messages <span class="badge badge-info">4</span></a></li>
                  <!-- <li><a href="#"><i class="glyphicon glyphicon-comment"></i> Shoutbox</a></li> -->
                  <li><a href="#"><i class="glyphicon glyphicon-user"></i> Staff List</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-flag"></i> Transactions</a></li>
                  <li><a href="FAQ.php"><i class="glyphicon glyphicon-exclamation-sign"></i> Rules</a></li>
               </ul>
               </ul>
            </div>
            <!-- /col-3 -->
            <div class="col-sm-9">
               <div class="row">
                  <!-- center left-->
                  <div class="col-md-6">
                     <hr>
                     <div class="btn-group btn-group-justified">
                        <a href="#" class="btn btn-primary col-sm-3">
                        <i class="glyphicon glyphicon-plus"></i>
                        <br> New auction
                        </a>
                        <a href="#" class="btn btn-primary col-sm-3">
                        <i class="glyphicon glyphicon-cog"></i>
                        <br> Edit profile
                        </a>
                        <a href="#" class="btn btn-primary col-sm-3">
                        <i class="glyphicon glyphicon-question-sign"></i>
                        <br> Help
                        </a>
                     </div>
                     <!-- <div class="well">Inbox Messages <span class="badge pull-right">3</span></div> -->
                     <hr>
                     <div class="panel-heading">
                        <div class="panel-title">
                           <h4> <b> Featured auctions </b> </h4>
                        </div>
                     </div>
                     <div class="panel-body">
                        <div class="col-xs-4 text-center"><img src="http://thumbs.buscape.com.br/celular-e-smartphone/smartphone-apple-iphone-5s-16gb-desbloqueado_200x200-PU85fdd_1.jpg" class="img-circle img-responsive" alt="Error">
                        <label> iphone </label>
                        </div>
                        
                        <div class="col-xs-4 text-center"><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSQvtC5fy47I3QvTGmTCf_Ihhpi2mAYw6ZwOfZylFrfc4nu-vxr" class="img-circle img-responsive" alt="Error">

                        <label> ps3 slim </label> </div>
                        <div class="col-xs-4 text-center"><img src="http://i57.tinypic.com/35i6n3o.png" class="img-circle img-responsive" alt="Error"> 
                        <label> pineapple </label> </div>
                     </div>
                     <!--/tabs-->
                  </div>
                  <!--/col-->
                  <div class="col-md-6">
                     <div class="row">
                        <div class="panel-heading">
                           <h3>My information</h3>
                        </div>
                        <div class="col-sm-4">
                            <?php
                                include_once 'database/user.php';
                                session_start();
                                $infos = getInfoByID($_SESSION['user']);
                                $html = "<img src= \"" . $infos[0]['imagem_utilizador'] . "\" alt= \"" . $infos[0]['imagem_utilizador'] . "\" style=\"width:120px;height:120px;\">";
                                echo $html;
                            ?>
                        </div>
                        <div class="col-sm-4">
                           <h4> <b> Name </b></h4>
                           <p> <?php echo $infos[0]['nome'];?> <p>
                           <h4> <b> Country </b> </h4>
                           <p> <?php
                                include_once 'database/countries.php';
                                $pais = getNameCountryByID($infos[0]['id_pais']);
                                echo $pais[0]['nome_pais'];
                                ?>
                           </p>
                           <h4> <b> Birthdate </b> </h4>
                           <p> <?php echo $infos[0]['datanasc'];?> <p>
                        </div>
                     </div>
                     <hr>
                     <div class="table-responsive">
                        <table class="table table-striped">
                           <thead>
                              <tr>
                                 <th>Auction</th>
                                 <th>Participants</th>
                                 <th>State</th>
                              </tr>
                           </thead>
                           <tbody>
                              <?php
                                include_once 'database/auctions.php';
                                $auctions = getAuctionsByUserID($_SESSION['user']);
                                $html = '';
                                foreach($auctions as $auction) {
                                    $no = getNoLiciteesOnAuction($auction['id_leilao']);
                                    $html .= '<tr> <td> <b>';
                                    $html .= $auction['nome_produto'];
                                    $html .= '</b></td><td>';
                                    $html .= $no;
                                    $html .= '</td><td>';
                                    $sold = isAuctionSold($auction['id_leilao']);
                                    if ($sold)
                                        $html .= 'Sold';
                                    else $html .= 'Not sold';
                                    $html .= '</td></tr>';
                                }
                                echo $html;
                              ?>
                           </tbody>
                        </table>
                     </div>
                  </div>
                  <!--/col-span-6-->
               </div>
               <!--/row-->
            </div>
            <!--/col-span-9-->
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
      <!-- /Main -->
      <!-- /.modal -->
   </body>
</html>