<?php


namespace natation;

use natation\MyPDO;

error_reporting(E_ALL);
ini_set("display_errors", 1);



require_once "../Vue/VueParticipe.php";

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteParticipe.php";




function getDebutHTML(): string
{
    return "<!DOCTYPE html>
   <html>
  <head>
        <meta charset=" . "'utf-8'" . ">
        <meta http-equiv=" . "'X-UA-Compatible'" . " content=" . "'IE=edge'" . ">
        <meta name=" . "'viewport'" . " content=" . "width=device-width, initial-scale=1" . ">
        <title>NAGEUR</title>
        <link href='style.css' rel='stylesheet'>
        <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl' crossorigin='anonymous'>
       
      </head>
      
      <body class='bg-img7'>
        <link rel=" . "'stylesheet'" . " href=" . "'https://cdn.jsdelivr.net/npm/bulma@0.8.0/css/bulma.min.css'" . ">
        <script defer src=" . "'https://use.fontawesome.com/releases/v5.3.1/js/all.js'" . "></script>
       <br><br>
    
        <section>
        
        <center>
            <nav class='navbar is-black is-fixed-top' role='navigation' aria-label='main navigation'>
              <div class='  navbar-brand'>
             
                <a class='navbar-item' href='../index.html'>
                  <img src='../assets/images/logo.svg' width='112' height='28'>
                </a>
            
                <a role=button' class='navbar-burger burger' aria-label='menu' aria-expanded='false' data-target='navbarBasicExample'>
                  <span aria-hidden='true'></span>
                  <span aria-hidden='true'></span>
                  <span aria-hidden='true'></span>
                </a>
              </div>
               
              <div id='navbarBasicExample' class='navbar-menu'>
                <div class='navbar-start'>
                <a class='navbar-item' href='index.php'>
                    Accueil
                  </a>
                  <a class='navbar-item' href='CrudNageur.php'>
                    nageur
                  </a>
                  <a class='navbar-item' href='CrudEpreuve.php'>
                    Epreuve
                  </a>
                    <a class='navbar-item' href='CrudParticipe.php'>
                    Participe
                  </a>
                  </div>
                </div>-
                    </nav>
            
                </section>
             
    &nbsp;
       <center><h1 id='titre'>Liste des participants </h1></center>&nbsp;

";

}

function getFinHTML(): string
{
    return "
   </body>
<link href='../style.css' rel='stylesheet'>
    
  <footer class='footer'>
    <div class='footer-left'>
        <img src='../image/logo5.jpg' alt=''>
        
        <p class='box' id='box'><br>jeux olympique de natation , vous trouverez si dessous toute les information
        nécessaire pour nous contacter,le code source, les framwark utiliser</p><br>
        
        <div class='socials'>
            <a href='https://getbootstrap.com/'><i class='bootsrapicone'><img src='../image/bootstrap_4-icon.png'></i></a>
            <a href='https://webmail.univ-lehavre.fr/SOGo/so/am184100/Mail/#!/Mail/0/INBOX'><i class='emailicone'><img src='../image/mail.jpg'></i></a>
            <a href='https://www-apps.univ-lehavre.fr/forge/users/sign_in'><i class='gitlabicone'><img src='../image/gitlab.png'></i></a>
            <a href='#'><i class='githubicone'><img src='../image/github.png'></i></a>
            <a href='https://bulma.io/'><i class='bulmaicone'><img src='../image/bulma.png'></i></a>
            
        </div>
    </div>
    
    <ul class='footer-right'>
    
     <li >
        <h2>Membres de group</h2>
        <ul class='box'>
            <li ><a>thiziri kechidi </a></li>
            <li><a>salim mahdjane</a></li>
            <li><a >rafik tekfa</a></li>
            <li><a >mourad hadjali</a></li>
            
        </ul>
    </li>
    <li class='features'>
        <h2>Adresse Mail</h2>
        <ul class='box'>
            <li><a>thiziri.kechidi@etu.univ-lehavre.fr</a></li>
            <li><a>salim.mahdjane@etu.univ-lehavre.fr</a></li>
            <li><a>rafik.tekfa@etu.univ-lehavre.fr</a></li>
            <li><a>mourad.hajdali@etu.univ-lehavre.fr</a></li>

        </ul>
    </li>
    <li >
        <h2>Contenue Page</h2>
        <ul class='box' >
          
        </ul>
    </li>
    </ul>
    <div class='footer-bottom'>
        <p>PROJET INFO POUR LE WEB  &copy;COUD </p>
    </div>
</footer>

</html>
";
}


session_start();

// initialisation de la connexion via l'instance de MyPDO
$myPDOParticipe = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'participe');



$vue = new \natation\VueParticipe();

$contenu = "";
$message = "";


// traitement des différentes actions possibles


if (isset($_GET['action']))
    switch ($_GET['action']) {
        case 'read':
            $participe = $myPDOParticipe->getParticipe($_GET['id_nageur'], $_GET['id_epreuve']);
            $contenu .= $vue->getHTML4Participe($participe);
            $_SESSION['etat'] = 'lecture';
            break;
        case 'create':
            $nbParticipe = $myPDOParticipe->count();
            $contenu .= $vue->getformulaire4Participe(array(
                'id_nageur' => 'number',
                'id_epreuve' => 'number',
                'nom_medaille' => 'text',
                'classement' => 'number',
                'date_epreuve' => 'text',
                'performance' => 'number'
            ));
            $_SESSION['etat'] = 'création';
            break;
        case 'update':
            $participe = $myPDOParticipe->get('id_nageur', $_GET['id_nageur']/*, 'id_epreuve', $_GET['id_epeuve']*/);
            $contenu .= $vue->getFormulaire4Participe(array(
                'id_nageur' => array('type' => 'number', 'default' => $participe->getIdNageur()),
                'id_epreuve' => array('type' => 'number', 'default' => $participe->getIdEpreuve()),
                'classement' => array('type' => 'number', 'default' => $participe->getClassement()),
                'date_epreuve' => array('type' => 'text', 'default' => $participe->getDateEpreuve()),
                'nom_medaille' =>  array('type' => 'text', 'default' => $participe->getNomMedaille()),
                'performance' => array('type' => 'number', 'default' => $participe->getPerformance()),
            ));
            $_SESSION['etat'] = 'modification';
            break;
        case 'delete':
            $myPDOParticipe->deleteParticipe($_GET['id_nageur'], $_GET['id_epreuve']);
            $_SESSION['etat'] = 'suppression';
            break;
        default:
            $message .= "<p>Action " . $_GET['action'] . " non implémentée.</p>\n";
    }

else
    if (isset($_SESSION['etat']))
    switch ($_SESSION['etat']) {
        case 'création':
            if (isset($_GET['id_nageur']) && isset($_GET['id_epreuve']) && isset($_GET['classement']) && isset($_GET['date_epreuve']) && isset($_GET['nom_medaille']) && isset($_GET['performance'])) {
                //echo $_GET['id_nageur'];
                $verif = $myPDOParticipe->countParticipants($_GET['id_nageur'], $_GET['id_epreuve']);

                if($verif == 0) {
                    $myPDOParticipe->insert(array(
                        'id_nageur' => $_GET['id_nageur'],
                        'id_epreuve' => $_GET['id_epreuve'],
                        'date_epreuve' => $_GET['date_epreuve'],
                        'performance' => $_GET['performance'],
                        'classement' => $_GET['classement'],
                        'nom_medaille' => $_GET['nom_medaille']
                    ));
                }

            }
            else
                $_SESSION['Action'] = 'read';
            $_SESSION['etat'] = 'créé';
            break;
        case 'modification':
            //echo "epreeeuve ".$_GET['id_epreuve'];
            //echo "medaille " . $_GET['nom_medaille'];

            $epr = $_GET['id_epreuve'];
            $medaille = $_GET['nom_medaille'];
            $participe = array(
                'id_nageur' => $_GET['id_nageur'],
                'id_epreuve' => $epr,
                'nom_medaille' =>$medaille,
                'performance' => $_GET['performance'],
                'date_epreuve' => $_GET['date_epreuve'],
                'classement' => $_GET['classement']
            );

            $myPDOParticipe->updateParticipe('id_nageur','id_epreuve', $participe);
//            $myPDOParticipe->update($_GET['id_nageur'], $epr, $nageur);

            //echo "updated";
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


// sélection/modification/suppression/ d'un livre

$contenu .=
    "
<div><div class='column is-1 '></div><div class='column'><form action='?' method='GET'><table class='table is-striped is-narrow is-hoverable is-fullwidth'>
    <tr><td>
    <select class='select is-rounded is-fullwidth is-black is-size-6'  name='action'>
    <option value='read'>Consulter la fiche d'un participants</option>
    <option value='update'>Modifier les informations d'un participants</option>
    <option value='delete'>Supprimer un participant de la base de données</option>
</select></td>
<td><input class='input is-black' type='number' min='1' max='100' name='id_nageur'/></td>
<td><input class='button is-fullwidth is-black is-outlined' type='submit' name='envoi' value='Appliquer' /></td></tr>
</table></form></div><div class='column is-1'></div></div>\n";




// création d'un nouveau nageur
// Attention suppose que le nombre de nageurs présent correspond au dernier identifiant attribué...

$contenu .= "<p><a  href='?action=create'>Ajouter participant";
$contenu .= $nbParticipe + 1;
$contenu .= "</a> </p>";

// récupération et affichage de la liste des participants avec liens vers édition/suppresion

$lesParticipants = $myPDOParticipe->getAll();
$contenu .= $vue->getAllParticipe($lesParticipants);


// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();
