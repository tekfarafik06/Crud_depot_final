<?php
namespace participe;
use natation\EntiteParticipe;


class VueParticipe
{

    public function getHTML4Participe(\EntiteParticipe $participe): string
    {
        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr><td>" . $participe->getIdEpreuve() . "</td>\n";
        $ch .= "<td>" . $participe->getIdNageur() . "</td>\n";
        $ch .= "<td>" . $participe->getDateEpreuve(). "</td>\n";
        $ch .= "<td>" . $participe->getPerformance(). "</td>\n";
        $ch .= "<td>" . $participe->getClassement(). "</td>\n";
        $ch .= "<td>" . $participe->getNomMedaille(). "</td>\n";
        $ch.= "</tr></table>\n";
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
        $ch = "<form action='".$_SERVER['PHP_SELF']."' method='GET'>\n";
        foreach ($assoc as $col => $val) {
            if (is_array($val)) {
                $ch .= "$col : <input name='$col' type='".$val['type']
                    ."' value='".$val['default']."' />\n";
            }
            else
                $ch .= "$col : <input type='$val' name='$col' />\n";
        }
        $ch .= "<input type='submit' name='Valider' value='Sauver'/>\n";


        return $ch."</form>\n";
    }


    public function getAllParticipe(array $tabEntiteParticipe): string
    {
        $ch = "<ul>\n";
        foreach ($tabEntiteParticipe as $participe) {
            if ($participe instanceof EntiteParticipe) {
                $ch .= "<li>".$participe->getIdEpreuve()." ";
                $ch .= $participe->getIdNageur()." ";
                $ch .= $participe->getDateEpreuve()." ";
                $ch .= $participe->getPerformance()." ";
                $ch .= $participe->getClassement()." ";
                $ch .= $participe->getNomMedaille()." ";
                $ch .= "<a href='?action=update&id_epreuve=".$participe->getIdEpreuve()."'>Modifier</a> ";
                $ch .= "<a href='?action=delete&id_epreuve=".$participe->getIdEpreuve()."'>Supprimer</a> ";
                $ch .= "<a href='?action=update&id_epreuve=".$participe->getIdNageur()."'>Modifier</a> ";
                $ch .= "<a href='?action=delete&id_epreuve=".$participe->getIdNageur()."'>Supprimer</a> ";
                $ch .= "</li>\n";
            }
        }
        return $ch."</ul>\n";
    }


}
