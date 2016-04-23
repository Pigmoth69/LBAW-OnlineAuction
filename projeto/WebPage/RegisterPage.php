<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Online Auction- Where business happens!</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
    <link rel="icon" href="images/bidme.png" />

    <!-- Custom CSS -->
    <link href="css/OnlineAuctionRegisterPage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>

<body>
    <!-- Navigation -->
    <?php
        include 'templates/bar.php';
    ?>
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
                            <input type="date" name="birthdate" id="birthdate" class="form-control input-sm" placeholder="Date Of Birth" onChange="checkDate()">
                        </div>
                        <div class="form-group">
                            <label class="radio-inline"><input type="radio" name="gender" value="male">Male</label>
                            <label class="radio-inline"><input type="radio" name="gender" value="female">Female</label>
                        </div>
                        <div class="form-group">
                            <select id="countryOptions" name="country" label="Country">
                                <?php
                                    include_once 'database/countries.php';
                                    $paises = getAllCountries();
                                    $html = "";
                                    foreach($paises as $pais) {
                                        $html .= "<option value=\"";
                                        $html .= $pais['nome_pais'] . "\">" . $pais['nome_pais'] . "</option>";
                                    }
                                    echo $html;
                                ?>
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

    

    <div class="container">
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; BidMe-OnlineAuction Limited &reg; </p>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.container -->
    <script src="js/register.js"></script>
</body>

</html>