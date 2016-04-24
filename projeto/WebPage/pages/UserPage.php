<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    session_start();
    if (count($_SESSION) === 0) {
        header("Location: ../index.php");
        exit;
    }
    if (isAdmin($_SESSION['user']))
       header("Location: pages/AdminPage.php");
       
    $infos = getInfoByID($_SESSION['user']);
    $pais = getNameCountryByID($infos[0]['id_pais']);
    $auctions = getAuctionsByUserID($_SESSION['user']);
    $best_auctions = bestAuctions();
    
    $smarty->assign('info_user', $infos);
    $smarty->assign('pais_user', $pais);
    $smarty->assign('auctions', $auctions);
    $smarty->assign('best_auctions', $best_auctions);
    include '../templates/UserPageTemplate.php';
    //$smarty->display('../templates/UserPageTemplate.php');
    
?>