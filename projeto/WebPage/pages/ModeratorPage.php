<?php
    include_once '../config/init.php';
    include_once '../utils/utils.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../database/moderate.php';
    
    if (count($_SESSION) === 0 || $_SESSION['user'] == '') {
        header("Location: ../index.php");
        exit;
    }
    
    if (!isMod($_SESSION['user'])) {
        header("Location: UserPage.php?idPage=" . $_SESSION['user']);
        exit;
    }  
    
    $mods = moderators();
    $users = users();
    $auctionsToValidate = getAuctionsToValidate();
    $paises = getAllCountries();
    $infos = getInfoByID($_SESSION['user']);
    $categorias = getAllCategories();
    
    $smarty->assign('categorias', $categorias);
    $smarty->assign('paises', $paises);
    $smarty->assign('mods', $mods);
    $smarty->assign('auctionsToValidate', $auctionsToValidate);
    $smarty->assign('users', $users);
    $smarty->assign('infos', $infos);
    $smarty->display('../templates/ModeratorPageTemplate.tpl');
?>