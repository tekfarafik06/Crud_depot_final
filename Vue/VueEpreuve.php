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
        $ch .= "<td>" . $epreuve->getStatutEpreuve(). "</td>\n";

        $ch.= "</tr></table>\n";
        return $ch;

    }

    /**
     * production d'une string contenant un formulaire HTML
     * destiné à saisir une nouveau epreuve ou à modifier un epreuve existant
     * @param array $assoc
     * @return string
     */
    public function getFormulaire4Epreuve(array $assoc): string
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


        $ch .= "<center></center><input class='button has-background-success is-outlined' type='submit' name='Valider' value='sauver'/></center>\n";


        return $ch . "</form></div><div class='column is-1 '></div></div>\n";
    }

    public function getAllEpreuve(array $tabEntiteEpreuve): string
    {
        $ch = "<div class=\"columns\">
               <div class=\"column\">

               <table class=\"table is-striped is-fluid  \">
               <tr>";

               $ch .= "<th>id</th>
                 <th>nom</th>
                 <th>Type</th>
                 <th>Status</th>";
                 
        foreach ($tabEntiteEpreuve as $epreuve) {
            if ($epreuve instanceof EntiteEpreuve) {

                
                $ch .= "<td>";
                $ch .= " <tr>

             </tr>";
                $ch .= "<th>".$epreuve->getIdEpreuve()."</th> ";
                $ch .= "<th>".$epreuve->getNomEpreuve()."</th>";
                $ch .= "<th>".$epreuve->getTypeEpreuve()."</th>";
                $ch .= "<th>".$epreuve->getStatutEpreuve()."</th>";
               

                $ch .= "<th><a href='?action=update&id_epreuve=" . $epreuve->getIdEpreuve() . "'><input class='button is-primary' type='submit' name='envoi' value='Modifier' /></th></a>";
                $ch .= "<th><a href='?action=delete&id_epreuve=" . $epreuve->getIdEpreuve() . "'><span class='tag is-danger'>Supprimer<button class='delete is-small' type='submit' name='envoi' value='supprimer'></button></span></th></a> ";
                $ch .= "<td>\n";
            }
        }
        return $ch . "</div></div></table></tr>\n";

    }


}