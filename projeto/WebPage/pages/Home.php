<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    $categorias = getAllCategories();
    if (count($_SESSION) > 0) {
        $infos = getInfoByID($_SESSION['user']);
        $smarty->assign('infos', $infos);
    }
    
    $auctions = bestAuctions();
    $max = 8;
    $exceeded = "1";
    
    if (count($auctions) < 9) {
        $max = count($auctions) - 1;
    }
    else $exceeded = "0";
    
    
    if (isset($_SESSION['searched auctions'])) {
        $smarty->assign('auctions', $_SESSION['searched auctions']);
        $smarty->assign('js_auctions', json_encode($_SESSION['searched auctions']));
        
        if (count($_SESSION['searched auctions']) < 9) {
            $max = count($_SESSION['searched auctions']) - 1;
        }
        else  {
            $max = 8;
            $exceeded = "0";
        }
        $auctions = $_SESSION['searched auctions'];
        unset($_SESSION['searched auctions']);
    }
    else {
        $smarty->assign('auctions', $auctions);
        $smarty->assign('js_auctions', json_encode($auctions));
    }
    
    $highestBids = null;
    foreach($auctions as $auction) {
        $highestBids[] = getHighestBid($auction[id_leilao]);
        
        $smarty->assign('timeLeft', timeLeftOnAuction($auction['id_leilao']));
        $smarty->assign('noLicitees', getNoLiciteesOnAuction($auction['id_leilao']));
        $smarty->assign('classifications', getClassificationAuction($auction['id_leilao']));
        $smarty->assign('infosAuctions', getName($auction['id_leilao']));
    }
    
    $smarty->assign('highestBids', $highestBids);
    $smarty->assign('max', $max);
    $smarty->assign('auctionsVisited', 2);
    $smarty->assign('exceeded', $exceeded);
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/HomeTemplate.tpl');
?>