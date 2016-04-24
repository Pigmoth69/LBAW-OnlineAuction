<?php
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    $smarty->display('../templates/ItemPageBidderTemplate.tpl');
?>