<?php
    if($_SERVER['REQUEST_METHOD']=='POST'){
    	require('../db.php');
        $username = $_POST['username'];
        $password = md5($_POST['password']);  
        $nome = $_POST['nome'];
        $cognome = $_POST['cognome'];
        $data = $_POST['data'];
	
   // print_r($_POST);
        $query = "INSERT INTO `utenti` (username, password, nome, cognome, dataNascita) VALUES ('$username', '$password', '$nome', '$cognome', '$data')";
        $result = mysqli_query($con, $query);
        
        if($result) {
        	echo "Registration successfully";
            header('Location: ./moodlamp.html');
        }
        else
        {
            header('Location: ./registrate.html');
        }
        
    }
?>