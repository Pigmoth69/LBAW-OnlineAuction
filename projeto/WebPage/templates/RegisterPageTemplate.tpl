{include file='common/head.tpl'} {include file='common/bar.tpl'}

<!-- Page Content -->
<div class="row centered-form">
    <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        <div class="modal-dialog modal-md">
            <div class="panel-heading">
                <h2 class="panel-title" id="sign_title">Sign up</h2>
            </div>
            <div class="panel-body">
                <form method="POST" id="registo_form">
                    <div class="form-group">
                        <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
                    </div>
                    <div class="form-group">
                        <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
                    </div>
                    <div class="form-group">
                        <input type="date" name="birthdate" id="birthdate" class="form-control input-sm" onChange="checkDate()">
                    </div>
                    <div class="form-group">
                        <label class="radio-inline"><input type="radio" name="gender" value="male">Male</label>
                        <label class="radio-inline"><input type="radio" name="gender" value="female">Female</label>
                    </div>
                    <div class="form-group">
                        <select id="countryOptions" name="country">
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
    </div>
</div>
<script src="../js/register.js"></script>
{include file='common/foot.tpl'}
</body>


</html>