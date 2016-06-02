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

    function getAllCategories() {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Categoria');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function getCategoryByID($id) {
        global $conn;
        if ($id != -1) {
            $stmt = $conn->prepare('SELECT * FROM Categoria WHERE id_categoria = :id');
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();
        }
        else {
            return -1;
        }
    }
    
    function getNoElementsOfCategory($id_categoria) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_categoria = :id_categoria');
        $stmt->bindParam(':id_categoria', $id_categoria, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
       
        return count($result);
    }
?>