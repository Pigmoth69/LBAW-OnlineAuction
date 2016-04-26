<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/moderate.php");

    $params = [ 'functionName','email', 'id'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if (isAdmin($_SESSION['user'])) {
        if (deleteMod($params['id'], $params['email'])) {
            printReponse("mod deleted", "delete_mod");
            return true;
        }
        else {
            printResponse("mod not deleted", "delete_mode");
            return false;
        }
    }
    else {
        printResponse("user not admin", "delete_mod");
        return false;
    }
?>