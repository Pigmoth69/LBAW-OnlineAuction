<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/moderate.php");
    
    $params = [ 'first_name', 'last_name', 'birthdate', 'gender', 'email', 'password', 'password_confirmation', 'country'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if ($params['password'] != $params['password_confirmation']) {
        printResponse("error on js", "registerMod");
        return false;
    }
    
    if (registerMod($params['first_name'] . " " . $params['last_name'], $params['birthdate'], $params['gender'], $params['email'], $params['password'], $params['country'])) {
        printResponse("success", "registerMod");
        return true;
    }
    else {
        printResponse("user_exists", "registerMod");
        return false;
    } 
?>