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
    $config['date'] = '%I:%M %p';
    $config['time'] = '%H:%M:%S';
    $smarty->assign('config', $config);
    
    $smarty->assign('auctions', $auctions);
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/HomeTemplate.tpl');
?>