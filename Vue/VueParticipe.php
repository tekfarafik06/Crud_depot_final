<?php

namespace natation;

use natation\EntiteParticipe;


class VueParticipe
{

  public function getHTML4Participe(EntiteParticipe $participe): string
  {

    $ch = "<table border='1'>
        <tr><th>id_nageur</th><th>id_epreuve</th><th></th></tr><tr>\n";
    $ch .= "<tr>" . $participe->getIdNageur() . "\n";
    $ch .= "<td>" . $participe->getIdEpreuve() . "</td>\n";
    $ch .= "<td>" . $participe->getClassement() . "</td>\n";
    $ch .= "<td>" . $participe->getDateEpreuve() . "</td>\n";
    $ch .= "<td>" . $participe->getNomMedaille() . "</td>\n";
    $ch .= "<td>" . $participe->getPerformance() . "</td>\n";
    $ch .= "</tr></table>\n";
    return $ch;
  }

  /**
   * production d'une string contenant un formulaire HTML
   * destiné à saisir une nouveau nageur ou à modifier un nageur existant
   * @param array $assoc
   * @return string
   */
  public function getFormulaire4Participe(array $assoc): string
  {
    $ch = "<div <div  id='formulaire'><div class='column is-1 '></div><div class='column'><form action='" . $_SERVER['PHP_SELF'] . "' method='GET'>\n";
    $i = 0;
    foreach ($assoc as $col => $val) {
      if (is_array($val)) {
        if ($i <= 1) {
          $ch .= "<input class='input is-info' name='$col' type='hidden' value='" . $val['default'] . "'/>\n";
        } else
          $ch .= "$col : <input class='input is-info' name='$col' type='" . $val['type']
            . "' value='" . $val['default'] . "'/></a>\n";
      } else {

        $ch .= "$col : <input class='input is-info' type='$val' name='$col' />\n";
      }
      ++$i;
    }


    $ch .= "<center></center><input class='button has-background-success is-outlined' type='submit' name='Valider' value='sauver'/></center>\n";


    return $ch . "</form></div><div class='column is-1 '></div></div>\n";
  }
  public function getAllParticipe(array $tabEntiteParticipe): string
  {
    $ch = "<div class=\"columns\">
               <div class=\"column\">

               <table class=\"table is-striped is-fluid  \">
               <tr>";
    $ch .= "
               <th><strong>id_nageur</strong></th>
                <th>id_epreuve</th>
                <th>classement</th>
                <th>date epreuve</th>
                <th>nom médaille</th>
                <th>performance</th>
             
                


              </tr>";
    foreach ($tabEntiteParticipe as $participe) {
      if ($participe instanceof EntiteParticipe) {

        $ch .= "<td>";
        $ch .= " <tr>

                 </tr>";
        $ch .= "<td>" . $participe->getIdNageur() . "</td> ";
        $ch .= "<th>" . $participe->getIdEpreuve() . "</th>";
        $ch .= "<th>" . $participe->getClassement() . " </th>";
        $ch .= "<th>" . $participe->getDateEpreuve() . "</th> ";
        $ch .= "<th>" . $participe->getNomMedaille() . "</th> ";
        $ch .= "<th>" . $participe->getPerformance() . "</th> ";
        $ch .= "<th><a href='?action=update&id_nageur=" . $participe->getIdNageur() . "&id_epreuve=" . $participe->getIdEpreuve() . "'><input class='button is-primary' type='submit' name='envoi' value='Modifier' /></th></a>";
        $ch .= "<th><a href='?action=delete&id_nageur=" . $participe->getIdNageur() . "&id_epreuve=" . $participe->getIdEpreuve() . "'><span class='tag is-danger'>Supprimer<button class='delete is-small' type='submit' name='envoi' value='supprimer'></button></span></th></a> ";
        $ch .= "<td>\n";
      }
    }
    return $ch . "</div></div></table></tr>\n";
  }
}
