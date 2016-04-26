<?php	
	include_once("../config/init.php");
    include_once("../database/user.php");
	$params = [ 'functionName','username', 'password' ];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
	
	if(count($_SESSION) > 0) {
		printResponse("already logged", "login");
		return true;
	}
	$id = compareLogin($params['username'], $params['password']);
	if ($id == -1) {
		printResponse("wrong_login", "login");
		return true;
	}
	else if ($id > 0){
		$_SESSION['user'] = $id;
		printResponse("success", "login");
		return true;
	}
	else {
		printResponse("WTF", "login");
		return true;
	}
?>