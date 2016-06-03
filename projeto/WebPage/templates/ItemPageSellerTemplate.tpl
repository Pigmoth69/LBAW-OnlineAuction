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
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" type="text/css" href="../font-awesome/css/font-awesome.min.css" />
    <!-- Custom CSS -->
    <link href="../css/OnlineAuctionItemPageSeller.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- jQuery -->
    <script src="../js/jquery.js"></script>
    <link rel="icon" href="../images/bidme.png" />
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
    <script src="../js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css"/>
    <script src="../js/loginScript.js"></script>
    <script type='text/javascript' src="../js/progressBar.js"></script>
</head>
{include file='common/bar.tpl'}

<body>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="thumbnail">
                    <img src="{$seller.imagem_utilizador}" style="width:500px;height:360px" alt="{$seller.imagem_utilizador}">
                </div>
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <p class="text-center">User rating:</p>
                        <div class="ratings">
                            <p>
                                {for $temp = 1 to $seller.classificacao|ceil}
                                <span class="glyphicon glyphicon-star"></span> {/for} {for $temp = $seller.classificacao|ceil to 4}
                                <span class="glyphicon glyphicon-star-empty"></span> {/for}
                            </p>
                        </div>
                    </a>
                    <a href="UserPage.php?idPage={$seller.id_utilizador}" class="list-group-item">
                        <p class="glyphicon glyphicon-user"> {$seller.nome}</p>
                    </a>
                    <div class="list-group-item">
                        <p class="fa fa-venus-mars"> {if $seller.genero eq 'male'} Male {else} Female {/if}
                        </p>
                    </div>
                    <a href="#" class="list-group-item">
                        <p class="glyphicon glyphicon-envelope"> {$seller.e_mail}</p>
                    </a>
                    <div class="list-group-item">
                        <p>Total sales: {$sales}</p>
                    </div>
                </div>
                <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
            </div>
            <div class="col-md-9">
                <div class="thumbnail">
                    <h4 class="text-center" id="ItemName">{$auction.nome_produto}</h4>
                </div>
                <div class="thumbnail">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data- target="#myCarousel" data-slide-to="0" class="active"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="{$auction.imagem_produto}" alt="{$auction.nome_produto}"></div>
                        </div>
                        <!-- Left and right controls -->
                        <a class=" left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true "></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="caption-full">
                        <!-- <h4 class="pull- right ">92.75€</h4> -->
                        <strong>Item description:</strong><br>
                        <p>{$auction.descricao}</p>
                    </div>
                </div>
                <div class="panel-group" id="auctionStatus">
                    <div class="panel panel-success" id="AlertStyle">
                        <div class="panel-heading">
                            <div class="inline-form">
                                <strong>Alert! </strong>Auction closes in <span id="time"></span>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
								<div class="progress">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                                        <p id="ProgressStatus"></p>
                                        <!-- Auction closes in <span id="time">00:30</span> minutes!-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid" id="auctionInfo">
                    <div class="row">
                        <div id="latestUsers">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i>Latest Bidders: </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="list-group">
                                        {foreach $licitees as $lic}
                                        <a href="UserPage.php?idPage={$lic.id_utilizador}" class="list-group-item">
                                            <!-- MISSING -->
                                            <span class="badge">{$span = getTimeDiffOnLic($lic.id_licitacao)}{$span} ago</span>
                                            <i class="fa fa-fw fa-user"></i> {$lic.nome}
                                        </a>
                                        {/foreach}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
{include file='common/foot.tpl'}

</html>