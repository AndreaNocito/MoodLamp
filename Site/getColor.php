<?php
//	print_r($_GET);

require('../db.php');

$query = "SELECT stato,display FROM lampade WHERE id = '".$_GET['id']."'";// AND password = '".$_GET['password']."'";
$result = mysqli_query($con, $query);
//print_r($result); echo "<br>";
$result=$result->fetch_all();
//print_r($result); echo "<br>";
foreach($result as $r) { 
	//print_r($r); echo "<BR>";
   /* foreach($r as $k=>$v) {
		echo $k." - ".$v."<BR>";
    }
  */
  $query="";
  if($r[0]=='analisi') { 
  	$query = "select c.codice, l.stato as codiceColore from colori c, lampade l, preferenze p, analisi a, illumina i where c.id=p.IdColore AND p.idUtente=a.idUtente AND p.IdEmozione=a.IdEmozioneRes AND a.id=i.IdAnalisi AND i.IdLampada=l.id AND i.IdLampada='".$_GET["id"]."' order by a.dataAnalisi DESC limit 1
;";
  }
  else if($r[0]=='colore') { 
  	$query = "select c.codice,l.stato from colori c, lampade l where c.id=l.colore AND l.id='".$_GET["id"] ."';";
  }
  $result=mysqli_query($con,$query)->fetch_all();
  echo "&&".$result[0][0].$result[0][1]."#";
}

?>