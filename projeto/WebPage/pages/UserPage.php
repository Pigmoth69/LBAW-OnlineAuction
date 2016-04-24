<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    
    session_start();
    if (count($_SESSION) === 0) {
        header("Location: ../index.php");
        exit;
    }
    if (isAdmin($_SESSION['user']))
       header("Location: pages/AdminPage.php");
       
    $categorias = getAllCategories();
    $infos = getInfoByID($_SESSION['user']);
    $pais = getNameCountryByID($infos[0]['id_pais']);
    $auctions = getAuctionsByUserID($_SESSION['user']);
    $best_auctions = bestAuctions();
    
    $smarty->assign('infos', $infos[0]);
    $smarty->assign('pais', $pais);
    $smarty->assign('auctions', $auctions);
    $smarty->assign('best_auctions', $best_auctions);
    $smarty->display('../templates/UserPageTemplate.tpl');
?>