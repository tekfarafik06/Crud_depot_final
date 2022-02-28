<?php

namespace natation;

use natation\MyPDO;

require_once "../Vue/VueParticipe.php";

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteParticipe.php";




function getDebutHTML(): string
{
    return "<!doctype html>
<html lang=\"fr\">
<head>
    <meta charset=\"utf-8\">
    <title>appli crud</title>
    <!--  <link rel=\"stylesheet\" href=\"style.css\"> -->
    <!--  <script src=\"script.js\"></script> -->
</head>
<body>
";
}

function getFinHTML(): string
{
    return "<!-- contenu -->
</body>
</html>
";
}


session_start();

// initialisation de la connexion via l'instance de MyPDO
$myPDOParticipe = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'participe');

$contenu = "";
$message = "";


$vue = new \natation\VueParticipe();

$myPDOParticipe->initPDOS_selectRK();
$va =  $myPDOParticipe->getAllCOURSE();
$j = $myPDOParticipe->getNomTable;
echo $va;



// traitement des différentes actions possibles


// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();
