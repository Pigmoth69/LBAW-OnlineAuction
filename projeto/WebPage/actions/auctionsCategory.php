<?php
    include_once("../config/init.php");
    include_once("../database/auctions.php");
    include_once("../database/categories.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = ['id'];
	foreach ($params as $param) {
		if (isset($_GET[$param])) {
			$params[$param] = $_GET[$param];
			continue;
		}
	}
    
    $param = ''."auctionsCategory";
    $param2 = ''."category";
    
    $ret = searchCategory($params['id']);
    $cat = getCategoryByID($params['id']);
    
    if ($ret != null) {
        $_SESSION['success_messages'][] = 'Search completed';
        $data = [$param => "success", $param2 => $cat[0]];
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