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
               <a href="#"><strong><i class="glyphicon glyphicon-list"></i> Options </strong></a>
               <ul class="nav nav-stacked collapse in" id="userMenu">
                  <!-- <li class="active"> <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li> -->
                  <li><a href="#"><i class="glyphicon glyphicon-envelope"></i> Messages <span class="badge badge-info">4</span></a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Options</a></li>
                  <!-- <li><a href="#"><i class="glyphicon glyphicon-comment"></i> Shoutbox</a></li> -->
                  <li><a href="#"><i class="glyphicon glyphicon-user"></i> Staff List</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-flag"></i> Transactions</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-exclamation-sign"></i> Rules</a></li>
                  <li><a href="#"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
               </ul>
               </ul>
            </div>
            <!-- /col-3 -->
            <div class="col-sm-9">
               <div class="bd-example bd-example-tabs" role="tabpanel">
                  <ul class="nav nav-tabs" id="myTab" role="tablist">
                     <li class="nav-item">
                        <a class="nav-link active" id="inbox-tab" data-toggle="tab" href="#inbox" role="tab" aria-controls="inbox" aria-expanded="true">Inbox</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="sent" aria-expanded="false">Sent Messages</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" id="compose-tab" data-toggle="tab" href="#compose" role="tab" aria-controls="composeMessage" aria-expanded="false">Compose Message</a>
                     </li>
                  </ul>
                  <div class="tab-content" id="myTabContent">
                     <div role="tabpanel" class="tab-pane fade active in" id="inbox" aria-labelledby="inbox-tab" aria-expanded="true">
                        <table class="table">
                          <thead>
                              <tr>
                                  <th>Seen</th>
                                  <th>Title</th>
                                  <th>Email</th>
                                  <th>Time</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product Size</td>
                                  <td>mock@hotmail.com</td>
                                  <td>14:34h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>More Info</td>
                                  <td>assaf@hotmail.com</td>
                                  <td>14:30h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Shipping info</td>
                                  <td>agasg@hotmail.com</td>
                                  <td>12:14h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product condition</td>
                                  <td>jnsad8hudh@hotmail.com</td>
                                  <td>10:01h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>My Items</td>
                                  <td>sajf1k3@hotmail.com</td>
                                  <td>09:04h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>(No title)</td>
                                  <td>isgv2@hotmail.com</td>
                                  <td>04:16h</td>
                              </tr>
                          </tbody>
                      </table>
                     </div>
                     <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="sent-tab" aria-expanded="false">
                       <table class="table">
                         <thead>
                              <tr>
                                  <th>Seen</th>
                                  <th>Title</th>
                                  <th>Email</th>
                                  <th>Time</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product Size</td>
                                  <td>mock@hotmail.com</td>
                                  <td>14:34h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>More Info</td>
                                  <td>assaf@hotmail.com</td>
                                  <td>14:30h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Shipping info</td>
                                  <td>agasg@hotmail.com</td>
                                  <td>12:14h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-stop"></span></td>
                                  <td>Product condition</td>
                                  <td>jnsad8hudh@hotmail.com</td>
                                  <td>10:01h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>My Items</td>
                                  <td>sajf1k3@hotmail.com</td>
                                  <td>09:04h</td>
                              </tr>
                              <tr class="info">
                                  <td><span class="glyphicon glyphicon-check"></span></td>
                                  <td>(No title)</td>
                                  <td>isgv2@hotmail.com</td>
                                  <td>04:16h</td>
                              </tr>
                          </tbody>
                      </table>
                     </div>
                     <div class="tab-pane fade" id="compose" role="tabpanel" aria-labelledby="compose-tab" aria-expanded="false">
                        <div class="form-group">
                            <label class="sr-only" for="AmountInput">Email</label>
                            <div class="input-group">
                                <div class="input-group-addon">Email</div>
                                <input type="text" class="form-control" id="emailInput" placeholder="example@example.com">
                                <div class="input-group-addon">Title</div>
                                <input type="text" class="form-control" id="emailTitle" placeholder="Example">
                            </div>
                            <textarea class="form-control" rows="10" id="messageText"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary">Send</button>
                        </div>
                     </div>
                  </div>
               </div>
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
      <!-- script references -->
      <script src="js/scripts.js"></script> 
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