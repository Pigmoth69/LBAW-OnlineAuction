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
    }
    
    $highestBids = null;
    $noLicitees = null;
    $timeLeft = null;
    $classifications = null;
    $infosAuctions = null;
    
    foreach($auctions as $auction) {
        $highestBids[] = getHighestBid($auction['id_leilao']);
        $timeLeft[] = timeLeftOnAuction($auction['id_leilao']);
        $noLicitees[] = getNoLiciteesOnAuction($auction['id_leilao']);
        $classifications[] = getClassificationAuction($auction['id_leilao']);
        $infosAuctions[] = getInfoByID($auction['id_vendedor']);
    }
    
    $smarty->assign('highestBids', $highestBids);
    $smarty->assign('timeLeft', $timeLeft);
    $smarty->assign('noLicitees', $noLicitees);
    $smarty->assign('classifications', $classifications);
    $smarty->assign('infosAuctions', $infosAuctions);
    $smarty->assign('max', $max);
    $smarty->assign('auctionsVisited', 2);
    $smarty->assign('exceeded', $exceeded);
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/HomeTemplate.tpl');
?>