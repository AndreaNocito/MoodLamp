<?php
 if($_SERVER['REQUEST_METHOD']=='POST'){
 		require('db.php');
        $username = $_POST['username'];
          
 		$queryLampada = "SELECT idEmozione,idColore FROM `preferenze` WHERE idUtente = '$username'";
        $result = mysqli_query($con, $queryLampada);
        
        $stampare = "";
        
        
          while(list($idEmozione, $idColore) = mysqli_fetch_row($result))
          {
              $stampare = $stampare.$idEmozione.";".$idColore."@";
              

          }
          echo $stampare;
        
        
    }
    ?>