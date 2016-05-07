<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    if (count($_SESSION) === 0 || $_SESSION['user'] == '') {
        header("Location: ../index.php");
        exit;
    }
    if (isAdmin($_SESSION['user']))
       header("Location: AdminPage.php");
    
    $categorias = getAllCategories();
    $infos = getInfoByID($_SESSION['user']);
    $pais = getNameCountryByID($infos[0]['id_pais']);
    $paises = getAllCountries();
    $auctions = getAuctionsByUserID($_SESSION['user']);
    $auctions_seller = getAuctionsByLiciteedID($_SESSION['user']);
    $best_auctions = bestAuctions();
    
    $smarty->assign('categorias', $categorias);
    $smarty->assign('infos', $infos[0]);
    $smarty->assign('country', $pais[0]);
    $smarty->assign('paises', $paises);
    $smarty->assign('auctions', $auctions);
    $smarty->assign('auctions_seller', $auctions_seller);
    $smarty->assign('best_auctions', $best_auctions);
    $smarty->display('../templates/UserPageTemplate.tpl');
?>