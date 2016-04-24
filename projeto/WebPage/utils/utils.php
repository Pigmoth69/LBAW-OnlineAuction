<?php
    function isLoggedIn() {
        if (count($_SESSION) > 0 && $_SESSION['user'] != '')
            return true;
        else return false;
    }
?>