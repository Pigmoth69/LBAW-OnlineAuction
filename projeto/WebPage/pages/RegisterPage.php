<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    $paises = getAllCountries();
    $categorias = getAllCategories();
    
    $smarty->assign('paises', $paises);
    $smarty->assign('categorias', $categorias);
    $smarty->display('../templates/RegisterPageTemplate.tpl');
?>