{include file='common/head.tpl'}
{include file='common/bar.tpl'}

<body>
      <div class="container">
        <div class="row">
            <div class="col-md-3">
               <div class="thumbnail">
                  <img src="{$info_admin[0].imagem_utilizador}" style="width:500px;height:360px" alt="Maia">
               </div>
               <div class="list-group">
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-user"> {$user[0].nome}</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="fa fa-venus-mars"> {$user[0].gender}</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-envelope">{$user[0].e_mail}</p>
                  </a>
               </div>
               <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
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