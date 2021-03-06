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
    <link href="../css/OnlineAuctionItemPageBidder.css" rel="stylesheet">
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
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css">
    <script src="../js/loginScript.js"></script>
    <script src="../js/progressBar.js"></script>

</head>
{include file='common/bar.tpl'}

<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="{$seller.imagem_utilizador|escape}" style="width:500px;height:360px" alt="{$seller.nome|escape}">
            </div>
            <div class="list-group">
                <div class="list-group-item">
                    <p class="text-center">User rating:</p>
                    <div class="ratings text-center">
                        <p>
                            {for $temp = 1 to $seller.classificacao|ceil}
                            <span class="glyphicon glyphicon-star text-center"></span> {/for} {for $temp = $seller.classificacao|ceil to 4}
                            <span class="glyphicon glyphicon-star-empty text-center"></span> {/for}
                        </p>
                    </div>
                </div>
                {if !isMod($infos[0].id_utilizador)}
                <div class="list-group-item">
                    <p class="text-center">Rate the auction</p>
                    <div class="ratings text-center">
                        <p>
                            <i class="fa fa-star-o fa-3x" id="1stStar" onclick="updateRate(1, {$auction.id_leilao})" aria-hidden="true"></i>
                            <i class="fa fa-star-o fa-3x" id="2ndStar" onclick="updateRate(2, {$auction.id_leilao})" aria-hidden="true"></i>
                            <i class="fa fa-star-o fa-3x" id="3rdStar" onclick="updateRate(3, {$auction.id_leilao})" aria-hidden="true"></i>
                            <i class="fa fa-star-o fa-3x" id="4thStar" onclick="updateRate(4, {$auction.id_leilao})" aria-hidden="true"></i>
                            <i class="fa fa-star-o fa-3x" id="5thStar" onclick="updateRate(5, {$auction.id_leilao})" aria-hidden="true"></i>
                        </p>
                    </div>
                </div>
                {/if}
                <a href="UserPage.php?idPage={$seller.id_utilizador}" class="list-group-item">
                    <p class="glyphicon glyphicon-user"> {$seller.nome|escape}</p>
                </a>
                <div class="list-group-item">
                    <p class="fa fa-venus-mars"> {if $seller.genero eq 'male'} Male {else} Female {/if}
                    </p>
                </div>
                <a href="MessagePage.php" class="list-group-item">
                    <p class="glyphicon glyphicon-envelope"> {$seller.e_mail|escape}</p>
                </a>
                <div class="list-group-item">
                    <p>Total sales: {$sales}</p>
                </div>
            </div>
            {if !isMod($infos[0].id_utilizador)}
            <div class="btn center-block">
                <a href="#" class="btn btn-danger text-center" data-toggle="modal" data-target="#reportModal">
                    <i class="fa fa-flag fa-2x"></i>
                    <br> Report Auction
                </a>
            </div>
            <div id="reportModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Report Auction</h4>
                        </div>
                        <div class="modal-body">
                            <textarea rows="4" cols="50" name="motive" id="motive" class="form-control input-sm" placeholder="Write here the motive for your report"></textarea>
                            <br>
                            <input type="submit" value="Report Auction" class="btn btn-primary" id="reportAuction" onsubmit="reportAuction({$idPage})" onclick="reportAuction({$idPage})">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            {/if}
        </div>
        <div class="col-md-9">
            <div class="thumbnail">
                <h4 class="text-center" id="ItemName">{$auction.nome_produto|escape}</h4>
            </div>
            <div class="thumbnail">
                <div id="myCarousel" class="carousel
                     slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data- target="#myCarousel" data-slide-to="0" class="active"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active"> <img src="{$auction.imagem_produto|escape}" alt="{$auction.nome_produto|escape}"></div>
                    </div>
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="caption-full">
                    <!-- <h4 class="pull-
                        right">92.75€</h4> -->
                    <strong>Item description:</strong><br>
                    <p>{$auction.descricao|escape}</p>
                </div>
            </div>
            {if !isClosed($auction.id_leilao)}
            <div class="panel-group">
                <div class="panel panel-success" id="AlertStyle">
                    <div class="panel-heading">
                        <div class="inline-form">
                            <strong>Alert! </strong>Auction closes in <span id="time"></span> minutes!
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
                            <!-- Código para fazer as bids-->
                            {if $auction.estado_leilao == 'aberto' && !isMod($infos[0].id_utilizador) && isLoggedIn($infos[0].id_utilizador)}
                            <div class="text-center" id="bidAction">
                                <form class="form-inline">
                                    <div class="pull-left">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="AmountInput">Amount</label>
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon" id="sizing-addon1">Current bid: {$best_bid}</span>
                                            <input type="text" class="form-control" id="AmountInput" aria-describedby="sizing-addon1" placeholder="Amount e.g 2.56">
                                        </div>
                                    </div>
                                    <button id="bidding" type="submit" onclick="bid({$idPage});return false" onsubmit="bid({$idPage});return false" class="btn btn-primary btn-lg">Make Bid!</button>
                                </form>
                            </div>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>
<script src="../js/jquery_scripts.js"></script>
{include file='common/foot.tpl'}
</body>


</html>