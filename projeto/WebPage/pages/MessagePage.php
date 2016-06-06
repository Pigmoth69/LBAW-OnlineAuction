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
    if (count($_SESSION) > 0) {
        $infos = getInfoByID($_SESSION['user']);
        $smarty->assign('infos', $infos);
    }
    
    $emissor = getMessagesByEmissor($_SESSION['user']);
    $recetor = getMessagesByReceptor($_SESSION['user']);
    $e_mail_to_send = $_SESSION['e_mail to send'];
    
    $smarty->assign('categorias', $categorias);
    $smarty->assign('emissor', $emissor);
    $smarty->assign('recetor', $recetor);
    $smarty->assign('e_mail_to_send', $e_mail_to_send);
    $smarty->display('../templates/MessagePageTemplate.tpl');
?>