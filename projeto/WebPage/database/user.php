<?php
    include_once('../config/init.php');

    function compareLogin($mail, $pass_given) {
        global $conn;
        $stmt = $conn->prepare('SELECT password FROM Utilizador WHERE e_mail = :mail');
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) === 0) {
            return -1;
        }
        if (hash_equals($result[0]['password'], crypt($pass_given, $result[0]['password'])) ) {
            return getIdByUserPass($mail, $pass_given);
        }
    }

    function hashPassword($password, $cost) {
        // Create a random salt
        $salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
        // "$2a$" Means we're using the Blowfish algorithm. The following two digits are the cost parameter.
        $salt = sprintf("$2a$%02d$", $cost) . $salt;
        // Hash the password with the salt
        $hash = crypt($password, $salt);
        return $hash;
    }

    function getIdByUserPass($mail, $pass) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail');
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        if (count($result) == 0)
            return false;
            
        if (hash_equals($result[0]['password'], crypt($pass, $result[0]['password'])) ) {
            return $result[0]['id_utilizador'];
        }
        else return -1;
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
        $pass = hashPassword($password, 10);
        
        $stmt = $conn->prepare('INSERT INTO Utilizador(name, descricao, genero, imagem_utilizador, datanasc, e_mail, password, classificacao, banido, id_pais) VALUES(:name, :descricao, :genero, :imagem_utilizador, :datanasc, :e_mail, :password, :classificacao, :banido, :id_pais)');
        $stmt->bindParam(':name', $name, PDO::PARAM_STR);
        $stmt->bindParam(':descricao', $empty, PDO::PARAM_STR);
        $stmt->bindParam(':genero', $gender, PDO::PARAM_STR);
        $stmt->bindParam(':imagem_utilizador', $empty, PDO::PARAM_STR);
        $stmt->bindParam(':datanasc', $date, PDO::PARAM_STR);
        $stmt->bindParam(':e_mail', $mail, PDO::PARAM_STR);
        $stmt->bindParam(':password', $pass, PDO::PARAM_STR);
        $stmt->bindParam(':classificaco', $zero, PDO::PARAM_INT);
        $stmt->bindParam(':banido', false, PDO::PARAM_BOOL);
        $stmt->bindParam(':id_pais', $id_pais, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        return true;
    }
?>