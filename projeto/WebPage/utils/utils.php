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
?>