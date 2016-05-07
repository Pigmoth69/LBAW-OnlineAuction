<?php
    include_once '../config/init.php';
    include_once '../database/user.php';
    include_once '../database/auctions.php';
    include_once '../database/countries.php';
    include_once '../database/categories.php';
    include_once '../database/messages.php';
    include_once '../utils/utils.php';
    
    $categorias = getAllCategories();
    if (count($_SESSION) === 0 || $_SESSION['user'] == '') {
        header("Location: ../index.php");
        exit;
    }
    
    $infos = getInfoByID($_SESSION['user']);
    $emissor = getMessagesByEmissor($_SESSION['user']);
    $recetor = getMessagesByReceptor($_SESSION['user']);
    
    
    $smarty->assign('infos', $infos);
    $smarty->assign('categorias', $categorias);
    $smarty->assign('emissor', $emissor);
    $smarty->assign('recetor', $recetor);
    $smarty->display('../templates/MessagePageTemplate.tpl');
?>