<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/moderate.php");
    include_once("../database/messages.php");
    include_once("../utils/utils.php");
    
    $params = [ 'e_mail', 'title', 'body'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if ($params['e_mail'] == "") {
        $_SESSION['error_messages'][] = 'E-mail empty';
        printResponse("error on js", "send_message");
        return false;
    }
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "") {
        $_SESSION['error_messages'][] = 'Not logged';
        printResponse("error on js", "send_message");
        return false;
    }
    
    if (sendMessage($_SESSION['user'], $params['e_mail'], $params['title'], $params['body'])) {
        $_SESSION['error_messages'][] = 'Message sent';
        printResponse("success", "send_message");
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'E-mail doesn\'t exist';
        printResponse("e_mail doesn't exist", "send_message");
        return false;
    } 
?>