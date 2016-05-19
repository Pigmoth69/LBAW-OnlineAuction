<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    if (!isOwner($_SESSION['user'], $GET['idPage'])) {
        header("Location: ItemPageBidder.php?idPage=" . $_GET['idPage']);
    }
    
    $categorias = getAllCategories();
    if (count($_SESSION) > 0) {
        $infos = getInfoByID($_SESSION['user']);
        $smarty->assign('infos', $infos);
    }
    
    $auction = getAuctionByID($_GET['idPage']);
    $seller = getInfoByID($auction[0]['id_vendedor']); 
    $sales = getTotalSales($auction[0]['id_vendedor']);
    $best_bid = getHighestBid($auction[0]['id_leilao']);
    
    $smarty->assign('auction', $auction[0]);
    $smarty->assign('seller', $seller[0]);
    $smarty->assign('best_bid', $best_bid);
    $smarty->assign('sales', $sales);
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/ItemPageSellerTemplate.tpl');
?>