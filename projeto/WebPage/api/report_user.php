<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/moderate.php");
    include_once("../database/messages.php");
    include_once("../utils/utils.php");
    
    $params = ['user', 'motive'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."report_user";
    $param2 = ''."id_mod";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "") {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = reportUser($_SESSION['user'], $params['user'], $params['motive']);
    
    if ($ret != -1) {
        $_SESSION['error_messages'][] = 'User reported';
        $data = [ $param => "success", $param2 => $ret];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'User not reported';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>