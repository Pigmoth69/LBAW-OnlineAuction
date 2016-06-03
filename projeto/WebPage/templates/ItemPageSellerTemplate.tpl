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
    <link rel="stylesheet" type="text/css" href="../css/sweetalert.css" />
    <script src="../js/loginScript.js"></script>
    <script type='text/javascript' src="../js/progressBar.js"></script>
</head>
{include file='common/bar.tpl'}

<!-- Page Content -->
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="{$seller.imagem_utilizador|escape}" style="width:500px;height:360px" alt="{$seller.imagem_utilizador|escape}">
            </div>
            <div class="list-group">
                <div class="list-group-item">
                    <p class="text-center">User rating:</p>
                    <div class="ratings">
                        <p>
                            {for $temp = 1 to $seller.classificacao|ceil}
                            <span class="glyphicon glyphicon-star"></span> {/for} {for $temp = $seller.classificacao|ceil to 4}
                            <span class="glyphicon glyphicon-star-empty"></span> {/for}
                        </p>
                    </div>
                </div>
                <a href="UserPage.php?idPage={$seller.id_utilizador}" class="list-group-item">
                    <p class="glyphicon glyphicon-user"> {$seller.nome|escape}</p>
                </a>
                <div class="list-group-item">
                    <p class="fa fa-venus-mars"> {if $seller.genero eq 'male'} Male {else} Female {/if}
                    </p>
                </div>
                <a href="#" class="list-group-item">
                    <p class="glyphicon glyphicon-envelope"> {$seller.e_mail|escape}</p>
                </a>
                <div class="list-group-item">
                    <p>Total sales: {$sales}</p>
                </div>
                <div class="btn center-block">
                    <a href="#" class="btn btn-danger text-center" data-toggle="modal" data-target="#cancelAuction">
                        <i class="fa fa-flag fa-2x"></i>
                        <br> Cancel Auction
                    </a>
                </div>
                <div id="cancelAuction" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Cancel Auction</h4>
                            </div>
                            <div class="modal-body">
                                <textarea rows="4" cols="50" name="motive" id="motive" class="form-control input-sm" placeholder="Write here the motive for cancelling your auction"></textarea>
                                <br>
                                <input type="submit" value="Cancel Auction" class="btn btn-primary" id="cancelAuction" onsubmit="cancelAuction({$idPage})" onclick="cancelAuction({$idPage})">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--<div class="list-group">
                  <a href="#" class="list-group-item active">Category 1</a>                   <a
                  href="#" class="list-group-item">Category 2</a>                   <a href="#"
                  class="list-group-item">Category 3</a>                   </div>-->
        </div>
        <div class="col-md-9">
            <div class="row">
                <h4 class="text-center" id="ItemName">{$auction.nome_produto|escape}
                        {if $auction.estado_leilao == 'invalido'}
                        <i data-toggle="modal" data-target="#editAuction" class="fa fa-cog fa-2x fa-spin" aria-hidden="true"></i>
                        {/if}
                    </h4> {if $auction.estado_leilao == 'invalido'}
                <div id="editAuction" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Create New Auction</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" id="formEditAuction" action="../actions/edit_auction.php" onsubmit="return checkValidityEditAuction()" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="text" name="nameEditAuction" id="nameEditAuction" value="{$auction.nome_produto|escape}" class="form-control input-sm" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <input type="datetime" name="dateEditAuction" id="dateEditAuction" value="{$auction.data_fim|escape}" class="form-control input-sm" placeholder="Date to end the auction" onChange="checkDateAuction()">
                                    </div>
                                    <div class="form-group">
                                        <select id="categoryOptionsEditAuction" name="categoryEditAuction" label="Category">
                                {foreach $categorias as $categoria}
                                    <option value="{$categoria.descricao}" {if $categoria.id_categoria eq $auction.id_categoria}
                                                                        selected
                                                                        {/if}>{$categoria.descricao|escape}</option>
                                {/foreach}
                                            </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="number" min="0" value="{$auction.valor_base|escape}" name="valorEditAuction" id="valorEditAuction" class="form-control input-sm" placeholder="Minimum Bid">
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Image: </label>
                                        <input type="file" id="imageEditAuction" name="imageEditAuction">
                                    </div>
                                    <input type="hidden" name="idLeilao" id="idLeilao" value="{$auction.id_leilao}">
                                </form>
                                <textarea rows="4" cols="50" onresize="false" value="{$auction.descricao|escape}" name="descriptionEditAuction" form="formEditAuction"></textarea>
                                <br>
                                <input type="submit" value="Edit Auction" class="btn btn-block" form="formEditAuction" id="submitEditAuction">
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {/if}
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
                            <img src="{$auction.imagem_produto|escape}" alt="{$auction.nome_produto|escape}"></div>
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
                    <p>{$auction.descricao|escape}</p>
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
                                        <span class="badge">{$span = getTimeDiffOnLic($lic.id_licitacao)}{$span} ago</span>
                                        <span class="badge">Bid: {$lic.valor_licitacao}</span>
                                        <i class="fa fa-fw fa-user"></i> {$lic.nome|escape}
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
<script src="../js/jquery_scripts.js"></script>
{include file='common/foot.tpl'}
</body>

</html>