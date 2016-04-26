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
    
    function deleteMod($id) {
        global $conn;
        $stmt = $conn->prepare('DELETE FROM UtilizadorModerador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $retorno = $stmt->execute();
        return $retorno;
    }

?>