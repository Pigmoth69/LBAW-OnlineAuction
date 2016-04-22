<?php
    include_once '../config/init.php';
    
    $params = [ 'first_name', 'last_name', 'date', 'gender', 'e_mail', 'pass'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    if (register($params['first_name'] . " " . $params['last_name'], $params['date'], $params['gender'], $params['e_amil'], $params['pass']))
        header('Location: index.php');
    else //DEU ERRO
?>