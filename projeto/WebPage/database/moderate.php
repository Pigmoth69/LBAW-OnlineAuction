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
        
        $conn->beginTransaction();
        try {
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
            $conn->commit();
            return $retorno;
        }
        catch (Exception $e) {
            echo $e;
            $conn->rollBack();
        }
    }
    
    function registerMod($name, $date, $gender, $mail, $password, $pais) {
        global $conn;
		$stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail');
		$stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
		$stmt->execute();
		$result = $stmt->fetchAll();
		if (count($result) > 0) {
			return false;
		}
        
        $stmt = $conn->prepare('SELECT id_pais FROM Pais WHERE nome_pais = :pais');
        $stmt->bindParam(':pais', $pais, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) === 0) {
            return false;
        }
        else $id_pais = $result[0]['id_pais'];
        
        $empty = "";
        $zero = 0;
        $false = false;
        $pass = hash("sha256", $password);
        
        $conn->beginTransaction();
        try {
            $stmt = $conn->prepare('INSERT INTO Utilizador(nome, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(:nome, :descricao, :genero, :imagem_utilizador, :datanasc, :e_mail, :password, :classificacao, :banido, :id_pais)');
            $stmt->bindParam(':nome', $name, PDO::PARAM_STR);
            $stmt->bindParam(':descricao', $empty, PDO::PARAM_STR);
            $stmt->bindParam(':genero', $gender, PDO::PARAM_STR);
            $stmt->bindParam(':imagem_utilizador', $empty, PDO::PARAM_STR);
            $stmt->bindParam(':datanasc', $date, PDO::PARAM_STR);
            $stmt->bindParam(':e_mail', $mail, PDO::PARAM_STR);
            $stmt->bindParam(':password', $pass, PDO::PARAM_STR);
            $stmt->bindParam(':classificacao', $zero, PDO::PARAM_INT);
            $stmt->bindParam(':banido', $false, PDO::PARAM_BOOL);
            $stmt->bindParam(':id_pais', $id_pais, PDO::PARAM_INT);
            $stmt->execute();
            
            $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail');
            $stmt->bindParam('mail', $mail, PDO::PARAM_STR);
            $stmt->execute();
            $result = $stmt->fetchAll();
            $id = $result[0]['id_utilizador'];
            
            $stmt = $conn->prepare('INSERT INTO UtilizadorModerador(id_utilizador) VALUES(:id)');
            $stmt->bindParam('id', $id, PDO::PARAM_INT);
            $retorno = $stmt->execute();
            $conn->commit();
            return $retorno;
        }
        catch (Exception $e) {
            echo $e;
            $conn->rollBack();
        }
    }
?>