<?php
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
    
    if (!($_POST['first_name'] || $_POST['last_name'] || $_POST['birthdate'] || $_POST['gender'] || $_POST['email'] || $_POST['password'] || $_POST['country'])) {
		$_SESSION['error_messages'][] = 'Error!';
		//header("Location: $BASE_URL");
    	//exit;
  	}
    
    if (register($_POST['first_name'] . " " . $_POST['last_name'], $_POST['birthdate'], $_POST['gender'], $_POST['email'], $_POST['password'], $_POST['country'])) {
        //sleep(20)
        return true;
    }
    else {
        //sleep(10);
        return false;
    }
?>