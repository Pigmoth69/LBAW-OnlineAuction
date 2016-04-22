<?php
    include_once '../config/init.php';
	include_once '../database/user.php';
    
    $params = [ 'first_name', 'last_name', 'birthdate', 'gender', 'email', 'password', 'country'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if (register($params['first_name'] . " " . $params['last_name'], $params['birthdate'], $params['gender'], $params['email'], $params['password'], $params['country']))
        header('Location: ../index.php');
    else header('Location: ../RegisterPage.php');
?>