<?php
    if($_SERVER['REQUEST_METHOD']=='POST'){
    	require('db.php');
        $username = $_POST['username'];
        $idEmozione = $_POST['emozione'];  
        $idColore = $_POST['colore'];

		$query = "UPDATE `preferenze` SET idColore = '$idColore' WHERE idUtente='$username' AND idEmozione='$idEmozione'";
        $result = mysqli_query($con, $query);
        
        
    }
?>