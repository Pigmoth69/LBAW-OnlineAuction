<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");

    $params = [ 'functionName', 'id'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if (isAdmin($_SESSION['user'])) {
        if (deleteMod($params['id'])) {
            $_SESSION['success_messages'][] = 'Moderator deleted successfully';
            printResponse("mod deleted", "deleteMod");
            return true;
        }
        else {
            $_SESSION['error_messages'][] = 'Moderator not deleted';
            printResponse("mod not deleted", "deleteMod");
            return false;
        }
    }
    else {
        $_SESSION['error_messages'][] = 'You don\'t have permissions to do that';
        printResponse("user not admin", "deleteMod");
        return false;
    }
?>