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
    
    function isOwner($id_vendedor, $id_leilao) {
        global $conn;
        $stmt = $conn->prepare('SELECT id_leilao FROM Leilao WHERE id_vendedor = :id_vendedor');
        $stmt->bindParam(':id_vendedor', $id_vendedor, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        foreach ($res as $r) {
            if ($id_leilao == $r['id_leilao']) {
                return true;
            }
        }
        return false;
    }
    
    function getLiciteesOnAuction($id) {
        global $conn;
        $ret = array();
		$stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        
        foreach ($result as $r) {
            $stmt = $conn->prepare('SELECT * FROM Utilizador WHERE id_utilizador = :id');
            $stmt->bindParam(':id', $r['id_utilizador'], PDO::PARAM_INT);
            $stmt->execute();
            $res = $stmt->fetchAll();
            $t = array_merge($res[0], $r);
            $ret[] = $t;
        }
        return $ret;
    }
    
    function getTimeDiffOnLic($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_licitacao = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        
        $stmt = $conn->prepare('SELECT age(CURRENT_TIMESTAMP, :data_licitacao::timestamp)');
        $stmt->bindParam(':data_licitacao', $result[0]["data_licitacao"]);
        $stmt->execute();
        $resu = $stmt->fetchAll();
        return $resu[0]["age"];
    }

    function getAuctionsByUserID($id) {        
        global $conn;
		$stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_vendedor = :id');
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		$result = $stmt->fetchAll();
        return $result;
    }
    
    function getTotalSales($id) {
        global $conn;
        $contador = 0;
        $auctions = getAuctionsByUserID($id);
        foreach($auctions as $auction) {
            $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id AND vencedor = TRUE');
            $stmt->bindParam(':id', $auction['id_leilao'], PDO::PARAM_INT);
            $stmt->execute();
            $res = $stmt->fetchAll();
            if (count($res) > 0) {
                $contador = $contador + 1;
            }
        }
        return $contador;
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

    function creationDateAuction($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT data_inicio FROM Leilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();     
        return $res[0]['data_inicio'];
    }

    function endDateAuction($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT data_fim FROM Leilao WHERE id_leilao = :id');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();     
        return $res[0]['data_fim'];
    }
    function progressBarData($id){
        $creationDate = creationDateAuction($id);
        $endDate = endDateAuction($id); 
        date_default_timezone_set('Europe/London');
        $datetime1 = strtotime($creationDate);                 //data inicio
        $datetime2 = strtotime($endDate);                      //end data
        $datetime3 = strtotime(date("Y/m/d h:i:s", time()));   //current time
        $currentSeconds = $datetime3 - $datetime1;
        $totalSeconds = $datetime2 - $datetime1;
	    $result = array('totalTime' => $totalSeconds,'currentSeconds' => $currentSeconds);
        print_r(date("Y/m/d h:i:s", time()));
	    echo "<script>\n";
		echo 'var progressBarDATA = ' . json_encode($result, JSON_PRETTY_PRINT) . ';';
		echo "\n</script>";
	    return $result;
    }
    
    
?>