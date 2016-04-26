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

    function compareLogin($mail, $pass_given) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail AND password = :pass');
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $pass = hash("sha256", $pass_given);
        $stmt->bindParam(':pass', $pass, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) === 0) {
            return -1;
        }
        else return $result[0]['id_utilizador'];
    }
    
    function register($name, $date, $gender, $mail, $password, $pais) {
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
        $result = $stmt->fetchAll();
        
        return true;
    }
    
    function editAdmin($id, $name, $date, $gender, $mail, $password, $image, $previous) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $pass = hash("sha256", $previous);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        if (!($result[0]['id_utilizador'] == $id)) {
            return false;
            if (!($result[0]['password'] == $pass)) {
                return false;
            }
        }
        
        $stmt = $conn->prepare('UPDATE Utilizador SET (nome, genero, imagem_utilizador, datanasc , e_mail, password) = (:name, :gender, :image, :date, :mail, :password) WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':name', $name, PDO::PARAM_STR);
        $stmt->bindParam(':date', $date, PDO::PARAM_STR);
        $stmt->bindParam(':gender', $gender, PDO::PARAM_STR);
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $pass_t = hash("sha256", $password);
        $stmt->bindParam(':password', $pass_t, PDO::PARAM_STR);
        $stmt->bindParam(':image', $image, PDO::PARAM_STR);
        $stmt->execute();
        return true;
    }
    
    function printResponse($value, $reg) {
		$param = ''.$reg;
	    $data = [ $param => $value];
	    header('Content-Type: application/json');
	    echo json_encode($data);
	}
    
    function getInfoByID($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function isAdmin($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM UtilizadorAdministrador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) == 0)
            return false;
        else return true;
    }
    
?>