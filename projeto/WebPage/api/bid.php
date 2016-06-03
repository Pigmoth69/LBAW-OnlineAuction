<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../utils/utils.php");
    
    $params = ['auction', 'amount'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."bid";
    $param2 = ''."amount";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "") {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    
    $ret = bid($_SESSION['user'], $params['auction'], $params['amount']);
    
    if ($ret) {
        $_SESSION['success_messages'][] = 'Auction bidded';
        $data = [ $param => "success", $param2 => $params['amount']];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Auction not bidded';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>