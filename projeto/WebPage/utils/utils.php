<?php
    function isLoggedIn() {
        session_start();
        if (count($_SESSION) > 0) {
            return true;
        else return false;
    }

?>