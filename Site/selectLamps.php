<html>
<font face="Avenir" >
<head>
<title >MoodLamp</title>
</head>
<body>
<h2>MoodLamp </h2>
<font color="Black">

<style>

h2{
	text-align: center;
    color: rgb(9,154,200);
}
#elenco,#buttons { 
float: none;
vertical-align:middle;
display: block;
text-align:center;
margin: auto;
}
#back,#ok {
width: 8em;
height: 4em;
opacity: 1;
border: 1px solid rgb(30,205,151);
-webkit-border-radius: 0.1em;
border-radius: 0.1em;
font-size:0.5em;
color: rgb(30, 205, 151);
letter-spacing: 1px;
background: rgba(0,0,0,0);
vertical-align:bottom;
}
#img_lamp,#img_group {
width: 7em;
height: 7em;
}
</style>

<?php
//echo "<BR><BR><BR><BR>";
//print_r($_GET);
//echo setGET();
print_r($se);
echo "<BR><BR>";
$lamps = array();
$groups = array();
$lampsName = array();
$groupsName = array();
require('../db.php');
$query = "SELECT id, alias FROM associazioni WHERE idUtente = '".$_GET["user"]."'";
$result = mysqli_query($con, $query);
if(!is_bool($result)) {
	//print_r($result->fetch_all()); echo "<br>";
    foreach($result as $r) {
    	array_push($lamps,$r['id']);
    	array_push($lampsName,$r['alias']);
    }
	$query = "SELECT nome,id FROM gruppi WHERE userCreatore = '".$_GET["user"]."'";
	$result = mysqli_query($con, $query);
	if(!is_bool($result)) {
		//print_r($result->fetch_all()); echo "<br>";
    }
    foreach($result as $r) {
    	array_push($groups,$r['id']);
    	array_push($groupsName,$r['nome']);
    }
    echo '<form id="elenco">';
    //print_r($lampsName); echo"<br>";
    echo "<NOBR>";
    foreach($lamps as $k=>$l) {
	echo '<a href="selectLamps.php?'.getGET("l".$k,$l).'"><img id="img_lamp" src="../resources/lamps_pictures/lamps/'.$l;
    if($_GET['l'.$k])
    	echo "Selected";
    echo'.png" /></a>';
	//echo '<br> selectLamps.php?'.getGET("l1",$l).'<br>';
    }
    echo "</NOBR>";
    echo '<br>';
    echo '<br>';
    echo "<NOBR>";
    foreach($groups as $k=>$g) { 
	echo '<a href="selectLamps.php?'.getGET("g".$k,$g).'"><img id="img_group" src="../resources/lamps_pictures/groups/'.$g;
     if($_GET['g'.$k])
    	echo "Selected";
    echo '.png" /></a>';
	}
    echo "</NOBR>";
   echo '</form>';
    echo "<br><br>";
   echo '<p id="buttons">';
   echo '<a href="./home.php?user='.$_GET["user"].'"><button id="back">RESET</button>';
   echo '<a href="./home.php?'.getGET().'"><button id="ok">SELECT</button>';
   echo "</p>";
}

function getGET($sel,$idIm) {
//echo "ad";

  $s="";
  $a= $_GET;
  if(strlen($sel)>0) {
    if(strlen($a[$sel])>0) {
    	unset($a[$sel]);
    }
    else {
  		$a[$sel]=$idIm;
    }
  }
  //echo "<b>";
 // print_r($a);
  //echo "</b>";
  foreach($a as $k=>$g) {
    	$s.=$k."=".$g."&";
  }
  $s = substr($s,0,-1);
  //echo $s;
  return $s;
}


?>