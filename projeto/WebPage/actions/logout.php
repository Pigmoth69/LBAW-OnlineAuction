<?php
    include_once '../config/init.php';
    session_unset($_SESSION['user']);
    session_destroy();
    $_SESSION = array();
    header("Location: ../index.php");
    exit;
?>  