<?php

namespace natation;

use natation\EntiteEpreuve;
error_reporting(E_ALL);
ini_set("display_errors", 1);


class VueEpreuve
{

    public function getHTML4Epreuve(EntiteEpreuve $epreuve): string
    {
        $ch = "<table border='1'>
        <tr><th>liv_num</th><th>liv_titre</th><th>liv_depot_legal</th></tr><tr>\n";
        $ch .= "<tr><td>" . $epreuve->getIdEpreuve() . "</td>\n";
        $ch .= "<td>" . $epreuve->getNomEpreuve() . "</td>\n";
        $ch .= "<td>" . $epreuve->getTypeEpreuve() . "</td>\n";
        $ch .= "<td>" . $epreuve->getStatutEpreuve() . "</td>\n";

        $ch .= "</tr></table>\n";
        return $ch;
    }

    /**
     * production d'une string contenant un formulaire HTML
     * destiné à saisir une nouveau epreuve ou à modifier un epreuve existant
     * @param array $assoc
     * @return string
     */
    public function getinsert(array $tabEntiteEpreuve): string
    {

        $res = '<div class="insertContainer"  id="insertContainer">
                <form id="formulaire"  method="get" action="./CrudEpreuve.php" >
                    <div class="form-group">
       
                        <label for="cat">Nom epreuve</label>
                        <select type="text" id="nom_epreuve" name="nom_epreuve" class="form-control">
                            <option value="50m">50m</option>
                            <option value="100m">100m</option>
                            <option value="200m">200m</option>
                            <option value="400m">400m</option>
                            <option value="800m">800m</option>
                            <option value="1500m">1500m</option>
                        </select>
                         <label for="cat">Type epreuve</label>
                        <select type="text" id="type_epreuve" name="type_epreuve" class="form-control">
                            <option value="Papillon">Papillon</option>
                            <option value="Dos">Dos</option>
                            <option value="Brasse">Brasse</option>
                            <option value="Nage_liber">Nage_liber</option>
                        </select>
                           <label for="cat">statut Epreuve</label>
                        <select type="text" id="statut_epreuve" name="statut_epreuve" class="form-control">
                            <option value="Finale">Finale</option>
                            <option value="Demi_finale1">Demi_finale1</option>
                            <option value="Demi_finale2">Demi_finale2</option>
                            <option value="Series">Series</option>
                        </select>';


        $res .= '</div>
                                        <button type="submit" class="btn btn-primary">Ajout</button>
                                       </form>
                                    </div>';
        return $res;
    }
    public function getupdete(array $assoc): string
    {
        $corps = "";
        $idEpreuve = '';
        $corps .=  '<form method="post" id="formUpdate" action="../Crud/CrudEpreuve.php">
                        <div class="insertContainer" id="insertUpdateContainer">
                            <div class="form-group">';
                                foreach ($assoc as $col => $val) {
                                    $hidden = "";
                                    if (is_array($val)) {
                                        $hide = "";
                                        if($col == 'id_epreuve') {
                                            $hide = 'hidden';
                                        }
                                        $corps.='<label for="name" class="rowsInformation" '.$hide.'>'.$val['titre'].'</label>
                                                    <'.$val['balise'].' type='.$val['type'].' class="form-control" '.$hide.'  name="'.$col.'" value="'.$val['default'].'">';
                                                    if(isset($val['options'])){
                                                        foreach ($val['options'] as $col) {
                                                            //echo $val;
                                                            $corps.='<option value="'.$col.'">'.$col.'</option>';
                                                        }
                                                    }
                                                    $corps.='</'.$val['balise'].'>';
                                        //echo '<br>'.$val;

                                    }
                                }
        $corps.='   <input class="button is-primary" type="submit" value="Modifier" />
                   </div></div>
                  </form>';







        /*

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


        return $ch . "</form></div><div class='column is-1 '></div></div>\n"; */

        //$corps.=' </div>';

        return $corps;
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
                $ch .= "<th>" . $epreuve->getIdEpreuve() . "</th> ";
                $ch .= "<th>" . $epreuve->getNomEpreuve() . "</th>";
                $ch .= "<th>" . $epreuve->getTypeEpreuve() . "</th>";
                $ch .= "<th>" . $epreuve->getStatutEpreuve() . "</th>";


                $ch .= "<th><a href='?action=update&id_epreuve=" . $epreuve->getIdEpreuve() . "'><input class='button is-primary' type='submit' name='envoi' value='Modifier' /></th></a>";
                $ch .= "<th><a href='?action=delete&id_epreuve=" . $epreuve->getIdEpreuve() . "'><span class='tag is-danger'>Supprimer<button class='delete is-small' type='submit' name='envoi' value='supprimer'></button></span></th></a> ";
                $ch .= "<td>\n";
            }
        }
        return $ch . "</div></div></table></tr>\n";
    }
}
