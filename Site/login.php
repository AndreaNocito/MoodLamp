<?php
 if($_SERVER['REQUEST_METHOD']=='POST'){
 		require('../db.php');
        $username = $_POST['username'];
        $password = $_POST['password'];  
 
 		
        
        $query = "SELECT * FROM `utenti` WHERE username = '$username' AND password = '$password'";
        $result = mysqli_query($con, $query);
        if(!is_bool($result)) {
        	//$result=$result->fetch_all();
        	
        	header("Location: ./home.php?user=".$username);
        }
  
    }
 ?>
