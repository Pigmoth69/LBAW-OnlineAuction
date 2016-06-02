<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");
    
    $params = [ 'nameAuction', 'dateAuction', 'categoryAuction', 'valorAuction', 'descriptionAuction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    
    $filename =  $_FILES["image"]["name"];
    
    if ( ($_FILES["image"]["type"] == "image/gif") || ($_FILES["image"]["type"] == "image/jpeg") || ($_FILES["image"]["type"] == "image/jpg") || ($_FILES["image"]["type"] == "image/png")  || ($_FILES["image"]["type"] == "image/pjpeg")) {
        if (file_exists($_FILES["image"]["name"])) {
            $_SESSION['error_messages'][] = 'File already exists';
            return false;
        }
        else {
            move_uploaded_file($_FILES["image"]["tmp_name"],"../images/users/".$filename);
        }
    }
    else {
        $_SESSION['error_messages'][] = 'Invalid type of file';
        return false;
    }
    
    $img = "../images/auction/" . $filename;
    
    if ($params['nameAuction'] == "" || $params['dateAuction'] == "" || $params['categoryAuction'] == "" || $params['valorAuction'] == "") {
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