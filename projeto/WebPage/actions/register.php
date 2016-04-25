<?php
   /* $path = '../config/init.php';

    if(!file_exists($path))
        $path = 'config/init.php';
    if(!file_exists($path))
        $path = '../../config/init.php';
    if(!file_exists($path))
        $path = '../../../config/init.php';     
    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}*/
	$path = '../database/user.php';

    if(!file_exists($path))
        $path = 'database/user.php';
    if(!file_exists($path))
        $path = '../../database/user.php';
    if(!file_exists($path))
        $path = '../../../database/user.php';

    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}
    
    $params = [ 'first_name', 'last_name', 'birthdate', 'gender', 'email', 'password', 'country'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if (register($params['first_name'] . " " . $params['last_name'], $params['birthdate'], $params['gender'], $params['email'], $params['password'], $params['country'])) {
        printResponse("success", "register");
        return true;
    }
    else {
        printResponse("user_exists", "register");
        return true;
    } 
?>