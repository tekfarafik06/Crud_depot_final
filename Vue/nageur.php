<?php

use natation\MyPDO;

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteNageur.php";
//phpinfo();

$myPDO = new MyPDO($_ENV['host'] ,$_ENV['db'] ,$_ENV['user'], $_ENV['password']) ;

$myPDO->setNomTable('nageur');

$myPDO->initPDOS_selectAll();
$va =  $myPDO->getAll();
 foreach ($va as $value) {
    echo $value->getPrenomNageur();
    echo $value->getNomNageur();
    echo $value->getIdNageur();
}


