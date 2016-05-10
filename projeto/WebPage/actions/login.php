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
	$param = ''."login";
	$param2 = ''."id";
	
	if(count($_SESSION) > 0) {
		$_SESSION['error_messages'][] = 'Already logged in';
		$data = [ $param => "already logged"];
		printResponse($data);
		return false;
	}
	$id = compareLogin($params['username'], $params['password']);
	if ($id == -1) {
		$_SESSION['error_messages'][] = 'Wrong credentials';
		$data = [ $param => "wrong_login"];
		printResponse($data);
		return false;
	}
	else if ($id > 0){
		$_SESSION['user'] = $id;
		$_SESSION['success_messages'][] = 'Login successful';
		$data = [ $param => "success", $param2 => $id];
		printResponse($data);
		return true;
	}
?>