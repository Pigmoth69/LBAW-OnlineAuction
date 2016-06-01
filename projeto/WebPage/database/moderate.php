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
    
    function isMod($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM UtilizadorModerador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) > 0)
            return true;
        else return false;
    }
    
    function validAuction($id, $validate, $auction) {
        global $conn;
        if ($validate == "validate") {
            $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :id');
            $stmt->bindParam(':id', $auction, PDO::PARAM_INT);
            $stmt->execute();
            $res = $stmt->fetchAll();
            
            $stmt = $conn->prepare('UPDATE EstadoLeilao SET estado_leilao=\'aberto\' WHERE EstadoLeilao.id_estado_leilao=:id');
            $stmt->bindParam(':id', $res[0]['id_estado_leilao']);
            $stmt->execute();
            return true;
        }
        else if ($validate == "not validate") {
            $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :id');
            $stmt->bindParam(':id', $auction, PDO::PARAM_INT);
            $stmt->execute();
            $res = $stmt->fetchAll();
             
            $stmt = $conn->prepare('UPDATE EstadoLeilao SET estado_leilao=\'invalido\' WHERE EstadoLeilao.id_estado_leilao=:id');
            $stmt->bindParam(':id', $res[0]['id_estado_leilao']);
            $stmt->execute(); 
            return true;
        }
        else return false;
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
            
            $stmt = $conn->prepare('DELETE FROM Utilizador WHERE id_utilizador = :id');
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
    
    function reportUser($reporter, $reported, $motive) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $reporter, PDO::PARAM_INT);
        $stmt->execute();
        $mail_reporter = $stmt->fetchAll();
        if (count($mail_reporter) == 0)
            return -1;
            
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $reported, PDO::PARAM_INT);
        $stmt->execute();
        $mail_reported = $stmt->fetchAll();
        if (count($mail_reported) == 0)
            return -1;
        
        $mods = moderators();
        $mod = $mods[0]['id_utilizador'];
        
        $title = 'Report On User';
        $body = 'Hello, i am user with id ' . $mail_reporter[0]['id_utilizador'] . ' and i want to report user with id ' . $mail_reported[0]['id_utilizador'] . ' because: ' . "\n" . $motive;
        $stmt = $conn->prepare('INSERT INTO Mensagem(id_emissor, id_recetor, titulo, conteudo) VALUES(:id, :id_recetor, :title, :body)');
        $stmt->bindParam(':id', $reporter, PDO::PARAM_INT);
        $stmt->bindParam(':id_recetor', $mod, PDO::PARAM_INT);
        $stmt->bindParam(':title', $title, PDO::PARAM_STR);
        $stmt->bindParam(':body', $body, PDO::PARAM_STR);
        $stmt->execute();
        return $mod;
    }
    
    function reportAuction($reporter, $auction, $motive) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $reporter, PDO::PARAM_INT);
        $stmt->execute();
        $mail_reporter = $stmt->fetchAll();
        if (count($mail_reporter) == 0)
            return -1;
            
        $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $auction, PDO::PARAM_INT);
        $stmt->execute();
        $mail_reported = $stmt->fetchAll();
        if (count($mail_reported) == 0)
            return -1;
        
        $mods = moderators();
        $mod = $mods[0]['id_utilizador'];
        
        $title = 'Report On Auction';
        $body = 'Hello, i am user with id ' . $mail_reporter[0]['id_utilizador'] . ' and i want to report auction with id ' . $mail_reported[0]['id_leilao'] . ' because: ' . "\n" . $motive;
        $stmt = $conn->prepare('INSERT INTO Mensagem(id_emissor, id_recetor, titulo, conteudo) VALUES(:id, :id_recetor, :title, :body)');
        $stmt->bindParam(':id', $reporter, PDO::PARAM_INT);
        $stmt->bindParam(':id_recetor', $mod, PDO::PARAM_INT);
        $stmt->bindParam(':title', $title, PDO::PARAM_STR);
        $stmt->bindParam(':body', $body, PDO::PARAM_STR);
        $stmt->execute();
        return $mod;
    }
?>