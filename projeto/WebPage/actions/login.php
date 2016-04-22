<?php
	session_start();
	include_once '../config/init.php';
	include_once '../database/user.php';
	
	$params = [ 'username', 'password' ];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
	
	if (compareLogin($params['username'], $params['password']) === -1) {
		//printResponse("wrong_login");
	}
	else {
		$_SESSION['user'] = getIdByUserPass($params['username'], $params['password']);
		//printResponse("success");
	}
?>