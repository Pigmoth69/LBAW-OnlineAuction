{include file='common/head.tpl'} {include file='common/bar.tpl'}
<!--<script src="../js/"></script>-->
<body>

    <!-- Page Content -->
    <div id="loginStatus"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <p class="lead">Total items:</p>
                <ul class="list-group">
                    <a href="" onclick="auctionsCategory(-1); return false" class="list-group-item"><span class="badge">
              {$total_no = 0}
              {foreach $categorias as $categoria}
                {$no = getNoElementsOfCategory($categoria.id_categoria)}
                {$total_no = $total_no + $no}
              {/foreach}
              {$total_no}</span>All Categories</a> {foreach $categorias as $categoria} {$no = getNoElementsOfCategory($categoria.id_categoria)} {$total_no = $total_no + $no}
                    <a href="" onclick="auctionsCategory({$categoria.id_categoria}); return false" class="list-group-item"><span class="badge">{$no}</span>{$categoria.descricao|escape}</a> {/foreach}
                </ul>
            </div>
            <div class="col-md-9">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="../images/slider/slider1.jpg" style="width:800px%;height:300px;" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="../images/slider/slider2.jpg" style="width:800px%;height:300px;" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="../images/slider/slider3.jpg" style="width:800px%;height:300px;" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Onde começam os artigos para leiloar-->
                <div class="row">
                    {foreach $auctions as $auction}
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="form-inline">
                            <div class="thumbnail">
                                <div class="teste">
                                    <img src="{$auction.imagem_produto}" alt="">
                                </div>
                                <h3 class="text-center"><b>{$auction.nome_produto}</b></h3>
                                <p>{$auction.descricao}</p>
                                <div class="ratings">
                                    <h5>Seller: <a {$seller = getInfoByID($auction.id_vendedor)} href="UserPage.php?idPage={$seller[0].id_utilizador}">{$seller[0].nome}</a></h5>
                                    <p>
                                        {$class = getClassificationAuction($auction.id_leilao)} {for $temp = 1 to $class|ceil}
                                        <span class="glyphicon glyphicon-star"></span> {/for} {for $temp = $class|ceil to 4}
                                        <span class="glyphicon glyphicon-star-empty"></span> {/for}
                                    </p>
                                </div>
                                <div class="price_tag">
                                    <h4 class="text-center"> {$bid = getHighestBid($auction.id_leilao)}{$bid} $</h4>
                                    <p class="text-center">Time left: {$time = timeLeftOnAuction($auction.id_leilao)}{$time}</p>
                                    <p class="text-center">Number of bids: {$nr = getNoLiciteesOnAuction($auction.id_leilao)}{$nr}</p>
                                </div>
                                <div class="text-center">
                                    <div class="form-inline">
                                        <a class="btn btn-danger" href="ItemPageBidder.php?idPage={$auction.id_leilao}">More Info</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {/foreach}
                    <!--<div class="col-sm-4 col-lg-4 col-md-4">
                  <h4><a href="#">Like this template?</a>
                  </h4>
                  <p>If you like this template, then check out <a target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this tutorial</a> on how to build a working review system for your online store!</p>
                  <a class="btn btn-primary" target="_blank" href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View Tutorial</a>
                  </div>-->

                </div>
            </div>
        </div>
    </div>
</body>
<script src="../js/imageFit.js"></script>
<script src="../js/jquery_scripts.js"></script>
{include file='common/foot.tpl'}

</html>