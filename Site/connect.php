<?php
if($_SERVER['REQUEST_METHOD']=='POST'){
        require('db.php');
        $code = $_POST['code'];
        $password = $_POST['password'];
        $alias = $_POST['alias'];
        $username = $_POST['username'];
 		
        //Controllare se la lampada esiste
          $queryLamp = "SELECT * FROM `lampade` WHERE id='$code' AND password = '$password'";
          $risultato = mysqli_query($con, $queryLamp);

          if(mysqli_num_rows($risultato)=== 1)
          {
          	//Controllare se l'utente ha già associato quella lampada
          	$queryControllo1 = "SELECT * FROM `associazioni` WHERE idUtente = '$username' AND idLampada = '$code'";
            $controllo1 = mysqli_query($con, $queryControllo1);
            if(mysqli_num_rows($controllo1) < 1) 
            {
				//Controllare se l'utente ha già usato l'alias
                $queryControllo = "SELECT * FROM `associazioni` WHERE idUtente='$username' AND alias = '$alias'";
                $controllo = mysqli_query($con, $queryControllo);
                if(mysqli_num_rows($controllo)<1)
                {
                    $queryInserimento = "INSERT INTO `associazioni` (id, idUtente, idLampada, alias) VALUES (NULL, '$username', '$code', '$alias')";
                    $result = mysqli_query($con, $queryInserimento);
					if($result === true)
                        echo "Connection successfully";
                    else
                        echo "Connection failed";
               }
               else
                  echo "Alias already used";
                  }
                else
                	echo "Lamp already connected";
          }
          else
              echo "Lamp doesn't exist";
 		}
?>