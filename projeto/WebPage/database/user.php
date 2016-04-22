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
        $cost = 10;
        // Create a random salt
        $salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');
        // "$2a$" Means we're using the Blowfish algorithm. The following two digits are the cost parameter.
        $salt = sprintf("$2a$%02d$", $cost) . $salt;
        // Hash the password with the salt
        $hash = crypt($password, $salt);
        return $hash;
    }

    function getIdByUserPass($mail, $pass) {
        global $db;
        $stmt = $db->prepare('SELECT * FROM Utilizador WHERE e_mail = :mail');
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
?>