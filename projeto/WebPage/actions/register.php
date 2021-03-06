<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    
    $params = [ 'first_name', 'last_name', 'birthdate', 'gender', 'email', 'password', 'password_confirmation', 'country'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    $param = ''."register";
    
    if ($params['password'] != $params['password_confirmation']) {
        $_SESSION['error_messages'][] = 'Passwords don\'t match';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    if (register($params['first_name'] . " " . $params['last_name'], $params['birthdate'], $params['gender'], $params['email'], $params['password'], $params['country'])) {
        $_SESSION['success_messages'][] = 'Register successful';
        $data = [ $param => "success"];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'That user already exists';
        $data = [ $param => "user_exists"];
		printResponse($data);
        return false;
    } 
?>