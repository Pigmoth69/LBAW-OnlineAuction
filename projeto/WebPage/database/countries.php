<?php
    $path = '../config/init.php';

    if(!file_exists($path))
        $path = 'config/init.php';
    if(!file_exists($path))
        $path = '../../config/init.php';
    if(!file_exists($path))
        $path = '../../../config/init.php';     
    try {
        include_once($path);
    }
    catch(Exception $e) {
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
    
    function getNameCountryByID($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Pais WHERE id_pais = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
?>