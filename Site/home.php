<!DOCTYPE html>
<?php 
// ricevo lampade con la get/post
$lampade=$_GET;
//echo $lampade["user"]."<br>";

?>
<html>
<font face="Avenir" >
<head>
<title>MoodLamp</title>
</head>
<body>
<h2>MoodLamp </h2>
<font color="Black">
<style>
body {
    background: url("./images/sfondo.png") no-repeat fixed center bottom;
    background-size: 100%;
}
h2{
	text-align: center;
    color: rgb(9,154,200);
}
#p{
    text-align:center;
    border-radius: 0.3em;
}
#logout{
	font-size:0.5em;
    position: absolute;
    top: 0.67em;
    right: 1.3em;
    color: rgb(81,132,149);
    
}


#reg {
	color:#518495;
}
a:visited { 
    color: #436E7B;
}
#button {
display: block;
-webkit-box-sizing: content-box;
-moz-box-sizing: content-box;
box-sizing: content-box;
float: none;
z-index: auto;
width: 6em;
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
#add{
width: 1.8em;
height: 1.8em;
vertical-align: bottom;
text-align:center;
position: static;
cursor: pointer;
opacity: 1;
overflow: visible;
border: 1px solid rgb(0,115,105);
-webkit-border-radius: 0.1em;
border-radius: 0.1em;
font-size:1em;
color: rgb(0,115,106);
letter-spacing: 1px;
background: rgba(0,0,0,0);
}
#lampade{
width: 5.8em;
height: 2em;
vertical-align: bottom;
text-align:center;
position: static;
cursor: pointer;
opacity: 1;
overflow: visible;
border: 1px solid rgb(0,115,105);
-webkit-border-radius: 0.1em;
border-radius: 0.1em;
font-size:0.9em;
color: rgb(0,115,106);
letter-spacing: 1px;
background: rgba(0,0,0,0);
}
#lamp {
display: block;
text-align:center;
position: static;
cursor: pointer;
}

</style>
<form id="logout">	
<a href="moodlamp.html">Logout</a>
</form>
<?php
 echo'
<pr id="lamp">	
<a href="./selectLamps.php?'.getGET().'"><button id="lampade" value="Lampade">LAMPS </button></a>
<a href="./addLamps.php?'.getGET().'"><button id="add" value="add">+</button></a>
</pr> 
<br>
<form id="p" action="colors.php?'.getGET().'" method="post">	
<input type="submit" id="button" value="Pick color">
</form> <br>
<form id="p" action="analisys.php?'.getGET().'" method="post">	
<input type="submit" id="button" value="Analysis">
</form>';

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


</body>

</font>
</html>