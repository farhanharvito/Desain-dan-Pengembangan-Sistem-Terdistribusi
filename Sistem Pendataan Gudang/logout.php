<?php
	session_start();
	session_unset($_SESSION['admin_username']);
	session_unset($_SESSION['admin_password']);
	header ("location:index.php");

?>