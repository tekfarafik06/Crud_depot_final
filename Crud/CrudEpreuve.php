<?php

namespace natation;

use natation\MyPDO;

require_once "../Vue/VueEpreuve.php";

require_once "../Connexion/VariableDsn.php";
require_once "../Connexion/MyPDO.php";
require_once "../Entite/EntiteEpreuve.php";




function getDebutHTML(): string {
    return "<!DOCTYPE html>
<html>
  <head>
    <meta charset=" . "'utf-8'" . ">
    <meta http-equiv=" . "'X-UA-Compatible'" . " content=" . "'IE=edge'" . ">
    <meta name=" . "'viewport'" . " content=" . "width=device-width, initial-scale=1" . ">
    <title>Epreuve</title>
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
  <div class='navbar-brand'>
 
    <a class='navbar-item' href='index.php'>
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
    <a class='navbar-item' href='../index.html'>
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
        </div>
        </nav>

    </section>
 
    &nbsp;
    <center><h1 id='titre'>Liste des épreuves </h1></center>&nbsp;
";
}

function getFinHTML(): string
{
    return "<!-- contenu -->
    </body>
    <link href='../style.css' rel='stylesheet'>
    
  <footer class='footer'>
    <div class='footer-left'>
        <img src='../assets/images/logo.svg' alt=''>
        
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
$myPDOEpreuve = new MyPDO('mysql', $_ENV['host'], $_ENV['db'], $_ENV['user'], $_ENV['password'], 'epreuve');





$vue = new \natation\VueEpreuve();

$contenu = "";
$message = "";


// traitement des différentes actions possibles


if (isset($_GET['action']))
    switch ($_GET['action']) {
        case 'read':
            $epreuve = $myPDOEpreuve->get('id_epreuve', $_GET['id_epreuve']);
            $contenu .= $vue->getHTML4Epreuve($epreuve);
            $_SESSION['etat'] = 'lecture';
            break;
        case 'create':
            $nbEpreuves = $myPDOEpreuve->count();
            $contenu .= $vue->getinsert(array(
                'id_epreuve' => array(
                    'type' => 'number',
                    'default' => $nbEpreuves + 1),
                'nom_epreuve' => 'text', 'type_epreuve' => 'text', 'statut_epreuve' => 'text'));
            $_SESSION['etat'] = 'création';


            break;
        case 'update':
            $epreuve = $myPDOEpreuve->get('id_epreuve', $_GET['id_epreuve']);
            $contenu .= $vue->getupdete(array(
                'id_epreuve' => array('balise'=>'input','type' => 'text', 'default' => $epreuve->getIdEpreuve(), 'titre'=> 'id'),
                'nom_epreuve' => array('balise'=>'select','type' => 'text', 'default' => $epreuve->getNomEpreuve(), 'titre' => "Nom d'epreuve", 'options' => array('50m', '100m', '200m', '400m', '800m', '1500m')),
                'type_epreuve' => array('balise'=>'select','type' => 'text', 'default' => $epreuve->getTypeEpreuve(), 'titre'=> 'Type depreuve', 'options' => array('Papillon', 'Dos', 'Brasse', 'Nage_liber')),
                'statut_epreuve' => array('balise'=>'select','type' => 'text', 'default' => $epreuve->getStatutEpreuve(), 'titre'=> 'Statut epreuve',  'options' => array('Finale', 'Demi_finale1', 'Demi_finale2', 'Series')),
            ));
            $_SESSION['etat'] = 'modification';
            break;
        case 'delete':
            $myPDOEpreuve->delete(array('id_epreuve' => $_GET['id_epreuve']));
            $_SESSION['etat'] = 'suppression';
            break;
        default:
            $message .= "<p>Action " . $_GET['action'] . " non implémentée.</p>\n";
    }

else
    if (isset($_SESSION['etat']))
    switch ($_SESSION['etat']) {
        case 'création':
            $myPDOEpreuve->insert(array('id_epreuve' => $_GET['null'], 'nom_epreuve' => $_GET['nom_epreuve'], 'type_epreuve' => $_GET['type_epreuve'], 'statut_epreuve' => $_GET['statut_epreuve']));
            $_SESSION['etat'] = 'créé';
            break;
        case 'modification':
            $myPDOEpreuve->update('id_epreuve', array('id_epreuve' => $_POST['id_epreuve'], 'nom_epreuve' => $_POST['nom_epreuve'], 'type_epreuve' => $_POST['type_epreuve'], 'statut_epreuve' => $_POST['statut_epreuve']));
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


$contenu .=
    "
<div><div class='columns is-1 '></div><div class='column'><form action='?' method='GET'>
<table class='table is-striped is-narrow is-hoverable is-fullwidth'>
    <tr><td>
    <select class='select is-rounded is-fullwidth is-black is-size-6'  name='action'>
    <option value='read'>Lire</option>
    <option value='update'>Modifier</option>
    <option value='delete'>Supprimer</option>
</select></td>
<td><input class='input is-black' type='number' min='2' max='100' name='id_epreuve'/></td>
<td><input class='button is-fullwidth is-black is-outlined' type='submit' name='envoi' value='Appliquer' /></td></tr>
</table></form></div><div class='column is-1'></div></div>\n";

// création d'un nouveau epreuve
// Attention suppose que le nombre de epreuves présent correspond au dernier identifiant attribué...
$contenu .= "<p><a href='?action=create'>Ajouter epreuve";
//$contenu .= $nbEpreuves + 1;
$contenu .= "</a> </p>";

// récupération et affichage de la liste des epreuves avec liens vers édition/suppresion

$lesEpreuves = $myPDOEpreuve->getAll();
$contenu .= $vue->getAllEpreuve($lesEpreuves);

// Production de la page HTML
echo getDebutHTML();
echo $message;
echo $contenu;
echo getFinHTML();
