<?php

namespace natation;

use natation\EntiteNageur;


class VueNageur
{


/**
*echoo
*/

    public function getHTML4Nageur(EntiteNageur $nageur): string
    {

        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr>" . $nageur->getIdNageur() . "\n";
        $ch .= "<td>" . $nageur->getNomNageur() . "</td>\n";
        $ch .= "<td>" . $nageur->getPrenomNageur() . "</td>\n";
        $ch .= "<td>" . $nageur->getPaysNageur() . "</td>\n";
        $ch .= "<td>" . $nageur->getSexeNageur() . "</td>\n";
        $ch .= "</tr></table>\n";
        return $ch;
    }

    /**
     * production d'une string contenant un formulaire HTML
     * destiné à saisir une nouveau livre ou à modifier un livre existant
     * @param array $assoc
     * @return string
     */
    public function getFormulaire4Nageur(array $assoc): string
    {
        $ch = "<div <div  id='formulaire'><div class='column is-1 '></div><div class='column'><form action='" . $_SERVER['PHP_SELF'] . "' method='GET'>\n";
        $i = 0;
        foreach ($assoc as $col => $val) {
            if (is_array($val)) {
                if ($i == 0) {
                    $ch .= "<input class='input is-info' name='$col' type='hidden' value='" . $val['default'] . "'/>\n";
                } else
                    $ch .= "$col : <input class='input is-info' name='$col' type='" . $val['type']
                        . "' value='" . $val['default'] . "'/></a>\n";
            } else {

                $ch .= "$col : <input class='input is-info' type='$val' name='$col' />\n";
            }
            ++$i;
        }


        $ch .= "<center></center><input class='button has-background-success is-outlined' type='submit' name='Valider' value='Modifier'/></center>\n";


        return $ch . "</form></div><div class='column is-1 '></div></div>\n";
    }
    public function getAllNageur(array $tabEntiteNageur): string
    {
        $ch = "<div class=\"columns\">
               <div class=\"column\">

               <table class=\"table is-striped is-fluid  \">
               <tr>";
        foreach ($tabEntiteNageur as $nageur) {
            if ($nageur instanceof EntiteNageur) {

                $ch .= "<td>";
                $ch .= " <tr>


                <th><strong>Nom</strong></th>
                 <th>Prénom</th>
                 <th>Age</th>
                 <th>Poste</th>
                 <th>Photo</th>


             </tr>";
                $ch .= "<td>" . $nageur->getIdNageur() . "</td> ";
                $ch .= "<th>" . $nageur->getNomNageur() . "</th>";
                $ch .= "<th>" . $nageur->getPrenomNageur() . " </th>";
                $ch .= "<th>" . $nageur->getPaysNageur() . "</th> ";
                $ch .= "<th>" . $nageur->getSexeNageur() . "</th> ";
                $ch .= "<th><a href='?action=update&id_nageur=" . $nageur->getIdNageur() . "'><input class='button is-primary' type='submit' name='envoi' value='Modifier' /></th></a>";
                $ch .= "<th><a href='?action=delete&id_nageur=" . $nageur->getIdNageur() . "'><input class='button is-primary' type='submit' name='envoi' value='supprimer' /></th></a> ";
                $ch .= "<td>\n";
            }
        }
        return $ch . "</div></div></table></tr>\n";
    }
}
