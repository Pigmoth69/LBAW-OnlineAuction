<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../database/messages.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    
    $params = ['user', 'motive'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."cancel_auction";
    $param2 = ''."id_mod";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "" || !isOwner($_SESSION['user'], $params['user'])) {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = cancelAuction($_SESSION['user'], $params['user'], $params['motive']);
    
    if ($ret != -1) {
        $_SESSION['success_messages'][] = 'Auction cancelled';
        $data = [ $param => "success", $param2 => $ret];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Auction not cancelled';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>