<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    
    $params = [ 'e_mail'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    $param = ''."recoverPassword";
    
    if (count($_SESSION) > 0 || $_SESSION['user'] != '') {
        $data = [ $param => "error"];
        printResponse($data);
    }
    
    if (recoverPassword($params['e_mail'])) {
        $_SESSION['error_messages'][] = 'E-mail sent';
        $data = [ $param => "success"];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'E-mail doesn\'t exist';
        $data = [ $param => "e_mail doesn't exist"];
		printResponse($data);
        return false;
    } 
?>