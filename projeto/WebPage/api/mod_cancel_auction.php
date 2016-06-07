<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../database/messages.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    
    $params = ['auction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."mod_cancel_auction";
    
    if (count($_SESSION) == 0 || $_SESSION['user'] == "" || !isMod($_SESSION['user'])) {
        $_SESSION['error_messages'][] = 'Not logged';
        $data = [ $param => "error on js"];
		printResponse($data);
        return false;
    }
    
    $ret = cancelAuctionMod($params['auction']);
    
    if ($ret) {
        $_SESSION['success_messages'][] = 'Auction cancelled';
        $data = [ $param => "success"];
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