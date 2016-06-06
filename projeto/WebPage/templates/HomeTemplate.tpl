{include file='common/head.tpl'} {include file='common/bar.tpl'}
<script src="../js/auctionTime.js"></script>
<!-- Page Content -->
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
        </div>
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
        <div id="startAuctions">
            <div class="row" id="allAuctions">
                {for $contador=0 to $max}
                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="form-inline">
                        <div class="thumbnail">
                            <div class="teste">
                                <img src="{$auctions[$contador].imagem_produto|escape}" alt="">
                            </div>
                            <h3 class="text-center"><b>{$auctions[$contador].nome_produto|escape}</b></h3>
                            <p>{$auctions[$contador].descricao}</p>
                            <div class="ratings">
                                <h5>Seller: <a {$seller = getInfoByID($auctions[$contador].id_vendedor)} href="UserPage.php?idPage={$seller[0].id_utilizador}">{$seller[0].nome|escape}</a></h5>
                                <p>
                                    {$class = getClassificationAuction($auctions[$contador].id_leilao)} {for $temp = 1 to $class|ceil}
                                    <span class="glyphicon glyphicon-star"></span> {/for} {for $temp = $class|ceil to 4}
                                    <span class="glyphicon glyphicon-star-empty"></span> {/for}
                                </p>
                            </div>
                            <div class="price_tag">
                                <h4 class="text-center"> {$bid = getHighestBid($auction.id_leilao)}{$bid} $</h4>
                                <p class="text-center">Time Left:</p>
                                <p class="text-center timeLeft">{$time = timeLeftOnAuction($auction.id_leilao)}{$time}</p>
                                <p class="text-center">Number of bids: {$nr = getNoLiciteesOnAuction($auction.id_leilao)}{$nr}</p>
                            </div>
                            <div class="text-center">
                                <div class="form-inline">
                                    <a class="btn btn-danger" href="ItemPageBidder.php?idPage={$auctions[$contador].id_leilao}">More Info</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {/for}
            </div>
        </div>
        <div class="col-md-offset-7">
            <button type="button" class="fa fa-hand-spock-o fa-3x btn btn-primary" onclick="changeAuctions()" aria-hidden="true" id="showMoreAuctions"> Show More
                </button> {literal}
            <script language="javascript">
                var max = 8;
                var auctionsVisited = 2;

                function changeAuctions() {
                    $("#allAuctions").remove();
                    var temp = null;
                    var temp1 = null;
                    var array = [];
                    var bids = [];
                    var times = [];
                    var noLicitees = [];
                    var classifications = [];
                    var infosAuctions = [];

                    /* CREATE REST */
                    {
                        /literal}{for $i = 0 to $auctions|count - 1}{literal}
                        array[{
                                    /literal}{$i}{literal}] = {/literal
                                } {
                                    json_encode($auctions[$i])
                                } {
                                    literal
                                }; {
                                    /literal}{/for
                                } {
                                    literal
                                }

                                {
                                    /literal}{for $i = 0 to $auctions|count - 1}{literal}
                                    bids[{
                                                /literal}{$i}{literal}] = {/literal
                                            } {
                                                json_encode($highestBids[$i])
                                            } {
                                                literal
                                            }; {
                                                /literal}{/for
                                            } {
                                                literal
                                            }

                                            {
                                                /literal}{for $i = 0 to $auctions|count - 1}{literal}
                                                times[{
                                                            /literal}{$i}{literal}] = {/literal
                                                        } {
                                                            json_encode($timeLeft[$i])
                                                        } {
                                                            literal
                                                        }; {
                                                            /literal}{/for
                                                        } {
                                                            literal
                                                        }

                                                        {
                                                            /literal}{for $i = 0 to $auctions|count - 1}{literal}
                                                            noLicitees[{
                                                                        /literal}{$i}{literal}] = {/literal
                                                                    } {
                                                                        json_encode($noLicitees[$i])
                                                                    } {
                                                                        literal
                                                                    }; {
                                                                        /literal}{/for
                                                                    } {
                                                                        literal
                                                                    }

                                                                    {
                                                                        /literal}{for $i = 0 to $auctions|count - 1}{literal}
                                                                        classifications[{
                                                                                    /literal}{$i}{literal}] = {/literal
                                                                                } {
                                                                                    json_encode($classifications[$i])
                                                                                } {
                                                                                    literal
                                                                                }; {
                                                                                    /literal}{/for
                                                                                } {
                                                                                    literal
                                                                                }

                                                                                {
                                                                                    /literal}{for $i = 0 to $auctions|count - 1}{literal}
                                                                                    infosAuctions[{
                                                                                            /literal}{$i}{literal}] = {/literal
                                                                                        } {
                                                                                            json_encode($infosAuctions[$i])
                                                                                        } {
                                                                                            literal
                                                                                        }; {
                                                                                            /literal}{/for
                                                                                        } {
                                                                                            literal
                                                                                        }

                                                                                        var html = "<div class=\"row\" id=\"allAuctions\">";

                                                                                        contador = array.length - 1;
                                                                                        if (array.length > (max + 1) * auctionsVisited)
                                                                                            contador = (max + 1) * auctionsVisited - 1;

                                                                                        for (var i = max; i < contador; i++) {
                                                                                            html = html + "<div class=\"col-sm-4 col-lg-4 col-md-4\">"
                                                                                            html = html + "<div class=\"form-inline\">";
                                                                                            html = html + "<div class=\"thumbnail\">";
                                                                                            html = html + "<div class=\"teste\">";

                                                                                            temp = array[i]["imagem_produto"].trim();
                                                                                            temp1 = array[i]["nome_produto"].trim();
                                                                                            html = html + "<img src=\"" + temp + "\" alt=\"" + temp1 + "\">";
                                                                                            html = html + "</div>";
                                                                                            temp = array[i]["nome_produto"].trim();
                                                                                            html = html + "<h3 class=\"text-center\"><b>" + temp + "</b></h3>";
                                                                                            temp = array[i]["descricao"].trim();
                                                                                            html = html + "<p>" + temp + "</p>";
                                                                                            html = html + "<div class=\"ratings\">"
                                                                                            temp = array[i]["id_vendedor"];
                                                                                            temp1 = infosAuctions[i][0]["nome"].trim();
                                                                                            html = html + "<h5>Seller: <a href=\"UserPage.php?idPage=" + temp + "\">" + temp1 + "</a></h5>";
                                                                                            html = html + "</div>";
                                                                                            html = html + "<div class=\"price_tag\">";
                                                                                            html = html + "<h4 class=\"text-center\">";
                                                                                            temp = bids[i];
                                                                                            html = html + temp + "</h4>";
                                                                                            temp = times[i];
                                                                                            html = html + "<p class=\"text-center\">Time left: " + temp + "</p>";
                                                                                            temp = noLicitees[i];
                                                                                            html = html + "<p class=\"text-center\">Number of bids: " + temp + "</p>";
                                                                                            html = html + "</div>";
                                                                                            html = html + "<div class=\"text-center\">"; //j
                                                                                            html = html + "<div class=\"form-inline\">"; //k
                                                                                            temp = array[i]["id_leilao"];
                                                                                            html = html + "<a class=\"btn btn-danger\" href=\"ItemPageBidder.php?idPage=" + temp + "\">More Info</a>";
                                                                                            html = html + "</div></div>" //j k
                                                                                            html = html + "</div></div></div>";
                                                                                        }
                                                                                        max = max + 9; auctionsVisited = auctionsVisited + 1; html = html + "</div>";

                                                                                        $("#startAuctions").append(html);

                                                                                        if (array.length > (max - 8) * ((auctionsVisited - 1)))
                                                                                            $("#showMoreAuctions").show();
                                                                                        else $("#showMoreAuctions").hide();
                                                                                    }
            </script>
            {/literal}
        </div>
        <input type="hidden" id="hasExceeded" value="{$exceeded}">
        <input type="hidden" id="max" value="{$max}">
    </div>

</div>
</div>
<script src="../js/imageFit.js"></script>
<script src="../js/jquery_scripts.js"></script>
<script src="../js/showMoreAuctions.js"></script>
{include file='common/foot.tpl'}
</body>


</html>