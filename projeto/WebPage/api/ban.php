<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = ['ban', 'user', 'date', 'motive'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."ban";
    $param2 = ''."banned";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "" || !isMod($_SESSION['user'])) {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = ban($params['ban'], $params['user'], $params['date'], $params['motive'], $_SESSION['user']);
    
    if ($ret) {
        $_SESSION['success_messages'][] = 'User banned';
        $data = [ $param => "success", $param2 => $params['ban']];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'User not banned';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>