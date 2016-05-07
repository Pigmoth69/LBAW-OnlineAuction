<?php
    include_once("../config/init.php");
    include_once("../database/user.php");
    include_once("../utils/utils.php");
    include_once("../database/moderate.php");
    
    $params = [ 'first_nameEdit', 'last_nameEdit', 'birthdateEdit', 'genderEdit', 'emailEdit', 'previous_passwordEdit', 'passwordEdit', 'password_confirmationEdit', 'image'];
	foreach ($params as $param) {
		if (isset($_POST[$param])) {
			$params[$param] = $_POST[$param];
			continue;
		}
	}
    
    $filename =  $_FILES["image"]["name"];
    //printResponse($_FILES["image"]["name"], "editAdmin");
    
    if ( ($_FILES["image"]["type"] == "image/gif") || ($_FILES["image"]["type"] == "image/jpeg") || ($_FILES["image"]["type"] == "image/jpg") || ($_FILES["image"]["type"] == "image/png")  || ($_FILES["image"]["type"] == "image/pjpeg")) {
        if (file_exists($_FILES["image"]["name"])) {
            $_SESSION['error_messages'][] = 'File already exists';
            //printResponse("file name exists", "editAdmin");
            return false;
        }
        else {
            move_uploaded_file($_FILES["image"]["tmp_name"],"../images/users/".$filename);
        }
    }
    else {
        $_SESSION['error_messages'][] = 'Invalid type of file';
        //printResponse("invalid type of file", "editAdmin");
        return false;
    }
    
    $img = "../images/users/" . $filename;
    
    if ($params['password'] != $params['password_confirmation']) {
        $_SESSION['error_messages'][] = 'Passwords don\'t match';
        //printResponse("error on js", "editAdmin");
        header('Location : AdminPage.php');
        return false;
    }

    if (editAdmin($_SESSION['user'], $params['first_nameEdit'] . " " . $params['last_nameEdit'], $params['birthdateEdit'], $params['genderEdit'], $params['emailEdit'], $params['passwordEdit'], $img, $params['previous_passwordEdit'])) {
        $_SESSION['success_messages'][] = 'Profile edited successfully';
        //printResponse("success", "editAdmin");
        header('Location : AdminPage.php');
        return true;
    }
    else {
        $_SESSION['error_messages'][] = 'Password incorrect';
        //printResponse("wrong password", "editAdmin");
        header('Location : AdminPage.php');
        return false;
    }
?>