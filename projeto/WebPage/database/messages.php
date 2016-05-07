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
        $stmt = $conn->preapare('SELECT id_mensagem,id_recetor,data_mensagem FROM Mensagem WHERE Mensagem.id_emissor = :id_utilizador');
        $stmt->bindParam(':id_utilizador', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function getMessagesByReceptor($id) {
        global $conn;
        $stmt = $conn->preapare('SELECT id_mensagem,id_recetor,data_mensagem FROM Mensagem WHERE Mensagem.id_recetor = :id_utilizador');
        $stmt->bindParam(':id_utilizador', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }


?>