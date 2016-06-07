<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../database/auctions.php");
    include_once("../database/moderate.php");
    include_once("../utils/utils.php");

  $params = [ 'nameEditAuction', 'idLeilao', 'dateEditAuction', 'categoryEditAuction', 'valorEditAuction', 'descriptionEditAuction'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
    }

    $filename =  gen_uuid();

    if ( ($_FILES["imageEditAuction"]["type"] == "image/gif") || ($_FILES["imageEditAuction"]["type"] == "image/jpeg") || ($_FILES["imageEditAuction"]["type"] == "image/jpg") || ($_FILES["imageEditAuction"]["type"] == "image/png")  || ($_FILES["imageEditAuction"]["type"] == "image/pjpeg"))
            move_uploaded_file($_FILES["imageEditAuction"]["tmp_name"],"../images/auction/".$filename);
    else {
        $_SESSION['error_messages'][] = 'Invalid type of file';
        return false;
    }

    $img = "../images/auction/" . $filename;

    if ($params['nameEditAuction'] == "" || $params['dateEditAuction'] == "" || $params['categoryEditAuction'] == "" || $params['valorEditAuction'] == "" || isMod($_SESSION['user']) || isAdmin($_SESSION['user']) || !isOwner($_SESSION['user'], $params['idLeilao'])) {
        $_SESSION['error_messages'][] = 'Passwords don\'t match';
        header('Location: ../index.php');
        return false;
    }

    $val = editAuction($params['idLeilao'], $params['nameEditAuction'], $params['dateEditAuction'], $params['categoryEditAuction'], $params['valorEditAuction'], $params['descriptionEditAuction'], $img);
    if ($val) {
        $_SESSION['success_messages'][] = 'Auction edited successfully';
        header('Location: ../pages/ItemPageSeller.php?idPage=' . $params['idLeilao']);
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Error editing auction';
        header("Location: ../index.php");
        return false;
    }
?>
