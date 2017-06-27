<?php
    if($_SERVER['REQUEST_METHOD']=='POST')
    {
    	require('db.php');
        $username = $_POST['username'];
        $lampada = $_POST['$lampada'];
        $gruppo = $_POST['$gruppo'];

       
        $queryGruppo = "SELECT id FROM `appartenenze` WHERE (idGruppo='$gruppo' AND idLampadaAssociata = (SELECT id FROM `associazioni` WHERE (idUtente = '$utente' AND alias='$lampada')))";
        $result2 = mysqli_query($con, $queryGruppo);
        if($result2 === false)
       	{
        	$query = "INSERT INTO `appartenenze` (id, idGruppo, idLampadaAssociata) VALUES (NULL, '$gruppo', (SELECT id FROM `associazioni` WHERE (idUtente = '$utente' AND alias='$lampada')))";
       		$result3 = mysqli_query($con, $query);
        }
        else
           	echo "Lamp already assigned to this group";
      }
?>