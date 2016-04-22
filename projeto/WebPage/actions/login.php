<?php
	session_start();
	$path = '../config/init.php';

    if(!file_exists($path))
            $path = 'config/init.php';
    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}
	$path = '../database/user.php';

    if(!file_exists($path))
            $path = 'database/user.php';
    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}
	
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