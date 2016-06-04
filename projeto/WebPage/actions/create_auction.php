<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = [ 'nameAuction', 'dateAuction', 'categoryAuction', 'valorAuction', 'descriptionAuction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
    }
    
    $filename =  gen_uuid();
    
    if ( ($_FILES["imageAuction"]["type"] == "image/gif") || ($_FILES["imageAuction"]["type"] == "image/jpeg") || ($_FILES["imageAuction"]["type"] == "image/jpg") || ($_FILES["imageAuction"]["type"] == "image/png")  || ($_FILES["imageAuction"]["type"] == "image/pjpeg"))
            move_uploaded_file($_FILES["imageAuction"]["tmp_name"],"../images/auction/".$filename);
    else {
        $_SESSION['error_messages'][] = 'Invalid type of file';
        return false;
    }
    
    $img = "../images/auction/" . $filename;
    
    if ($params['nameAuction'] == "" || $params['dateAuction'] == "" || $params['categoryAuction'] == "" || $params['valorAuction'] == "" || isMod($_SESSION['user']) || isAdmin($_SESSION['user'])) {
        $_SESSION['error_messages'][] = 'Passwords don\'t match';
        header('Location: ../index.php');
        return false;
    }
    
    $val = newAuction($_SESSION['user'], $params['nameAuction'], $params['dateAuction'], $params['categoryAuction'], $params['valorAuction'], $params['descriptionAuction'], $img);
    if ($val > 0) {
        $_SESSION['success_messages'][] = 'Auction created successfully';
        header('Location: ../pages/ItemPageSeller.php?idPage=' . $val);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Error creating auction';
        return false;
    }
?>