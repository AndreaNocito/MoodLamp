<?php
 if($_SERVER['REQUEST_METHOD']=='POST'){
 		require('db.php');
        $username = $_POST['username'];
        $alias = $_POST['alias'];  
 
 		
        
        $query = "DELETE FROM `associazioni` WHERE idUtente = '$username' AND alias = '$alias'";
        $result = mysqli_query($con, $query);
  
    }
 ?>
