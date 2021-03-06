{include file='common/head.tpl'} {include file='common/bar.tpl'}

<div id="moderatorStatus"></div>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="{$infos[0].imagem_utilizador}" style="width:500px;height:360px" alt="Maia">
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <p class="glyphicon glyphicon-user"> {$infos[0].nome|escape}</p>
                </a>
                <a href="#" class="list-group-item">
                    <p class="fa fa-venus-mars">
                        {$infos[0].datanasc|escape}</p>
                </a>
                <a href="#" class="list-group-item">
                    <p class="glyphicon glyphicon-envelope"> {$infos[0].e_mail|escape}</p>
                </a>
                <a href="#editProfile" class="btn btn-primary col-sm-12" data-toggle="modal" data-target="#modalEdit">
                    <i class="glyphicon glyphicon-cog"></i> Edit profile
                </a>
            </div>

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
                        <form method="POST" id="editAdmin" action="../api/edit_mod.php" onsubmit="return checkValidityEdit()" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="first_nameEdit">First Name: </label>
                                <input type="text" name="first_nameEdit" id="first_nameEdit" class="form-control input-sm" value="{$infos[0].nome|rtrim|escape}" placeholder="First Name">
                            </div>
                            <div class="form-group">
                                <label for="last_nameEdit">Last Name: </label>
                                <input type="text" name="last_nameEdit" id="last_nameEdit" class="form-control input-sm" value="{$infos[0].nome|rtrim|escape}" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                <label for="birthdateEdit">Date of Birth: </label>
                                <input type="date" name="birthdateEdit" id="birthdateEdit" class="form-control input-sm" value="{$infos[0].datanasc|escape}" onChange="checkDateEdit()">
                            </div>
                            <div class="form-group">
                                <label for="genderEditMale" class="radio-inline"><input type="radio" id="genderEditMale" name="genderEdit" value="male" {if $infos[0].genero eq "male"}
                                                                                                                        checked
                                                                                                                        {/if}>Male</label>
                                <label for="genderEditFemale" class="radio-inline"><input type="radio" id="genderEditFemale" name="genderEdit" value="female" {if $infos[0].genero eq "female"}
                                                                                                                        checked
                                                                                                                        {/if}>Female</label>
                            </div>
                            <div class="form-group">
                                <label for="emailEdit">E-mail: </label>
                                <input type="email" name="emailEdit" id="emailEdit" class="form-control input-sm" value="{$infos[0].e_mail|rtrim|escape}" placeholder="Email Address">
                            </div>
                            <div class="form-group">
                                <label for="image">Image: </label>
                                <input type="file" id="image" name="image">
                            </div>
                            <div class="form-group">
                                <label for="previous_passwordEdit">Previous Password: </label>
                                <input type="password" name="previous_passwordEdit" id="previous_passwordEdit" class="form-control input-sm" placeholder="Old Password">
                            </div>
                            <div class="form-group">
                                <label for="passwordEdit">New Password: </label>
                                <input type="password" name="passwordEdit" id="passwordEdit" class="form-control input-sm" placeholder="New Password" onChange="checkPasswordsEdit()">
                            </div>
                            <div class="form-group">
                                <label for="password_confirmationEdit">Confirm Password: </label>
                                <input type="password" name="password_confirmationEdit" id="password_confirmationEdit" class="form-control input-sm" placeholder="Confirm New Password" onChange="checkPasswordsEdit()">
                            </div>

                            <input type="submit" value="Edit Admin Profile" id="RegistoEdit" class="btn btn-block">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    </div>
                </div>

            </div>
        </div>

        <div class="col-md-9">
            <div class="bd-example bd-example-tabs" role="tabpanel">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="auctions-tab" data-toggle="tab" href="#auctions" role="tab" aria-controls="auctions" aria-expanded="true">Auctions To Validate</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="auctionsAll-tab" data-toggle="tab" href="#auctionsAll" role="tab" aria-controls="auctionsAll" aria-expanded="false">All auctions</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="users-tab" data-toggle="tab" href="#users" role="tab" aria-controls="users" aria-expanded="false">Users</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div role="tabpanel" class="tab-pane fade active in" id="auctions" aria-labelledby="auctions-tab" aria-expanded="true">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Seller</th>
                                    <th>Validate</th>
                                    <th>Invalidate</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $auctionsToValidate as $auction}
                                <tr class="info">
                                    <td class="text-center">
                                        <a href="ItemPageBidder.php?idPage={$auction.id_leilao}">{$auction.nome_produto|escape}</a>
                                    </td>
                                    <td class="text-center">
                                        <a href="UserPage.php?idPage={$auction.id_utilizador}">{$auction.nome|escape}</a>
                                    </td>
                                    <td class="text-center">
                                        <a href="" onclick="validateAuction('validate', {$auction.id_leilao}); return false" class="glyphicon glyphicon-ok"></a>
                                    </td>
                                    <td class="text-center">
                                        <a href="" onclick="validateAuction('not validate', {$auction.id_leilao}); return false" style="color:red" class="glyphicon glyphicon-remove"></a>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="auctionsAll" aria-labelledby="auctionsAll-tab" aria-expanded="true">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Seller</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Cancel</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $auctions as $auction}
                                <tr class="info">
                                    <td class="text-center">
                                        <a href="ItemPageBidder.php?idPage={$auction.id_leilao}">{$auction.nome_produto|escape}</a>
                                    </td>
                                    <td class="text-center">{$auction.nome|escape}</td>
                                    <td class="text-center">{$status = getStatus($auction.id_leilao)}{$status|escape}</td>
                                    {if isCancelled($auction.id_leilao)}
                                    <td></td>
                                    {else}
                                    <td class="text-center">
                                        <a href="UserPage.php?idPage={$auction.id_utilizador}" onclick="cancelAuctionMod({$auction.id_leilao}); return false" style="color:red" class="glyphicon glyphicon-remove"></a>
                                    </td>
                                    {/if}
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="users" role="tabpanel" aria-labelledby="users-tab" aria-expanded="false">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Unban</th>
                                    <th class="text-center">Ban</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $users as $user}
                                <tr class="info">
                                    <td class="text-center">
                                        <a href="UserPage.php?idPage={$user.id_utilizador}">{$user.nome|escape}</a>
                                    </td>
                                    {if isBanned($user.id_utilizador)}
                                    <td class="text-center">
                                        <a href="" onclick="ban('unbanned', {$user.id_utilizador}); return false" class="fa fa-check" aria-hidden="true"></a>
                                    </td>
                                    <td>
                                    </td>
                                    {else}
                                    <td>
                                    </td>
                                    <td class="text-center">
                                        <a class="fa fa-ban" onclick="setModalUser({$user.id_utilizador})" style="color:red" aria-hidden="true" data-toggle="modal" data-target="#banModal"></a>
                                    </td>
                                    {/if}
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                        <div id="banModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <input type="hidden" name="idToBan" id="idToBan" value="-1">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Ban User</h4>
                                    </div>
                                    <div class="modal-body">
                                        <textarea rows="4" cols="50" name="motive" id="motive" class="form-control input-sm" placeholder="Write here the motive for your report"></textarea>
                                        <br>
                                        <input type="date" name="banDate" id="banDate" class="form-control input-sm">
                                        <br>
                                        <input type="submit" value="Ban User" class="btn btn-primary" id="banUser" onsubmit="ban('banned', -1); return false" onclick="ban('banned', {$user.id_utilizador}); return false">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../js/delete.js"></script>
<script src="../js/register.js"></script>
<script src="../js/edit.js"></script>
<script src="../js/jquery_scripts.js"></script>

{include file='common/foot.tpl'}

</body>

</html>