<?php
namespace natation;
use natation\EntiteNageur;


class VueNageur
{

    public function getHTML4Nageur(EntiteNageur $nageur): string
    {
        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr><td>" . $nageur->getIdNageur() . "</td>\n";
        $ch .= "<td>" . $nageur->getNomNageur() . "</td>\n";
        $ch .= "<td>" . $nageur->getPrenomNageur(). "</td>\n";
        $ch.= "</tr></table>\n";
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


    public function getAllNageur(array $tabEntiteNageur): string
    {
        $ch = "<ul>\n";
        foreach ($tabEntiteNageur as $nageur) {
            if ($nageur instanceof EntiteNageur) {
                $ch .= "<li>".$nageur->getIdNageur()." ";
                $ch .= $nageur->getNomNageur()." ";
                $ch .= $nageur->getPrenomNageur()." ";
                $ch .= "<a href='?action=insert&id_nageur=".$nageur->getIdNageur()."'>ajouter</a> ";
                $ch .= "<a href='?action=update&id_nageur=".$nageur->getIdNageur()."'>Modifier</a> ";
                $ch .= "<a href='?action=delete&id_nageur=".$nageur->getIdNageur()."'>Supprimer</a> ";
                $ch .= "</li>\n";

            }
        }
        return $ch."</ul>\n";
    }


}
