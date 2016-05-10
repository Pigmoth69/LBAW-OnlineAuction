<?php	
	include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
	
	$params = [ 'functionName','username', 'password' ];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
	
	if(count($_SESSION) > 0) {
		$_SESSION['error_messages'][] = 'Already logged in';
		printResponse("already logged", "login");
		return false;
	}
	$id = compareLogin($params['username'], $params['password']);
	if ($id == -1) {
		$_SESSION['error_messages'][] = 'Wrong credentials';
		printResponse("wrong_login", "login");
		return false;
	}
	else if ($id > 0){
		$_SESSION['user'] = $id;
		$_SESSION['success_messages'][] = 'Login successful';
		printResponse("success", "login");
		return true;
	}
?>