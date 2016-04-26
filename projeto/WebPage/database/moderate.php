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
    
    function moderators() {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM UtilizadorModerador');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function getAllModsExcept($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM UtilizadorModerador WHERE id_utilizador != :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    function deleteMod($id) {
        global $conn;
        
        $mods = getAllModsExcept($id);
        if (count($mods) == 0) {
            return false;
        }
        
        $stmt = $conn->prepare('UPDATE HistoricoBanidos SET id_moderador = :id_mod WHERE id_moderador = :id');
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':id_mod', $mods[0]['id_utilizador']);
        $stmt->execute();
        
        $stmt = $conn->prepare('UPDATE Leilao SET id_moderador = :id_mod WHERE id_moderador = :id');
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':id_mod', $mods[0]['id_utilizador']);
        $stmt->execute();
        
        $stmt = $conn->prepare('DELETE FROM UtilizadorModerador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $retorno = $stmt->execute();
        return $retorno;
    }

?>