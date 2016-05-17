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
        $stmt = $conn->prepare('SELECT id_leilao, nome_produto, valor_base, data_fim, id_vendedor, descricao, imagem_produto FROM Leilao, EstadoLeilao WHERE Leilao.data_fim > now() AND Leilao.data_fim <= now() + \'365 day\'::INTERVAL AND EstadoLeilao.estado_leilao = \'aberto\' AND Leilao.id_estado_leilao = EstadoLeilao.id_estado_leilao LIMIT 9');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function getClassificationAuction($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM ClassificacaoLeilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        $avg = 0;

        if (count($res) == 0)
            return $avg;
        
        foreach($res as $r) {
            $avg = $avg + $r['valor_classificacao'];
        }
        $avg = $avg / count($res);
        
        return $avg;
    }
    
    function getHighestBid($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id ORDER BY valor_licitacao DESC');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        
        if (count($res) == 0) {
            $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :id');
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetchAll();
            return $result[0]['valor_base'];
        }
        else return $res[0]['valor_licitacao'];
    }
    
    function timeLeftOnAuction($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT data_fim FROM Leilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        
        $stmt = $conn->prepare('SELECT age(:data_fim::timestamp, CURRENT_TIMESTAMP)');
        $stmt->bindParam(':data_fim', $res[0]["data_fim"]);
        $stmt->execute();
        $resu = $stmt->fetchAll();
        
        return $resu[0]["age"];
    }
    
    
?>