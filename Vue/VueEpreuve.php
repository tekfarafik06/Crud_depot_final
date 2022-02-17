<?php
namespace natation;
use natation\EntiteEpreuve;


class VueEpreuve
{

    public function getHTML4Epreuve(EntiteEpreuve $epreuve): string
    {
        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr><td>" . $epreuve->getIdEpreuve() . "</td>\n";
        $ch .= "<td>" . $epreuve->getNomEpreuve() . "</td>\n";
        $ch .= "<td>" . $epreuve->getTypeEpreuve(). "</td>\n";
        $ch.= "</tr></table>\n";
        return $ch;

    }

    /**
     * production d'une string contenant un formulaire HTML
     * destiné à saisir une nouveau livre ou à modifier un livre existant
     * @param array $assoc
     * @return string
     */
    public function getFormulaire4Epreuve(array $assoc): string
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


    public function getAllEpreuve(array $tabEntiteEpreuve): string
    {
        $ch = "<ul>\n";
        foreach ($tabEntiteEpreuve as $epreuve) {
            if ($epreuve instanceof EntiteEpreuve) {
                $ch .= "<li>".$epreuve->getIdEpreuve()." ";
                $ch .= $epreuve->getNomEpreuve()." ";
                $ch .= $epreuve->getTypeEpreuve()." ";
                $ch .= "<a href='?action=update&id_epreuve=".$epreuve->getIdEpreuve()."'>Modifier</a> ";
                $ch .= "<a href='?action=delete&id_epreuve=".$epreuve->getIdEpreuve()."'>Supprimer</a> ";
                $ch .= "</li>\n";
            }
        }
        return $ch."</ul>\n";
    }


}