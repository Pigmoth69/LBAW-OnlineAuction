<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../database/moderate.php';
    include_once '../utils/utils.php';
    
    //if (count($_SESSION) === 0 || $_SESSION['user'] == '') {
    //    header("Location: ../index.php");
    //    exit;
    //}
    //if (isAdmin($_SESSION['user']))
    //   header("Location: AdminPage.php");
    
    if ((!isset($_GET['idPage'])) || ($_GET['idPage'] == '')) {
        header("Location: ../index.php");
    }
    
    if (($_SESSION['user'] == $_GET['idPage']) && (isAdmin($_SESSION['user']))) {
        header("Location: AdminPage.php");
    }
    
    if (($_SESSION['user'] == $_GET['idPage']) && (isMod($_SESSION['user']))) {
        header("Location: ModeratorPage.php?idPage=" . $_SESSION['user']);
    }
    
    if (!isUser($_GET['idPage']))
        header("Location: ../index.php");
    
    $idPage = $_GET['idPage'];
    $categorias = getAllCategories();
    
    if (count($_SESSION) > 0) {
        $infos = getInfoByID($_GET['idPage']);
        $smarty->assign('infos', $infos);
    }
    else {
        $infos = getInfoByID($_GET['idPage']);
        //$smarty->assign('infos', $infos);
    }
    
    $pais = getNameCountryByID($infos[0]['id_pais']);
    $paises = getAllCountries();
    $auctions = getAuctionsByUserID($idPage);
    $auctions_seller = getAuctionsByLiciteedID($idPage);
    $best_auctions = bestAuctions();
    $not_logged = '';
    
    $smarty->assign('categorias', $categorias);
    $smarty->assign('infos', $infos[0]);
    $smarty->assign('country', $pais[0]);
    $smarty->assign('paises', $paises);
    $smarty->assign('auctions', $auctions);
    $smarty->assign('idPage', $idPage);
    
    if (isset($_SESSION['user']))
        $smarty->assign('idUser', $_SESSION['user']);
    else $smarty->assign('idUser', $not_logged);
    $smarty->assign('auctions_seller', $auctions_seller);
    $smarty->assign('best_auctions', $best_auctions);
    $smarty->display('../templates/UserPageTemplate.tpl');
?>