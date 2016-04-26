{include file='common/head.tpl'}
{include file='common/bar.tpl'}
   <body>
      <!-- Navigation -->
     
      <!-- Main -->
      <div class="container">
         <div class="row">
            <div class="col-md-3">
               <hr>
               <ul class="nav nav-stacked">
               <strong><i class="glyphicon glyphicon-list" id="opt" ></i> Options </strong>
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
                        <a  href="#editProfile" class="btn btn-primary col-sm-3" data-toggle="modal" data-target="#modalEdit">
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
                           <h4> <b> Description </b> </h4>
                           <h5> {$infos.descricao|escape}</h5>
                        </div>
                     </div>
                     <div class="panel-body">
                         
                     </div>
                     <!--/tabs-->
                  </div>

                  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Edit profile</h4>
				        </div>
				        <div class="modal-body">
				           <form method="POST" id="registo_form">
                        <div class="form-group">
                            <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
                        </div>
                        <div class="form-group">
                            <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
                        </div>
                        <div class="form-group">
                            <input type="date" name="birthdate" id="birthdate" class="form-control input-sm" placeholder="Date Of Birth" onChange="checkDate()">
                        </div>
                        <div class="form-group">
                            <label class="radio-inline"><input type="radio" name="gender" value="male">Male</label>
                            <label class="radio-inline"><input type="radio" name="gender" value="female">Female</label>
                        </div>
                        <div class="form-group">
                            <select id="countryOptions" name="country" label="Country">
                                {foreach $paises as $pais}
                                    <option value="{$pais.nome_pais}">{$pais.nome_pais}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password" onChange="checkPasswords()">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password" onChange="checkPasswords()">
                        </div>
                        <input type="submit" value="Register" class="btn btn-block" id="registo" onclick="checkValidity()">		        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
				  
                  <!--/col-->
                  <div class="col-md-6">
                     <div class="row">
                        <div class="panel-heading">
                           <h3>My information</h3>
                        </div>
                        <div class="col-sm-4">
                            <img src="{$infos.imagem_utilizador}" alt="Error" style="width:120px;height:120px">
                        </div>
                        <div class="col-sm-4">
                           <h4> <b> Name </b></h4>
                           <p> {$infos.nome|escape} <p>
                           <h4> <b> Country </b> </h4>
                           <p> {$pais[0].nome_pais|escape}</p>
                           <h4> <b> Birthdate </b> </h4>
                           <p> {$infos.datanasc|escape}<p>
                           <h4> <b> E-mail </b> </h4>
                           <p> {$infos.e_mail|escape}</p>
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
                               {foreach $auctions as $auction}
                                <tr>
                                    <td><b>{$auction.nome_produto|escape}</b></td>
                                    <td> {$no = getNoLiciteesOnAuction($auction.id_leilao)}
                                        {$no} </td>
                                    <td>
                                        {if (isAuctionSold($auction.id_leilao))}
                                            Sold
                                        {else}
                                            Not Sold
                                        {/if}
                                        
                                    </td>
                                </tr>
                               {/foreach}
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
      
      
   </body>
</html>
{include file='common/foot.tpl'}