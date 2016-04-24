<nav class="navbar navbar-default" role="navigation">
         <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li>
                        <a href="../index.php">
                              <img src="../images/bidme.png" alt="BidMeLogo" style="width:120px;height:50px;">
                              </a>
                  </li>
                  <li>
                     <form class="navbar-form navbar-left" role="search" id="cenas">
                        <div class="form-group">
                           <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <div class="form-group">
                           <select class="selectpicker" data-live-search="true" >
                              <option selected="selected">All Categories</option>
                              {foreach $categorias as $categoria}
                              <option>{$categoria.descricao}</option>
                              {/foreach}
                           </select>
                        </div>
                        <button type="submit" class="btn btn-default">Make Search!</button>
                     </form>
                  </li>
                  <!-- start log -->
                  <!--
                  {if (isLoggedIn())}
                        
                  {elseif}
                      <li>
                     <p class="navbar-text">Already have an account?</p>
                  </li>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                     <b>Login</b> 
                     <span class="caret"></span>
                     </a>
                     <ul id="login-dp" class="dropdown-menu">
                        <li>
                           <div class="row">
                              <div class="col-md-12">
                                 Login via
                                 <form class="form" role="form" method="post" accept-charset="UTF-8" id="login-nav">
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                       <input type="email" class="form-control" id="emailInput" placeholder="Email address" required>
                                    </div>
                                    <div class="form-group">
                                       <label class="sr-only" for="exampleInputPassword2">Password</label>
                                       <input type="password" class="form-control" id="passwordInput" placeholder="Password" required>
                                       <div class="help-block text-right"><a href="">Forget the password ?</a></div>
                                    </div>
                                    <div class="form-group" onsubmit="js/loginScript.js">
                                       <button method="post"type="submit" class="btn btn-primary btn-block" id="loginButton">Sign in</button>
                                    </div>
                                    <div class="checkbox">
                                       <label>
                                       <input type="checkbox"> keep me logged-in
                                       </label>
                                    </div>
                                 </form>
                              </div>
                              <div class="bottom text-center">
                                 New here ? <a href="pages/RegisterPage.php"><b>Join Us</b></a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </li>  
                  {/if}
                  
                  <!-- end log -->
                  <li><a href="../actions/logout.php"><i class="glyphicon glyphicon-off"></i> Logout</a></li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container -->
      </nav>