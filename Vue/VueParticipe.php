<?php

namespace natation;

use natation\EntiteParticipe;


class VueParticipe
{

    public function getHTML4Participe(EntiteParticipe $participe): string
    {
        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr><td>" . $participe->getIdEpreuve() . "</td>\n";
        $ch .= "<td>" . $participe->getIdNageur() . "</td>\n";
        $ch .= "<td>" . $participe->getDateEpreuve() . "</td>\n";
        $ch .= "<td>" . $participe->getPerformance() . "</td>\n";
        $ch .= "<td>" . $participe->getClassement() . "</td>\n";
        $ch .= "<td>" . $participe->getNomMedaille() . "</td>\n";
        $ch .= "</tr></table>\n";
        return $ch;
    }

    /**
     *
     *
     * @param array $assoc
     * @return string
     */
    public function getFormulaire4Participe(array $assoc): string
    {
        $ch = "<form action='" . $_SERVER['PHP_SELF'] . "' method='GET'>\n";
        foreach ($assoc as $col => $val) {
            if (is_array($val)) {
                $ch .= "$col : <input name='$col' type='" . $val['type']
                    . "' value='" . $val['default'] . "' />\n";
            } else
                $ch .= "$col : <input type='$val' name='$col' />\n";
        }
        $ch .= "<input type='submit' name='Valider' value='Sauver'/>\n";


        return $ch . "</form>\n";
    }


    public function getAllParticipe(array $tabEntiteParticipe): string
    {
        $ch = "";
        foreach ($tabEntiteParticipe as $participe) {
            $ch .= "";
            if ($participe instanceof EntiteParticipe) {
                $id_nageur = $participe->getNomNageur();
                $id_epreuve = $participe->getNomEpreuve();

                $ch .= "<div  class='box' id='box4' >";
                $ch .= "<h1>Nom nageur :</h1><a href='CrudNageur.php?id_nageur=$id_nageur'>" . $participe->getNomNageur() . "</a>\n";
                $ch .= "<h1>Nom epreuve :</h1><a href='CrudEpruve.php?id_nageur=$id_epreuve'>" . $participe->getNomEpreuve() . "</a>\n";
                $ch .= "<h1> classement:</h1>" . $participe->getClassement() . "</td>\n";
                $ch .= "<h1>Perfermance</h1>" . $participe->getPerformance() . "</td>\n";
                $ch .= "<h1>date erpeuve</h1>" . $participe->getDateEpreuve() . "</td>\n";
                $ch .= "</div>\n";
            }
        }
        return $ch;
    }
}
