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
        $stmt = $conn->prepare('SELECT * FROM Leilao, EstadoLeilao WHERE id_leilao = :id AND EstadoLeilao.id_estado_leilao = Leilao.id_estado_leilao');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function auctions() {
        global $conn;
        $stmt = $conn->prepare('SELECT nome, nome_produto, id_leilao FROM Leilao, Utilizador WHERE Leilao.id_vendedor=Utilizador.id_utilizador');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function classificateAuction($user, $auction, $classification) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM ClassificacaoLeilao WHERE id_licitador = :user AND id_leilao = :auction');
        $stmt->bindParam(':user', $user, PDO::PARAM_INT);
        $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        
        if (count($result) > 0) {
            $stmt = $conn->prepare('UPDATE ClassificacaoLeilao SET (valor_classificacao) = (:classification) WHERE id_licitador = :user AND id_leilao = :auction');
            $stmt->bindParam(':classification', $classification, PDO::PARAM_INT);
            $stmt->bindParam(':user', $user, PDO::PARAM_INT);
            $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
            $stmt->execute();
            return true;
        }   
        else {
            $stmt = $conn->prepare('INSERT INTO ClassificacaoLeilao(id_licitador, id_leilao) VALUES(:user, :auction)');
            $stmt->bindParam(':user', $user, PDO::PARAM_INT);
            $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
            $stmt->execute();
            return true;
        }  
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
    
    function search($desc) {
        global $conn;
        $stmt = $conn->prepare('SELECT DISTINCT ON (Leilao.id_leilao) * FROM Leilao WHERE to_tsvector(\'english\', descricao) @@ to_tsquery(\'english\', :desc) OR to_tsvector(\'english\', nome_produto) @@ to_tsquery(\'english\', :desc)');
        $stmt->bindParam(':desc', $desc, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll();
    }
    
    function getStatus($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao,EstadoLeilao
                                WHERE Leilao.id_leilao = :id AND Leilao.id_estado_leilao=EstadoLeilao.id_estado_leilao');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) > 0)
            return $result[0]['estado_leilao'];
        else return false;
    }
    
    function isCancelled($id) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao,EstadoLeilao
                                WHERE Leilao.id_leilao = :id AND Leilao.id_estado_leilao=EstadoLeilao.id_estado_leilao
                                AND EstadoLeilao.estado_leilao!=\'cancelado\'');
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();
        if (count($result) > 0)
            return false;
        else return true;
    }
    
    function editAuction($auction, $name, $date, $category, $valor, $description, $img) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Categoria WHERE descricao = :category');
        $stmt->bindParam(':category', $category, PDO::PARAM_STR);
        $stmt->execute();
        $res = $stmt->fetchAll();
        $id_cat = $res[0]['id_categoria'];
        
        $stmt = $conn->prepare('UPDATE Leilao SET(nome_produto, descricao, imagem_produto, data_fim, valor_base, id_categoria)
                                = (:name, :description, :img, :date, :valor, :id_cat) WHERE id_leilao = :auction');
        $stmt->bindParam(':name', $name, PDO::PARAM_STR);
        $stmt->bindParam(':description', $description, PDO::PARAM_STR);
        $stmt->bindParam(':img', $img, PDO::PARAM_STR);
        $stmt->bindParam(':date', $date, PDO::PARAM_STR);
        $stmt->bindParam(':valor', $valor, PDO::PARAM_INT);
        $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
        $stmt->bindParam(':id_cat', $id_cat, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        return true;
    }
    
    function newAuction($user, $name, $date, $category, $valor, $description, $img) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Categoria WHERE descricao = :category');
        $stmt->bindParam(':category', $category, PDO::PARAM_STR);
        $stmt->execute();
        $res = $stmt->fetchAll();
        
        $id_cat = $res[0]['id_categoria'];
        $state = 'invalido';
        $n = null;
        
        $stmt = $conn->prepare('INSERT INTO EstadoLeilao(valor_atual, estado_leilao, motivo) VALUES(:valor, :state, :n) RETURNING id_estado_leilao');
        $stmt->bindParam(':valor', $valor, PDO::PARAM_INT);
        $stmt->bindParam(':state', $state, PDO::PARAM_STR);
        $stmt->bindParam(':n', $n, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        
        $id_est = $res[0]['id_estado_leilao'];
        
        $stmt = $conn->prepare('SELECT * FROM UtilizadorModerador');
        $stmt->execute();
        $res = $stmt->fetchAll();
        $id_mod = $res[0]['id_utilizador'];
        
        $stmt = $conn->prepare('INSERT INTO Leilao(nome_produto, descricao, imagem_produto, data_inicio, data_fim, valor_base, id_vendedor, id_estado_leilao, id_categoria, id_moderador)
                                VALUES(:name, :description, :img, CURRENT_TIMESTAMP, :date, :valor, :user, :id_est, :id_cat, :id_mod) RETURNING id_leilao');
        $stmt->bindParam(':name', $name, PDO::PARAM_STR);
        $stmt->bindParam(':description', $description, PDO::PARAM_STR);
        $stmt->bindParam(':img', $img, PDO::PARAM_STR);
        $stmt->bindParam(':date', $date, PDO::PARAM_STR);
        $stmt->bindParam(':valor', $valor, PDO::PARAM_INT);
        $stmt->bindParam(':user', $user, PDO::PARAM_INT);
        $stmt->bindParam(':id_est', $id_est, PDO::PARAM_INT);
        $stmt->bindParam(':id_cat', $id_cat, PDO::PARAM_INT);
        $stmt->bindParam(':id_mod', $id_mod, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetchAll();
        return $res[0]['id_leilao'];
    }
    
    function searchCategory($id) {
        global $conn;
        if ($id == -1) {
            $stmt = $conn->prepare('SELECT * FROM Leilao');
            $stmt->execute();
            return $stmt->fetchAll();
        }
        else {
            $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_categoria = :id');
            $stmt->bindParam(':id', $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetchAll();  
        }
    }
    
    function getAuctionsToValidate() {
        global $conn;
        $stmt = $conn->prepare('SELECT nome_produto,id_leilao,nome,id_utilizador FROM Leilao,Utilizador,EstadoLeilao
                                WHERE Leilao.id_estado_leilao=EstadoLeilao.id_estado_leilao
                                AND EstadoLeilao.estado_leilao=\'invalido\' AND Leilao.id_vendedor=Utilizador.id_utilizador');
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }
    
    function bid($user, $auction, $amount) {
        global $conn;
        $stmt = $conn->prepare('SELECT * FROM Leilao WHERE id_leilao = :auction');
        $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetchAll();   
        $fal = false;
        
        if (count($result) == 0)
            return false;
        else {
            $stmt = $conn->prepare('SELECT * FROM Licitacao WHERE id_leilao = :id_leilao ORDER BY valor_licitacao DESC');
            $stmt->bindParam(':id_leilao', $auction, PDO::PARAM_INT);
            $stmt->execute();
            $res = $stmt->fetchAll();
            
            if ($res[0]['valor_licitacao'] >= $amount)
                return false;
            else {
                $stmt = $conn->prepare('INSERT INTO Licitacao(id_leilao, id_utilizador, data_licitacao, valor_licitacao, vencedor) VALUES(:auction, :user, CURRENT_TIMESTAMP, :amount, :fal)');
                $stmt->bindParam(':auction', $auction, PDO::PARAM_INT);
                $stmt->bindParam(':user', $user, PDO::PARAM_INT);
                $stmt->bindParam(':amount', $amount, PDO::PARAM_INT);
                $stmt->bindParam(':fal', $fal, PDO::PARAM_BOOL);
                $stmt->execute();
                return true;
            }
        }
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

    /*function timeLeftOnAuction($id) {
        $creationDate = creationDateAuction($id);
        $endDate = endDateAuction($id);
        $datetime1 = strtotime($creationDate);                 //data inicio
        $datetime2 = strtotime($endDate);                      //end data
        $datetime3 = strtotime(date("Y/m/d H:i:s", time()));   //current time
        $currentSeconds = $datetime3 - $datetime1;
        $totalSeconds = $datetime2 - $datetime1;
        return $totalSeconds - $currentSeconds;
    }*/

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
        $datetime3 = strtotime(date("Y/m/d H:i:s", time()));   //current time
        $currentSeconds = $datetime3 - $datetime1;
        $totalSeconds = $datetime2 - $datetime1;
	    $result = array('totalTime' => $totalSeconds,'currentSeconds' => $currentSeconds);
	    echo "<script>\n";
		echo 'var progressBarDATA = ' . json_encode($result, JSON_PRETTY_PRINT) . ';';
		echo "\n</script>";
	    return $result;
    }
    
    
?>