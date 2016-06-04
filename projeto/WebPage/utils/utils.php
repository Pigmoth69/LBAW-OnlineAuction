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
                return true;
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
    
    function printResponse($data) {
	    header('Content-Type: application/json');
	    echo json_encode($data);
	}
    
    function gen_uuid() {
        return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            // 32 bits for "time_low"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),

            // 16 bits for "time_mid"
            mt_rand( 0, 0xffff ),

            // 16 bits for "time_hi_and_version",
            // four most significant bits holds version number 4
            mt_rand( 0, 0x0fff ) | 0x4000,

            // 16 bits, 8 bits for "clk_seq_hi_res",
            // 8 bits for "clk_seq_low",
            // two most significant bits holds zero and one for variant DCE1.1
            mt_rand( 0, 0x3fff ) | 0x8000,

            // 48 bits for "node"
            mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff )
    );
}
?>