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
    
    function getAuctionByID($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function isHighestBid($id_leilao, $id_licitador) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id_leilao ORDER BY valor_licitacao DESC');
        $stmt->bindParam(':id_leilao', $id_leilao, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        if ($result[0]['id_licitacao'] == $id_licitador) {
            return true;
        }
        else return false;
    }

    function getAuctionsByUserID($id) {        
        global $conn;
		$stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_vendedor = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        return $result;
    }
    
    function getAuctionsByLiciteedID($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_utilizador = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $auction = $stmt->fetchAll();
        
        return $auction;
    }
    
    function getNoLiciteesOnAuction($id) {
        global $conn;
		$stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        return count($result);
    }
    
    function isAuctionSold($id) {
        global $conn;
		$stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        
        foreach($result as $res) {
            if ($res['vencedor'])
                return true;
        }
        return false;
    }
    
    function bestAuctions() {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao ORDER BY valor_base DESC');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
?>