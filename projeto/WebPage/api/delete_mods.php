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
    $param = ''."deleteMod";
    
    if (isAdmin($_SESSION['user'])) {
        if (deleteMod($params['id'])) {
            $_SESSION['success_messages'][] = 'Moderator deleted successfully';
            $data = [ $param => "mod deleted"];
		    printResponse($data);
            return true;
        }
        else {
            $_SESSION['error_messages'][] = 'Moderator not deleted';
            $data = [ $param => "mod not deleted"];
		    printResponse($data);
            return false;
        }
    }
    else {
        $_SESSION['error_messages'][] = 'You don\'t have permissions to do that';
        $data = [ $param => "user not admin"];
		printResponse($data);
        return false;
    }
?>