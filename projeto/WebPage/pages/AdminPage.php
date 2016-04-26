<?php
    include_once '../config/init.php';
    include_once '../utils/utils.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    
    if (count($_SESSION) === 0 || $_SESSION['user'] == '') {
        header("Location: ../index.php");
        exit;
    }
    
    if (!isAdmin($_SESSION['user'])) {
        header("Location: UserPage.php");
        exit;
    }  
    
    $mods = moderators();
    $user = getInfoByID($_SESSION['user']);
    $categorias = getAllCategories();
    
    $smarty->assign('categorias', $categorias);
    $smarty->assign('mods', $mods);
    $smarty->assign('user', $user);
    $smarty->display('../templates/AdminPageTemplate.tpl');
?>