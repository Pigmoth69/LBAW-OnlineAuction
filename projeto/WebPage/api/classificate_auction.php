<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../utils/utils.php");
    
    $params = ['classification', 'auction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."classificateAuction";
    $param2 = ''."classification";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "") {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = classificateAuction($_SESSION['user'], $params['auction'], $params['classification']);
    
    if ($ret) {
        $_SESSION['success_messages'][] = 'Auction classificated';
        $data = [ $param => "success", $param2 => $params['classification']];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Auction not classificated';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>