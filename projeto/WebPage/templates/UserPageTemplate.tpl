{include file='common/head.tpl'} {include file='common/bar.tpl'}
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
                        <li><a href="MessagePage.php"><i class="glyphicon glyphicon-envelope"></i> Messages</a></li>
                        <!-- <li><a href="#"><i class="glyphicon glyphicon-comment"></i> Shoutbox</a></li> -->
                        <li><a href="#"><i class="glyphicon glyphicon-user"></i> Staff List</a></li>
                        <li><a href="FAQ.php"><i class="glyphicon glyphicon-exclamation-sign"></i> Rules</a></li>
                    </ul>
                </ul>
            </div>
            <!-- /col-3 -->
            <div class="col-sm-9">
                <div class="row">
                    <!-- center left-->
                    <div class="col-md-6">
                        {if $idPage eq $idUser}
                            <hr>
                            <div class="btn-group btn-group-justified">
                                <a href="#" class="btn btn-primary col-sm-3">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    <br> New auction
                                </a>
                                <a href="#editProfile" class="btn btn-primary col-sm-3" data-toggle="modal" data-target="#modalEdit">
                                    <i class="glyphicon glyphicon-cog"></i>
                                    <br> Edit profile
                                </a>
                            </div>
                        {else}
                            {if isLoggedIn()}
                            <div class="btn-group col-md-offset-4">
                                <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#reportModal">
                                    <i class="fa fa-flag fa-2x"></i>
                                    <br> Report User
                                </a>
                            </div>
                            <div id="reportModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Modal content-->
                                    <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Report User</h4>
                                    </div>
                                    <div class="modal-body">
                                        <textarea rows="4" cols="50" name="motive" id="motive" class="form-control input-sm" placeholder="Write here the motive for your report"></textarea>
                                        <br>
                                        <input type="submit" value="Report User" class="btn btn-primary" id="reportUser" onsubmit="reportUser({$idPage})" onclick="reportUser({$idPage})">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            {/if}
                            <!--
                            <hr>
                            <div class="btn-group btn-group-justified">
                                <div class="col-sm-9 rating">
                                    <i class="fa fa-star-o fa-4x" id="1stStar" onclick="updateRate(1)" aria-hidden="true"></i>
                                    <i class="fa fa-star-o fa-4x" id="2ndStar" onclick="updateRate(2)" aria-hidden="true"></i>
                                    <i class="fa fa-star-o fa-4x" id="3rdStar" onclick="updateRate(3)" aria-hidden="true"></i>
                                    <i class="fa fa-star-o fa-4x" id="4thStar" onclick="updateRate(4)" aria-hidden="true"></i>
                                    <i class="fa fa-star-o fa-4x" id="5thStar" onclick="updateRate(5)" aria-hidden="true"></i>
                                </div>
                            </div>
                            -->
                        {/if}
                        <!-- <div class="well">Inbox Messages <span class="badge pull-right">3</span></div> -->
                        <hr>
                        <div class="table-responsive">
                            <h3>Seller</h3>
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
                                        <td><b><a href="ItemPageSeller.php?idPage={$auction.id_leilao}">{$auction.nome_produto|escape}</a></b></td>
                                        <td> {$no = getNoLiciteesOnAuction($auction.id_leilao)} {$no} </td>
                                        <td>
                                            {if (isAuctionSold($auction.id_leilao))} Sold {else} Not Sold {/if}
                                        </td>
                                    </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                        <div class="table-responsive">
                            <h3>Bidder</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Auction</th>
                                        <th>Bid</th>
                                        <th>Highest Bid</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $auctions_seller as $auction_seller}
                                    <tr>
                                        <td><b><a href="ItemPageBidder.php?idPage={$auction.id_leilao}">{$leilao = getAuctionByID($auction_seller.id_leilao)} {$leilao[0].nome_produto|escape}</a></b></td>
                                        <td> {$auction_seller.valor_licitacao} </td>
                                        <td>
                                            {if (isHighestBid($auction_seller.id_leilao, $auction_seller.id_licitacao))} Highest {else} Not Highest {/if}
                                        </td>
                                    </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                        <!--/tabs-->
                    </div>

                    <div class="modal fade" id="modalEdit" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Edit profile</h4>
                                </div>
                                <div class="modal-body">
                                    <form method="POST" id="editUser" action="../api/edit_user.php" onsubmit="return checkValidityEditUser()" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input type="text" name="first_nameEdit" id="first_nameEdit" class="form-control input-sm" value="{$infos.nome|rtrim}" placeholder="First Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="last_nameEdit" id="last_nameEdit" class="form-control input-sm" value="{$infos.nome|rtrim}" placeholder="Last Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="date" name="birthdateEdit" id="birthdateEdit" class="form-control input-sm" value="{$infos.datanasc}" placeholder="Date Of Birth" onChange="checkDateEdit()">
                                        </div>
                                        <div class="form-group">
                                            <label class="radio-inline"><input type="radio" name="genderEdit" value="male" {if $infos.genero eq "male"}
                                                                                                                        checked
                                                                                                                        {/if}>Male</label>
                                            <label class="radio-inline"><input type="radio" name="genderEdit" value="female" {if $infos[0].genero eq "female"}
                                                                                                                        checked
                                                                                                                        {/if}>Female</label>
                                        </div>
                                        <div class="form-group">
                                            <select id="countryOptionsEdit" name="countryEdit" label="Country">
                                {foreach $paises as $pais}
                                    <option value="{$pais.nome_pais}" {if $infos.id_pais eq $pais.id_pais}
                                                                        selected
                                                                        {/if}>{$pais.nome_pais}</option>
                                {/foreach}
                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" name="emailEdit" id="emailEdit" class="form-control input-sm" value="{$infos.e_mail|rtrim}" placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <label for="image">Image: </label>
                                            <input type="file" id="image" name="image">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="previous_passwordEdit" id="previous_passwordEdit" class="form-control input-sm" placeholder="Old Password">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="passwordEdit" id="passwordEdit" class="form-control input-sm" placeholder="Password" onChange="checkPasswordsEdit()">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password_confirmationEdit" id="password_confirmationEdit" class="form-control input-sm" placeholder="Confirm Password" onChange="checkPasswordsEdit()">
                                        </div>
                                        </form>
                                        <textarea rows="4" cols="50" name="descriptionEdit" form="editUser">{$infos.descricao|rtrim}</textarea>
                                        <input type="submit" value="Edit User Profile" class="btn btn-block" form="editUser" id="submitUser">
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        </div>
                                        
                                        
                                </div>

                            </div>
                        </div>
                    </div>

                    <!--/col-->
                    <div class="col-md-6">
                        <div class="panel-heading">
                            <h3>My information</h3>
                        </div>
                        <div class="col-md-4">
                            <img src="{$infos.imagem_utilizador}" alt="Error" style="width:120px;height:120px">
                        </div>
                        <div class="col-md-8">
                            <h4> <b> Name </b></h4>
                            <p> {$infos.nome|escape}
                                <p>
                                    <h4> <b> Country </b> </h4>
                                    <p> {$country.nome_pais|escape}</p>
                                    <h4> <b> Birthdate </b> </h4>
                                    <p> {$infos.datanasc|escape}</p>
                                    <h4> <b> E-mail </b> </h4>
                                    <p> {$infos.e_mail|escape}</p>
                                    <h4> <b> Classification </b> </h4>
                                    <p> {$infos.classificacao|escape}</p>
                                    <h4> <b> Description </b> </h4>
                                    <p> {$infos.descricao|escape}</p>
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
<script src="../js/edit.js"></script>
<script src="../js/jquery_scripts.js"></script>
</html>
{include file='common/foot.tpl'}