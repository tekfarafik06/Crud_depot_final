<?php
namespace natation;
use natation\MyPDO;
require_once "../Vue/VueEpreuve.php";

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteEpreuve.php";




function getDebutHTML(): string {
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

function getFinHTML(): string {
    return "<!-- contenu -->
</body>
</html>
";
}


session_start();

// initialisation de la connexion via l'instance de MyPDO
$myPDOEpreuve = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'epreuve');





$vue = new \natation\VueEpreuve();

$contenu = "";
$message = "";


// traitement des différentes actions possibles


if(isset($_GET['action']))
    switch ($_GET['action']) {
        case 'read':
            $epreuve = $myPDOEpreuve->get('id_epreuve', $_GET['id_epreuve']);
            $contenu .= $vue->getHTML4Epreuve($epreuve);
            $_SESSION['etat'] = 'lecture';
            break;
        case 'create':
            $nbEpreuves = $myPDOEpreuve->count();
            $contenu .= $vue->getFormulaire4Epreuve(array('id_epreuve' => array ('type'=>'number', 'default'=> $nbEpreuves+1), 'nom_epreuve' => 'text', 'type_epreuve' => 'text','statut_epreuve' => 'text'));
            $_SESSION['etat'] = 'création';
            break;
        case 'update':
            $epreuve = $myPDOEpreuve->get('id_epreuve',$_GET['id_epreuve']);
            $contenu .= $vue->getFormulaire4Epreuve(array('id_epreuve'=>array('type'=>'number','default'=>$epreuve->getIdEpreuve()),
                'nom_epreuve'=>array('type'=>'text','default'=>$epreuve->getNomEpreuve()),
                'type_epreuve'=>array('type'=>'text','default'=>$epreuve->getTypeEpreuve()),
                'statut_epreuve'=>array('type'=>'text','default'=>$epreuve->getStatutEpreuve()),
            ));
            $_SESSION['etat'] = 'modification';
            break;
        case 'delete':
            $myPDOEpreuve->delete(array('id_epreuve'=>$_GET['id_epreuve']));
            $_SESSION['etat'] = 'suppression';
            break;
        default:
            $message .= "<p>Action ".$_GET['action']." non implémentée.</p>\n";
    }

else
    if (isset($_SESSION['etat']))
        switch($_SESSION['etat']) {
            case 'création':
                $myPDOEpreuve->insert(array('id_epreuve'=>$_GET['id_epreuve'], 'nom_epreuve'=>$_GET['nom_epreuve'], 'type_epreuve'=>$_GET['type_epreuve'],'statut_epreuve'=>$_GET['statut_epreuve']));
                $_SESSION['etat'] = 'créé';
                break;
            case 'modification':
                $myPDOEpreuve->update('id_epreuve', array('id_epreuve'=>$_GET['id_epreuve'], 'nom_epreuve'=>$_GET['nom_epreuve'], 'type_epreuve'=>$_GET['type_epreuve'],'statut_epreuve'=>$_GET['statut_epreuve']));
                $_SESSION['etat'] = 'modifié';
                break;
            case 'suppression':
                $_SESSION['etat']= 'supprimé';
                break;
            case 'créé':
            case 'modifié':
            case 'supprimé':
            default:
                $_SESSION['etat'] = 'neutre';
        }


$nbEpreuves = $myPDOEpreuve->count();
$message .= "<p>La table epreuve contient ".$nbEpreuves." enregistrements.</p>\n";


$contenu .=
    "<form action='?' method='GET'>
            <select name='action'>
            <option value='read'>lire</option>
            <option value='update'>Modifier</option>
            <option value='delete'>Supprimer</option>
</select>
<input type='number' min='1' max='$nbEpreuves' name='id_epreuve'/>
<input type='submit' name='envoi' value='Go' />
</form>\n";


// création d'un nouveau epreuve
// Attention suppose que le nombre de epreuves présent correspond au dernier identifiant attribué...
$contenu .="<p><a href='?action=create'>Créer epreuve";
$contenu .= $nbEpreuves+1;
$contenu .= "</a> </p>";

// récupération et affichage de la liste des epreuves avec liens vers édition/suppresion

$lesEpreuves = $myPDOEpreuve->getAll();
$contenu .= $vue->getAllEpreuve($lesEpreuves);

// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();





