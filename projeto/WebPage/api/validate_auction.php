<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = ['validate', 'auction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."validateAuction";
    $param2 = ''."validate";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "" || !isMod($_SESSION['user'])) {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = validAuction($_SESSION['user'], $params['validate'], $params['auction']);
    
    if ($ret) {
        $_SESSION['success_messages'][] = 'Auction validated';
        $data = [ $param => "success", $param2 => $params['validate']];
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Auction not validated';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>