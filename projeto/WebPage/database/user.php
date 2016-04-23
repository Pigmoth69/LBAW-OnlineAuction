<?php
    $path = '../config/init.php';
    /*
    if(!function_exists('hash_equals')) {
        function hash_equals($str1, $str2) {
            if(strlen($str1) != strlen($str2)) {
            return false;
            } else {
            $res = $str1 ^ $str2;
            $ret = 0;
            for($i = strlen($res) - 1; $i >= 0; $i--) $ret |= ord($res[$i]);
            return !$ret;
            }
        }
    }
    */

    if(!file_exists($path))
            $path = 'config/init.php';
    try {
        include_once($path);
    }
    catch(PDOException $e) {
		echo $e;
		return -1;
	}

    function compareLogin($mail, $pass_given) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail AND password = :pass');
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $password = hash('sha256', $pass_given);
        $stmt->bindParam(':pass', $password);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) === 0) {
            return -1;
        }
        else return getIdByUserPass($mail, $pass_given);
    }

    function getIdByUserPass($mail, $pass) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail AND password = :pass');
        $stmt->bindParam(':mail', $mail, PDO::PARAM_STR);
        $password = hash('sha256', $pass);
        $stmt->bindParam(':pass', $password);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        if (count($result) == 0) {
            return -1;
        }
        else return count[0]['id_utilizador'];
    }
    /*
    function register($name, $date, $gender, $mail, $password, $pais) {
        //sleep(10);
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
        $pass = hash('sha256', $password);
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
    */
    
    function hashPassword($password, $cost) {
        // Create a random salt
        $salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
        // "$2a$" Means we're using the Blowfish algorithm. The following two digits are the cost parameter.
        $salt = sprintf("$2a$%02d$", $cost) . $salt;
        // Hash the password with the salt
        $hash = crypt($password, $salt);
        return $hash;
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
        $pass = hashPassword($password, 10);
        
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
    
    function getInfoByID($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
?>