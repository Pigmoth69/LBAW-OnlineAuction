<?php

$path = '../config/init.php';

    if(!file_exists($path))
            $path = 'config/init.php';
    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}

    function getAllCountries() {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Pais');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
?>