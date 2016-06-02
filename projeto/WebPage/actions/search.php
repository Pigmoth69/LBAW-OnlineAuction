<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = ['description'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $param = ''."search";
    $param2 = ''."auctions";
    
    $ret = search($params['description']);
    
    if ($ret != null) {
        $_SESSION['success_messages'][] = 'Search completed';
        $data = [$param => "success", $param2 => $ret];
        $_SESSION['searched auctions'] = $ret;
		printResponse($data);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Bad search';
        $data = [ $param => "error"];
		printResponse($data);
        return false;
    } 
?>