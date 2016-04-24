<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    
    $smarty->display('../templates/ItemPageSellerTemplate.tpl');
?>