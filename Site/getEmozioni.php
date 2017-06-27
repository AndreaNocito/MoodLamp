<?php

 
 		
 		require('db.php');
        $queryEmozioni = "SELECT id,emozione FROM `emozioni`";
        $result = mysqli_query($con, $queryEmozioni);
       	$stampare = "";
        
          while(list($id, $emozione) = mysqli_fetch_row($result))
          {
              $stampare = $stampare.$id.";".$emozione."@";
          }
          echo $stampare;
        

?>