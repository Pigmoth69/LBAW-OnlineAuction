{include file='common/head.tpl'} {include file='common/bar.tpl'}

<body>
    <div id="adminStatus"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <img src="{$user[0].imagem_utilizador}" style="width:500px;height:360px" alt="Maia">
                </div>
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <p class="glyphicon glyphicon-user"> {$user[0].nome}</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <p class="fa fa-venus-mars">
                            {$user[0].datanasc}</p>
                    </a>
                    <a href="#" class="list-group-item">
                        <p class="glyphicon glyphicon-envelope"> {$user[0].e_mail}</p>
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
                            <form method="post" action="demoform.asp">
                                <form>
                                    <div class="form-group">
                                        <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="date" name="birthdate" id="birthdate" class="form-control input-sm" placeholder="Date Of Birth">
                                    </div>
                                    <div class="form-group">
                                        <label class="radio-inline"><input type="radio" name="gender">Male</label>
                                        <label class="radio-inline"><input type="radio" name="gender">Female</label>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="previous_password" id="previous_password" class="form-control input-sm" placeholder="Old Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" class="form-control input-sm" placeholder="New Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm New Password">
                                    </div>

                                    <input type="submit" value="Save changes" class="btn btn-block">
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
                                    <option value="{$pais.nome_pais|escape}">{$pais.nome_pais|escape}</option>
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
                                            <input type="submit" value="Register" class="btn btn-block" id="registo" onclick="checkValidity()">
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


</body>
<script src="../js/delete.js"></script>
{include file='common/foot.tpl'}

</html>