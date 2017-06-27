<?php
$location = "localhost";
$user = "moodlamp";
$password = "vibtetetke98";
$database = "my_moodlamp";

$con = mysqli_connect($location, $user, $password, $database);
if(mysqli_connect_errno())
	echo "Failed to connect to database";
?>