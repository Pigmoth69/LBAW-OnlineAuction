{include file='common/head.tpl'}
{include file='common/bar.tpl'}

<body>
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
                   <a href="#editProfile" class="btn btn-primary col-sm-12" data-toggle="modal" data-target="#myModal">
                        	<i class="glyphicon glyphicon-cog"></i>
                        	 Edit profile
                    </a>
               </div>
               <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
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
			                            <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password">
			                        </div>
			                        <div class="form-group">
			                            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password">
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
                <p class="lead">Moderators</p>
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
                        {foreach $mods as $mod}
                        {$infor = getInfoByID($mod.id_utilizador)}
                        <tr class="info">
                            <td>{$mod.id_utilizador}</td>
                            <td>{$infor[0].nome}</td>
                            <td>{$infor[0].e_mail}</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
        </div>
      </div>
      </body>
      {include file='common/foot.tpl'}
</html>