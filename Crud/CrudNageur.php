<?php

namespace natation;

use natation\MyPDO;

require_once "../Vue/VueNageur.php";
require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteNageur.php";




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
$myPDONageur = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'nageur');;



$vue = new \natation\VueNageur();

$contenu = "";
$message = "";


// traitement des différentes actions possibles


if (isset($_GET['action']))
    switch ($_GET['action']) {
        case 'read':
            $nageur = $myPDONageur->get('id_nageur', $_GET['id_nageur']);
            $contenu .= $vue->getHTML4Nageur($nageur);
            $_SESSION['etat'] = 'lecture';
            break;
        case 'create':
            $nbNageurs = $myPDONageur->getCountValue();
            $contenu .= $vue->getFormulaire4Nageur(array('id_nageur' => array('type' => 'number', 'default' => $nbNageurs + 1), 'nom_nageur' => 'text', 'prenom_nageur' => 'text', 'pays_nageur' => 'text', 'sexe_nageur' => 'text'));
            $_SESSION['etat'] = 'création';
            break;
        case 'update':
            $nageur = $myPDONageur->get('id_nageur', $_GET['id_nageur']);
            $contenu .= $vue->getFormulaire4Nageur(array(
                'id_nageur' => array('type' => 'number', 'default' => $nageur->getIdNageur()),
                'nom_nageur' => array('type' => 'text', 'default' => $nageur->getNomNageur()),
                'prenom_nageur' => array('type' => 'text', 'default' => $nageur->getPrenomNageur()),
                'pays_nageur' => array('type' => 'text', 'default' => $nageur->getPaysNageur()),
                'sexe_nageur' => array('type' => 'text', 'default' => $nageur->getSexeNageur()),
            ));
            $_SESSION['etat'] = 'modification';
            break;
        case 'delete':
            $myPDONageur->delete(array('id_nageur' => $_GET['id_nageur']));
            $_SESSION['etat'] = 'suppression';
            break;
        default:
            $message .= "<p>Action " . $_GET['action'] . " non implémentée.</p>\n";
    }

else
    if (isset($_SESSION['etat']))
    switch ($_SESSION['etat']) {
        case 'création':
            $myPDONageur->insert(array('id_nageur' => $_GET['null'], 'nom_nageur' => $_GET['nom_nageur'], 'prenom_nageur' => $_GET['prenom_nageur'], 'pays_nageur' => $_GET['pays_nageur'], 'sexe_nageur' => $_GET['sexe_nageur']));
            $_SESSION['etat'] = 'créé';
            break;
        case 'modification':
            $myPDONageur->update('id_nageur', array('id_nageur' => $_GET['id_nageur'], 'nom_nageur' => $_GET['nom_nageur'], 'prenom_nageur' => $_GET['prenom_nageur'], 'pays_nageur' => $_GET['pays_nageur'], 'sexe_nageur' => $_GET['sexe_nageur']));
            $_SESSION['etat'] = 'modifié';
            break;
        case 'suppression':
            $_SESSION['etat'] = 'supprimé';
            break;
        case 'créé':
        case 'modifié':
        case 'supprimé':
        default:
            $_SESSION['etat'] = 'neutre';
    }


// affichage du nombre total de nageur :
$nbNageurs = $myPDONageur->getCountValue();
$message .= "<p>La table nageur contient " . $nbNageurs . " enregistrements.</p>\n";

// sélection/modification/suppression/ d'un nageur

$contenu .=
    "<form action='?' method='GET'>
            <select name='action'>
            <option value='read'>Lire</option>
            <option value='update'>Modifier</option>
            <option value='delete'>Supprimer</option>
</select>
<input type='number' min='1' max='$nbNageurs' name='id_nageur'/>
<input type='submit' name='envoi' value='Go' />
</form>\n";


// création d'un nouveau nageur
// Attention suppose que le nombre de nageurs présent correspond au dernier identifiant attribué...
$contenu .= "<p><a href='?action=create'>Créer nageur";
$contenu .= $nbNageurs + 1;
$contenu .= "</a> </p>";

// récupération et affichage de la liste des nageurs avec liens vers édition/suppresion

$lesNageurs = $myPDONageur->getAll();
$contenu .= $vue->getAllNageur($lesNageurs);


// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();
