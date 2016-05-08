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
    
    function getMessagesByEmissor($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT id_mensagem,titulo,id_recetor,data_mensagem FROM Mensagem WHERE Mensagem.id_emissor = :id_utilizador');
        $stmt->bindParam(':id_utilizador', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function getMessagesByReceptor($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT id_mensagem,titulo,id_emissor,data_mensagem FROM Mensagem WHERE Mensagem.id_recetor = :id_utilizador');
        $stmt->bindParam(':id_utilizador', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function sendMessage($id, $e_mail, $title, $body) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE e_mail = :e_mail');
        $stmt->bindParam(':e_mail', $e_mail, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) == 0)
            return false;
            
        $id_recetor = $result[0]['id_utilizador'];

        $stmt = $conn->prepare('INSERT INTO Mensagem(id_emissor, id_recetor, titulo, conteudo) VALUES(:id, :id_recetor, :title, :body)');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':id_recetor', $id_recetor, PDO::PARAM_INT);
        $stmt->bindParam(':title', $title, PDO::PARAM_STR);
        $stmt->bindParam(':body', $body, PDO::PARAM_STR);
        $stmt->execute();
        return true;
    }


?>