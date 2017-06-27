<html> 
<font face="Avenir" >
<head>
<title id="title">MoodLamp</title>
</head>
<body>
<h2>MoodLamp </h2>
<font color="Black">
<style>

#logout{
	font-size:0.5em;
    position: absolute;
    top: 0.67em;
    right: 1.3em;
    color: rgb(81,132,149);
    
}

h2{
	text-align: center;
    color: rgb(9,154,200);
}
#back {
display: block;
-webkit-box-sizing: content-box;
-moz-box-sizing: content-box;
box-sizing: content-box;
float: none;
z-index: auto;
width: 3em;
height: 2em;
position: static;
cursor: pointer;
opacity: 1;
margin: 0 auto;
padding: 0;
overflow: visible;
border: 1px solid rgb(30,205,151);
-webkit-border-radius: 0.1em;
border-radius: 0.1em;
font-size:1.2em;
color: rgb(30, 205, 151);
text-align: center;
-o-text-overflow: clip;
text-overflow: clip;
letter-spacing: 1px;
background: rgba(0,0,0,0);
-webkit-box-shadow: none;
box-shadow: none;
text-shadow: none;
-webkit-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
-moz-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
-o-transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
transition: background-color 0.3s cubic-bezier(0, 0, 0, 0), color 0.3s cubic-bezier(0, 0, 0, 0), width 0.3s cubic-bezier(0, 0, 0, 0), border-width 0.3s cubic-bezier(0, 0, 0, 0), border-color 0.3s cubic-bezier(0, 0, 0, 0);
-webkit-transform: none;
transform: none;
-webkit-transform-origin: 50% 50% 0;
transform-origin: 50% 50% 0;
}
</style>
<form id="logout">	
<a href="moodlamp.html">Logout</a>
</form>
<?php 

//print_r($_GET);
if($_GET["colore"]) {
require('../db.php');
$idLamps = getLAMPS();
foreach($idLamps as $idL) {
	$query = "update lampade l, associazioni a set l.colore=(select id from colori c where c.colore='".$_GET["colore"]."') where a.id='".$idL."' AND a.idLampada=l.id";
	print_r($query); echo "<br>";
    $result = mysqli_query($con, $query);
}

echo "Colore selezionato: ".$_GET["colore"];
echo '
<a href="./colors.php?'.getGET("colore",$_GET["colore"]).'"><button>back</button></a>
</form>';
echo "<Br>";
unset($_GET["colore"]);
echo "./colors.php?".getGET();
header("Location: ./colors.php?".getGET());
}
else {
echo '
<style>

#color {
   position:relative;
   text-align:center;
   vertical-align: middle;
   horizontal-align: middle;
   heigth: 1em;
   width: 100vw;
   display: block;
    margin: auto;
   max-width: 40em;
   box-sizing: border-box;
}
#textPick{
	text-align:center;
    text-size:3em;
}
</style>
<html>
<p id="textPick">Pick a color</p>
<br> <br>
<img id = "color" src="./images/colors.png"   alt="" usemap="#Map" />
<map name="Map" id="Map">
    <area alt="" title="bianco" href="./colors.php?'.getGET().'&colore=Bianco" shape="poly" coords="325,326,439,57,420,50,386,40,357,36,328,34,298,35,268,40,240,47,211,58" />
    <area alt="" title="viola" href="./colors.php?'.getGET().'&colore=Viola" shape="poly" coords="327,327,68,186,76,172,82,162,90,151,100,139,109,129,119,118,130,108,139,100,149,93,162,84,172,76,183,69,195,64,208,58,215,70" />
    <area alt="" title="blu" href="./colors.php?'.getGET().'&colore=Blu" shape="poly" coords="35,353,324,328,68,189,65,194,61,202,58,212,51,225,47,238,45,250,41,261,39,270,37,280,36,291,35,308,34,319,33,330,33,342" />
    <area alt="" title="azzurro" href="./colors.php?'.getGET().'&colore=Azzurro" shape="poly" coords="325,330,132,545,128,542,124,537,118,531,109,521,101,513,94,503,87,494,80,484,76,476,72,470,68,464,66,461,63,454,60,448,59,444,57,442,53,434,52,430,51,426,49,422,47,415,45,408,43,403,41,398,41,391,39,383,37,374,36,366,35,354" />
    <area alt="" title="verde" href="./colors.php?'.getGET().'&colore=Verde" shape="poly" coords="328,330,298,615,293,616,285,614,278,614,272,612,267,611,258,610,251,608,249,607,242,604,237,604,232,601,227,600,221,598,214,595,206,591,198,587,188,582,177,577,165,570,157,564,150,558,142,553,135,546,136,542" />
    <area alt="" title="giallo" href="./colors.php?'.getGET().'&colore=Giallo" shape="poly" coords="300,617,330,330,556,506,551,513,546,519,543,523,539,529,531,536,522,543,514,552,503,558,494,564,489,570,476,575,462,585,443,595,418,604,395,610,372,616,335,618" />
    <area alt="" title="arancione" href="./colors.php?'.getGET().'&colore=Arancione" shape="poly" coords="328,325,619,317,617,339,618,356,616,365,614,380,610,392,605,413,602,426,596,438,587,456,581,468,573,483,565,493,557,505,407,389,332,330" />
    <area alt="" title="rosso" href="./colors.php?'.getGET().'&colore=Rosso" shape="poly" coords="328,324,570,165,575,172,578,179,583,186,587,195,591,204,597,216,603,230,606,245,612,261,615,279,617,295,618,317" />
    <area alt="" title="rosa" href="./colors.php?'.getGET().'&colore=Rosa" shape="poly" coords="441,58,455,63,468,72,479,77,499,91,510,99,525,113,539,125,546,132,551,141,559,149,565,157,569,163,452,243,379,290,335,319,330,322,330,320,336,303,408,132,438,62" />
    <area alt="" title="fade" href="./colors.php?'.getGET().'&colore=Fade" shape="poly" coords="326,301,342,306,351,318,352,333,335,343,319,347,308,335,301,321,311,310" />
</map>
<br>
<a href="./home.php?'.getGET().'"><button id="back" >back</button></a>
<a id ="ref" href="./colors.php?'.getGET().'"><button>refresh</button></a>';

}

function getLAMPS() {
$l = array();
    $a = explode("&",getGET());
    //print_r($a); echo "<br>";
	foreach($a as $g) {
    //echo $g."<br>";
 		if($g[0]=='l') {
      		array_push($l,substr($g,3));
        }
        else if($g[0]=='g') {
        	$id_g=substr($g,3);
            //echo $id_g."<br>";
            require('../db.php');
            $query="select idLampadaAssociata from appartenenze a where a.idGruppo='".$id_g."';";
			$result = mysqli_query($con, $query); 
           // echo"a<br>";print_r($result); 
           // echo"<br>b";
            if(!is_bool($result)) {
           		$a = $result->fetch_all();
          		foreach($a as $lg) {
      				array_push($l,$lg[0]);	
                }
            }
        }
	}
    $l = array_unique($l);
    //print_r($l);
    return $l;
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
</html>