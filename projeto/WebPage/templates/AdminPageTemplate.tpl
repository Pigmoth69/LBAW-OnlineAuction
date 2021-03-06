{include file='common/head.tpl'} {include file='common/bar.tpl'}
<div id="adminStatus"></div>
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
                        <form method="POST" id="editAdmin" action="../api/edit_admin.php" onsubmit="return checkValidityEdit()" enctype="multipart/form-data">
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
                                <label class="radio-inline" for="genderEditMale"><input type="radio" id="genderEditMale" name="genderEdit" value="male" {if $infos[0].genero eq "male"}
                                                                                                                        checked
                                                                                                                        {/if}>Male</label>
                                <label class="radio-inline" for="genderEditFemale"><input type="radio" name="genderEdit" id="genderEditFemale" value="female" {if $infos[0].genero eq "female"}
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
                                <label for="previous_passwordEdit">Previous password: </label>
                                <input type="password" name="previous_passwordEdit" id="previous_passwordEdit" class="form-control input-sm" placeholder="Old Password">
                            </div>
                            <div class="form-group">
                                <label for="passwordEdit">New password: </label>
                                <input type="password" name="passwordEdit" id="passwordEdit" class="form-control input-sm" placeholder="New Password" onChange="checkPasswordsEdit()">
                            </div>
                            <div class="form-group">
                                <label for="password_confirmationEdit">Confirm password: </label>
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
            <p class="lead col-md-8">Moderators</p>
            <div class="container col-md-3">
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modalAdd">Add Moderator</button>

                <!-- Modal -->
                <div class="modal fade" id="modalAdd" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Add Moderator</h4>
                            </div>
                            <div class="modal-body">
                                <div class="panel-body">
                                    <form method="POST" id="registo_mod">
                                        <div class="form-group">
                                            <label for="first_name">First name: </label>
                                            <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
                                        </div>
                                        <div class="form-group">
                                            <label for="last_name">Last name: </label>
                                            <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
                                        </div>
                                        <div class="form-group">
                                            <label for="birthdate">Date of birth: </label>
                                            <input type="date" name="birthdate" id="birthdate" class="form-control input-sm" onChange="checkDate()">
                                        </div>
                                        <div class="form-group">
                                            <label for="genderMale" class="radio-inline"><input type="radio" id="genderMale" name="gender" value="male">Male</label>
                                            <label for="genderFemale" class="radio-inline"><input type="radio" id="genderFemale" name="gender" value="female">Female</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="countryOptions">Country: </label>
                                            <select id="countryOptions" name="country">
                                {foreach $paises as $pais}
                                    <option value="{$pais.nome_pais|escape}">{$pais.nome_pais|escape}</option>
                                {/foreach}
                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">E-mail: </label>
                                            <input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password: </label>
                                            <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password" onChange="checkPasswords()">
                                        </div>
                                        <div class="form-group">
                                            <label for="password_confirmation">Confirm password: </label>
                                            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password" onChange="checkPasswords()">
                                        </div>
                                        <input type="submit" value="Add Moderator" class="btn btn-block" id="registo">
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>E-mail</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $mods as $mod} {$infor = getInfoByID($mod.id_utilizador)}
                    <tr class="info">
                        <td>{$mod.id_utilizador|escape}</td>
                        <td>{$infor[0].nome|escape}</td>
                        <td>{$infor[0].e_mail|escape}</td>
                        <td>
                            <a href="" onclick='deleteMod({$mod.id_utilizador});' class="glyphicon glyphicon-remove"></a>
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>

        </div>
    </div>
</div>

<script src="../js/delete.js"></script>
<script src="../js/register.js"></script>
<script src="../js/edit.js"></script>
{include file='common/foot.tpl'}
</body>

</html>