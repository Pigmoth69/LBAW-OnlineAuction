<body>

    <!-- Navigation -->
    <?php
        include 'common/head.php';
        include 'common/bar.php';
    ?>
      
      <div class="container">
        <div class="row">
            <div class="col-md-3">
               <div class="text-center">
                  <p class="lead">André Fagotinho Maia</p>
               </div>
               <div class="thumbnail">
                  <img src="../images/users/maia.jpg" style="width:500px;height:360px" alt="Maia">
               </div>
               <div class="list-group">
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-user"> André Costa Maia</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="fa fa-venus-mars"> Male</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-envelope"> andrefagotinhomaia@gmail.com</p>
                  </a>
                  <a href="#" class="list-group-item">
                     <p class="glyphicon glyphicon-earphone"> 919856475</p>
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
                            <th>Row</th>
                            <th>Name</th>
                            <th>E-mail</th>
                            <th>Cell Phone Number</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="info">
                            <td>1</td>
                            <td>Daniel Reis</td>
                            <td>mock@hotmail.com</td>
                            <td>912345678</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>2</td>
                            <td>Ricardo Mariz</td>
                            <td>mock@gmail.com</td>
                            <td>913456789</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>3</td>
                            <td>João Bernardo</td>
                            <td>mock@live.com.pt</td>
                            <td>912345679</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                        <tr class="info">
                            <td>4</td>
                            <td>José Mendes</td>
                            <td>mock@portugalmail.pt</td>
                            <td>912345677</td>
                            <td><a href="#" class="glyphicon glyphicon-remove"></a></td>
                        </tr>
                    </tbody>
                </table>
        </div>
      </div>
      <?php
        include_once 'common/foot.php';
      ?>
      </body>

</html>