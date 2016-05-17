<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../utils/utils.php';
    
    if (count($_SESSION) > 0) {
        if (isOwner($_SESSION['user'], $_GET['idPage']))
            header("Location: ItemPageSeller.php?idPage=" . $_GET['idPage']);
        else header("Location: ItemPageBidder.php?idPage=" . $_GET['idPage']);
    }
    else header("Location: ItemPageBidder.php?idPage=" . $_GET['idPage']);
?>