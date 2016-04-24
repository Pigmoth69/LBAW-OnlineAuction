<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    
    $categorias = getAllCategories();
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/HomeTemplate.tpl');
?>