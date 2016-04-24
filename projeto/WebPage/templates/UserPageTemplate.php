   <body>
      <!-- Navigation -->
     <?php
        include 'common/head.php';
        include 'common/bar.php';
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
                         <?php
                            include_once '../database/auctions.php';
                            $best_auctions = bestAuctions();
                            $html = "<div class=\"col-xs-4 text-center\"><img src=../";
                            $html .= $best_auctions[0]['imagem_produto'];
                            $html .= "class=\"img-circle img-responsive alt=\"Error\">";
                            $html .= "<label>" . $best_auctions[0]['nome_produto'] . "</label></div>";
                            echo $html;
                            
                            $html = "<div class=\"col-xs-4 text-center\"><img src=../";
                            $html .= $best_auctions[1]['imagem_produto'];
                            $html .= "class=\"img-circle img-responsive alt=\"Error\">";
                            $html .= "<label>" . $best_auctions[1]['nome_produto'] . "</label></div>";
                            echo $html;
                            
                            $html = "<div class=\"col-xs-4 text-center\"><img src=../";
                            $html .= $best_auctions[2]['imagem_produto'];
                            $html .= "class=\"img-circle img-responsive alt=\"Error\">";
                            $html .= "<label>" . $best_auctions[2]['nome_produto'] . "</label></div>";
                            echo $html;
                         ?>
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
                                include_once '../database/user.php';
                                session_start();
                                $infos = getInfoByID($_SESSION['user']);
                                $html = "<img src= \"../" . $infos[0]['imagem_utilizador'] . "\" alt= \"" . $infos[0]['imagem_utilizador'] . "\" style=\"width:120px;height:120px;\">";
                                echo $html;
                            ?>
                        </div>
                        <div class="col-sm-4">
                           <h4> <b> Name </b></h4>
                           <p> <?php echo $infos[0]['nome'];?> <p>
                           <h4> <b> Country </b> </h4>
                           <p> <?php
                                include_once '../database/countries.php';
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
                                include_once '../database/auctions.php';
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
      
      <?php
        include_once 'common/foot.php';
      ?>
   </body>
</html>