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
	
	if (!($_POST['username'] || $_POST['password'])) {
		$_SESSION['error_messages'][] = 'Error!';
		//header("Location: $BASE_URL");
    	exit;
  	}
	
	$return = compareLogin($_POST['username'], $_POST['password']);
	if ($return == -1) {
		//printResponse("wrong_login");
		return false;
	}
	else {
		$_SESSION['user'] = $return;
		//printResponse("success");
		return true;
	}
?>