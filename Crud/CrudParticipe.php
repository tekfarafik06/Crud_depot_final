<?php
namespace participe;
use natation\MyPDO;
require_once "../Vue/VueParticipe.php";

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteNageur.php";




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
$myPDOParticipe = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'nageur');





$vue = new \natation\VueParticipe();

$contenu = "";
$message = "";


// traitement des différentes actions possibles


if(isset($_GET['action']))
    switch ($_GET['action']) {
        case 'read':
            $nageur = $myPDOParticipe->get('id_nageur', $_GET['id_nageur']);
            $epreuve = $myPDOParticipe->get('id_epreuve', $_GET['id_epreuve']);
            $contenu .= $vue->getHTML4($nageur);
            $contenu .= $vue->getHTML4Nageur($epreuve);
            $_SESSION['etat'] = 'lecture';
            break;
        case 'create':
            $nbNageurs = $myPDOParticipe->count();
            $contenu .= $vue->getFormulaire4Nageur(array('id_nageur' => array ('type'=>'number', 'default'=> $nbNageurs+1), 'nom_nageur' => 'text', 'prenom_nageur' => 'text'));
            $_SESSION['etat'] = 'création';
            break;
        case 'update':
            $nageur = $myPDOParticipe->get('id_nageur',$_GET['id_nageur']);
            $contenu .= $vue->getFormulaire4Nageur(array('id_nageur'=>array('type'=>'number','default'=>$nageur->getIdNageur()),
                'nom_nageur'=>array('type'=>'text','default'=>$nageur->getNomNageur()),
                'prenom_nageur'=>array('type'=>'text','default'=>$nageur->getPrenomNageur())));
            $_SESSION['etat'] = 'modification';
            break;
        case 'delete':
            $myPDOParticipe->delete(array('id_nageur'=>$_GET['id_nageur']));
            $_SESSION['etat'] = 'suppression';
            break;
        default:
            $message .= "<p>Action ".$_GET['action']." non implémentée.</p>\n";
    }

else
    if (isset($_SESSION['etat']))
        switch($_SESSION['etat']) {
            case 'création':
                $myPDOParticipe->insert(array('id_nageur'=>$_GET['id_nageur'],'id_epreuve'=>$_GET['id_epreuve'] ,'performance'=>$_GET['performance'], 'classement'=>$_GET['classement']));
                $_SESSION['etat'] = 'créé';
                break;
            case 'modification':
                $myPDOParticipe->update('id_nageur', array('id_nageur'=>$_GET['id_nageur'], 'nom_nageur'=>$_GET['nom_nageur'], 'prenom_nageur'=>$_GET['prenom_nageur']));
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


// affichage du nombre total de livre :
$nbParticipants = $myPDOParticipe->count();
$message .= "<p>La table nageur contient ".$nbParticipants." enregistrements.</p>\n";

// sélection/modification/suppression/ d'un livre

$contenu .=
    "<form action='?' method='GET'>
            <select name='action'>
            <option value='read'>Lire</option>
            <option value='update'>Modifier</option>
            <option value='delete'>Supprimer</option>
</select>
<input type='number' min='1' max='$nbParticipants' name='id_nageur'/>
<input type='submit' name='envoi' value='Go' />
</form>\n";


// création d'un nouveau nageur
// Attention suppose que le nombre de nageurs présent correspond au dernier identifiant attribué...
$contenu .="<p><a href='?action=create'>Créer participant";
$contenu .= $nbParticipants+1;
$contenu .= "</a> </p>";

// récupération et affichage de la liste des nageurs avec liens vers édition/suppresion

$lesParticipants = $myPDOParticipe->getAll();
$contenu .= $vue->getAllParticipe($lesParticipants);


// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();






