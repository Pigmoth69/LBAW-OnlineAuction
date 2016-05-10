<?php
    function isLoggedIn() {
        if (count($_SESSION) > 0 && $_SESSION['user'] != '')
            return true;
        else return false;
    }
    
    function uploadImage() {
        $filename=  $_FILES["image"]["name"];
        if ( ($_FILES["image"]["type"] == "image/gif") || ($_FILES["image"]["type"] == "image/jpeg") || ($_FILES["image"]["type"] == "image/png")  || ($_FILES["image"]["type"] == "image/pjpeg")) {
            if (file_exists($_FILES["image"]["name"]))
                echo 'File name exists';
            else {
            move_uploaded_file($_FILES["image"]["tmp_name"],"../images/users/".$filename);
            //echo 'Upload successfull';
            }
        }
        else {
            echo 'Invalid file';
            return false;
        }
    }
    
    function generateRandomString($length = 10) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    
    function printResponse($value, $reg) {
		$param = ''.$reg;
	    $data = [ $param => $value];
	    header('Content-Type: application/json');
	    echo json_encode($data);
	}
    
    function printResponse($value, $value1, $reg, $reg1) {
		$param = ''.$reg;
        $param1 = ''.$reg1;
	    $data = [ $param => $value, $param1 => $value1];;
	    header('Content-Type: application/json');
	    echo json_encode($data);
	}
?>