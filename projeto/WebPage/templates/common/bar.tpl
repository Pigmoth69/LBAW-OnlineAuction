<body>
    <nav class="navbar navbar-default">
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
                        <a href="../index.php" style="padding:0;">
                            <img src="../images/bidme.png" alt="BidMeLogo" style="width:120px;height:50px;">
                        </a>
                    </li>
                    <li>
                        <form class="navbar-form navbar-left" role="search" id="searchForm">
                            <div class="form-group">
                                <input type="text" id="searchInput" class="form-control" placeholder="Search">
                            </div>
                            <div class="form-group">
                                <select class="selectpicker" data-live-search="true">
                              <option selected="selected">All Categories</option>
                              {foreach $categorias as $categoria}
                              <option>{$categoria.descricao|escape}</option>
                              {/foreach}
                           </select>
                            </div>
                            <button type="submit" class="btn btn-default">Make Search!</button>
                        </form>
                    </li>
                    {if isLoggedIn()}
                    <li>
                        <a href="UserPage.php?idPage={$infos[0].id_utilizador}">{$infos[0].e_mail}</a>
                    </li>
                    {else}
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
                                        <form class="form" method="post" accept-charset="UTF-8" id="login-nav">
                                            <div class="form-group">
                                                <label class="sr-only" for="emailInput">Email address</label>
                                                <input type="email" class="form-control" id="emailInput" placeholder="Email address" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="passwordInput">Password</label>
                                                <input type="password" class="form-control" id="passwordInput" placeholder="Password" required>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-primary btn-block" id="loginButton">Sign in</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="bottom text-center">
                                        New here ? <a href="RegisterPage.php"><b>Join Us</b></a>
                                        <br> Lost your password ? <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseRecover"><b>Recover</b></a>
                                        <div id="collapseRecover" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <input type="email" id="recoverField" placeholder="Write your e-mail here">
                                                <br>
                                                <button type="submit" id="recoverPassword">Recover</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    {/if}
                    <li>
                        <p class="navbar-text">
                            <a data-toggle="modal" href="#inlineHelp"> Help </a> </p>
                    </li>
                    <!-- start log -->
                    {if isLoggedIn()}
                    <li>
                        <a href="../actions/logout.php"><i class="glyphicon glyphicon-off"></i> Logout</a>
                    </li>
                    {/if}
                </ul>
                <!-- Modal -->
                <div id="inlineHelp" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h1 class="modal-title"> Help </h1>
                            </div>
                            <div class="modal-body">
                                <h3> HomePage </h3>
                                <h5> 
                                In this page you may see a list of featured auctions so that you can have an overview over Bidme's available auctions.
                                </h5>
                                <br><br>
                                <img src="../images/bidme.png" alt="BidMeLogo" style="width:60px;height:25px;"> Bidme icon: By clicking in the icon you will be redirected to the homepage.
                                <br><br>
                                <p class="glyphicon glyphicon-search"> </p>
                                Search box: By writing and choosing a category and either pressing enter ou clinking in "Make Search!" button you will get at the homepage a result list based in your search.
                                <br><br>
                                <p class="glyphicon glyphicon-log-in"> </p>
                                Login: If you already have an account you can login by clicking in "Login" and then complete the boxes with your email and password and finalizing by clicking in "Sign in" button.
                                <br><br>
                                <p class="glyphicon glyphicon-plus"> </p>
                                Register: In order to use our service you must have an account. To create one you must click in "Login" and then click in "Join us" so that you will be redirected to register page where you will be asked to fulfil a form with your information.
                                <br><br>
                                <p class="glyphicon glyphicon-filter"> </p>
                                Categories: You may use the quick search options by clicking in one standard category in order to get related results.
                                <br><br> Recover password: If you forgot your password you may recover it by clicking in the "Recover" button. This way you will be asked to enter your email so that will be sent an email with a link to change your login
                                password.

                                <h3> Logged user account </h3>
                                <h5> 
                                This is your personal page where you can check and edit your information, view statistics about you as seller and/or bidder, create new auctions and manage messages.
                                </h5>
                                <br><br>
                                <p class="glyphicon glyphicon-envelope"></p>
                                Messages: By clicking in "Messages" you will be redirected to a page where you can check your inbox, view sent messages and send new ones.
                                <br><br>
                                <p class="glyphicon glyphicon-exclamation-sign"></p>
                                Rules: By clicking in "Rules" you will be redirected to our FAQ (Frequently asked questions) page.
                                <br><br>
                                <p class="glyphicon glyphicon-user"></p>
                                Email: By cliclig in your email you will be redirect to your user account page.
                                <br><br>
                                <p class="glyphicon glyphicon-plus-sign"></p>
                                New Auction: By clicking in "New Auction" you have a form which you must complete in order to create a valid auction.
                                <br><br>
                                <p class="glyphicon glyphicon-pencil"></p>
                                Edit Profile: By clicking in "Edit Profile" button you will have a form where you may change your personal information.

                                <h3> Bidder page </h3>
                                <h5> 
                                This is also the auction page where you are presented with additional information such as title, description, related images, the actual bid, the remaining time to bid, auction rating, seller information, rating and sales and last but not least you may also report the auction.
                                </h5>
                                <br><br>
                                <p class="glyphicon glyphicon-euro"></p>
                                Bid: As long as the auction hasn't been closed yet and you place a bid higher than the actual, by clicking in "Make bid!" you start to bid that same auction.
                                <br><br>
                                <p class="glyphicon glyphicon-star-empty"></p>
                                Rate auction: You may rate the auction by choosing between one and five stars.
                                <br><br>
                                <p class="glyphicon glyphicon-star-empty"></p>
                                Rate seller: You may rate the auction's seller by choosing between one and five stars.
                                <br><br>
                                <p class="glyphicon glyphicon-flag"></p>
                                Report auction: By clicking in "Report Auction" button you send the request to report the auction.


                                <h3> Seller page </h3>

                                <h5> 
                                This is also the auction page from the seller perspective where you are presented with a light version of your personal information and total sales. Relatively to the auction itself you may see the remaining time, the actual bids, related images, title, description and finally the option to cancel de auction.
                                </h5>
                                <br><br>
                                <p class="glyphicon glyphicon-flag"></p>
                                Cancel auction: By clicking in the "Cancel Auction" button you send the request to cancel the auction.
                                <br><br>
                                <p class="glyphicon glyphicon-cog"></p>
                                Edit auction: By clicking in this icon you may edit the auction information.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>