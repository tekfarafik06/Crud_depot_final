<?php

namespace natation;

use PDO;
use PDOException;
use PDOStatement;

include "VariableDsn.php";
// MuPDO
class MyPDO
{


    /**
     * @var PDO
     */
    private $pdo;
    /**
     * @var PDOStatement
     */
    private $pdos_selectAll;
    /**
     * @var PDOStatement
     */
    private $pdos_select;
    /**
     * @var PDOStatement
     */
    private $pdos_update;
    /**
     * @var PDOStatement
     */
    private $pdos_insert;
    /**
     * @var PDOStatement
     */
    private $pdos_delete;
    /**
     * @var PDOStatement
     */
    private $pdos_count;

    /**
     * @var string
     */
    private $nomTable;


    /**
     * MyPDO constructor.
     * @param $sgbd
     * @param $host
     * @param $db
     * @param $user
     * @param $password
     * @param $nomTable
     */
    public function __construct($sgbd, $host, $db, $user, $password, $nomTable)
    {


        switch ($sgbd) {
            case "mysql":
                $this->pdo = new PDO("mysql:host=" . $host . ";dbname=" . $db, $user, $password);
                break;
            case "pgsql":
                $this->pdo = new PDO("pgsql:host=" . $host . " dbname=" . $db . " user=" . $user
                    . " password=" . $password);
                break;
            default:
                exit;
        }

        // pour récupérer aussi les exceptions provenant de PDOStatement
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->nomTable = $nomTable;
    }

    /**
     * @param string $nomTable
     */
    public function setNomTable(string $nomTable): void
    {
        $this->nomTable = $nomTable;
    }

    /**
     * préparation de la requête SELECT * FROM $nomTable
     * instantiation de $this->pdos_selectAll
     */
    public function initPDOS_selectAll()
    {
        $this->pdos_selectAll = $this->pdo->prepare('SELECT * FROM ' . $this->nomTable);
    }

    /**
     * Suppose une convention de nommage de la classe entité et de son namespace !!
     * @return array
     */
    public function getAll(): array
    {

        if (!isset($this->pdos_selectAll))
            $this->initPDOS_selectAll();
        $this->getPdosSelectAll()->execute();
        return $this->getPdosSelectAll()->fetchAll(
            PDO::FETCH_CLASS,
            "natation\Entite" . ucfirst($this->getNomTable())
        );
    }






    /**
     * préparation de la requête SELECT * FROM $this->nomTable WHERE $nomColId = :id
     * instantiation de $this->pdos_select
     * @param string $nomColID
     */
    public function initPDOS_select(string $nomColID = "id"): void
    {
        $requete = "SELECT * FROM " . $this->nomTable . " WHERE $nomColID = :$nomColID";
        $this->pdos_select = $this->pdo->prepare($requete);
    }

    /**
     * Suppose une convention de nommage de la classe entité et de son namespace !!
     * @param $key le nom de la colonne associée à la clé primaire
     * @param $val
     * @return mixed
     */

    public function getParticipe($val1, $val2)
    {
        if (!isset($this->pdos_select)) {
            $requete = "SELECT * FROM " . $this->nomTable . " WHERE id_nageur = $val1 AND id_epreuve = $val2;";
            $this->pdos_select = $this->pdo->prepare($requete);
            $this->pdos_select->execute();
            return $this->getPdosSelect()
                ->fetchObject("natation\Entite" . ucfirst($this->getNomTable()));
        }
    }

    public function get($key, $val)
    {
        if (!isset($this->pdos_select))
            $this->initPDOS_select($key);
        $this->getPdosSelect()->bindValue(":" . $key, $val);
        $this->getPdosSelect()->execute();
        return $this->getPdosSelect()
            ->fetchObject("natation\Entite" . ucfirst($this->getNomTable()));
    }


    /**
     * @param string $nomColId
     * @param array $colNames
     */


    public function initPDOS_update(string $nomColId, array $colNames): void
    {
        $query = "UPDATE " . $this->nomTable . " SET ";
        foreach ($colNames as $colName) {
            $query .= $colName . "=:" . $colName . ", ";
        }
        $query = substr($query, 0, strlen($query) - 2);
        $query .= " WHERE " . $nomColId . "=:" . $nomColId;
        $this->pdos_update =  $this->pdo->prepare($query);
    }

    public function initPDOS_updateParticipe(string $nomColId, string $nomColId2,  array $colNames): void
    {
        $query = "UPDATE " . $this->nomTable . " SET ";
        foreach ($colNames as $colName) {
            $query .= $colName . "=:" . $colName . ", ";
        }
        $query = substr($query, 0, strlen($query) - 2);
        $query .= " WHERE " . $nomColId . "=:" . $nomColId.
            " AND " . $nomColId2 . "=:" . $nomColId2;
        $this->pdos_update =  $this->pdo->prepare($query);
    }

    /**
     * @param string $id
     * @param array $assoc
     */
    public function update(string $id, array $assoc): void
    {
        if (!isset($this->pdos_update))
            $this->initPDOS_update($id, array_keys($assoc));
        foreach ($assoc as $key => $value) {
            $this->getPdosUpdate()->bindValue(":" . $key, $value);
        }
        $this->getPdosUpdate()->execute();
    }

    public function updateParticipe($id, $id2, array $assoc): void
    {
        /*$query = "";
        if (!isset($this->pdos_select)) {
            $query = "UPDATE participe SET  ";//. " WHERE id_nageur = $val1 AND id_epreuve = $val2;";
            $cpt = 0;

            foreach ($assoc as $elt) {
                $query .= key($elt) . " = $elt";
                if ($cpt < count($assoc) - 1) $requete .= ",";
            }
            $query .= " where  id_nageur = $id_nageur , id_epreuve = $id_epreuve ;";
        }
        echo $query;
        $query = $this->pdo->prepare($query);
        $query->execute();*/

        if (!isset($this->pdos_update))
            $this->initPDOS_updateParticipe($id, $id2, array_keys($assoc));
        foreach ($assoc as $key => $value) {
            $this->getPdosUpdate()->bindValue(":" . $key, $value);
        }
        $this->getPdosUpdate()->execute();

    }

    /**
     * @param array
     */
    public function initPDOS_insert(array $colNames): void
    {
        $query = "INSERT INTO " . $this->nomTable . " VALUES(";
        foreach ($colNames as $colName) {
            $query .= ":" . $colName . ", ";
        }

        $query = substr($query, 0, strlen($query) - 2);
        $query .= ')';
        //echo $query;
        $this->pdos_insert = $this->pdo->prepare($query);
    }

    /**
     * @param array $assoc
     */
    public function insert(array $assoc): void
    {
        if (!isset($this->pdos_insert))
            $this->initPDOS_insert(array_keys($assoc));
        foreach ($assoc as $key => $value) {
            $this->getPdosInsert()->bindValue(":" . $key, $value);
        }
        $this->getPdosInsert()->execute();
    }

    public function countParticipants(int $id1,int $id2)
    {
        $this->verifierLiaisonParticipe( $id1, $id2);
    }

    public function verifierLiaisonParticipe(int $id1,int $id2){
        $requete= 'select count(*) FROM nageur as n INNER JOIN participe as p on(n.id_nageur = p.id_nageur)
                    INNER JOIN  epreuve as e ON(e.id_epreuve = p.id_epreuve)
                    where n.id_nageur ='.$id1.' AND e.id_epreuve ='.$id2.';';
        $this->pdos_count = $this->pdo->prepare($requete);

        /*$this->pdos_select = $this->pdo->prepare($requete);
        echo $requete;*/
        //$requete= $this->pdo->prepare($requete);

        //return $this->pdos_select->execute()->fetch(PDO::FETCH_NUM)[0];;
    }
    public function insertParticipe(array $assoc): void
    {
        $requete ="";
        if (!isset($this->pdos_select)) {
            /*$requete = "INSERT INTO
                        participe(id_nageur , id_epreuve , nom_medaille , classement , date_epreuve , performance); ";/* . " WHERE id_nageur = $val1 AND id_epreuve = $val2;";
            */
            $requete = "INSERT INTO  
                        participe VALUES(";/* . " WHERE id_nageur = $val1 AND id_epreuve = $val2;";*/

            $cpt = 0;

            foreach ($assoc as $elt) {
                $virgule = "";
                if($cpt > 0) $virgule = ", ";
                $requete .= $virgule . '"'.$elt.'"';
                $cpt++;
            }
            $requete.=")";
        }
        echo $requete;
        $requete= $this->pdo->prepare($requete);
        $requete->execute();
    }

    /**
     * @param string
     */
    public function initPDOS_delete(string $nomColId = "id"): void
    {
        $this->pdos_delete = $this->pdo->prepare("DELETE FROM " . $this->nomTable
            . " WHERE $nomColId=:" . $nomColId);
    }

    /**
     * @param array $assoc
     */
    public function delete(array $assoc)
    {
        if (!isset($this->pdos_delete))
            $this->initPDOS_delete(array_keys($assoc)[0]);
        foreach ($assoc as $key => $value) {
            $this->getPdosDelete()->bindValue(":" . $key, $value);
        }
        $this->getPdosDelete()->execute();
    }


    public function deleteParticipe($id1, $id2)
    {
        $requete = "delete FROM participe WHERE id_nageur = $id1 AND id_epreuve = $id2;";

        $query = $this->pdo->prepare($requete);
        $query->execute();
    }

    /**
     * préparation de la requête SELECT COUNT(*) FROM livre
     * instantiation de self::$_pdos_count
     */
    public function initPDOS_count()
    {
        $this->pdos_count = $this->pdo->prepare('SELECT COUNT(*) FROM ' . $this->nomTable);
    }
    public function count()
    {
        $this->initPDOS_count();
    }


    public function getCountValue(): int
    {
        $this->count();
        return $this->pdos_count->fetch(PDO::FETCH_NUM)[0];
    }

    /**
     * @return PDO
     */
    public function getPdo(): PDO
    {
        return $this->pdo;
    }

    /**
     * @return PDOStatement
     */
    public function getPdosSelect(): PDOStatement
    {
        return $this->pdos_select;
    }


    /**
     * @return PDOStatement
     */
    public function getPdosSelectAll(): PDOStatement
    {
        return $this->pdos_selectAll;
    }

    /**
     * @return PDOStatement
     */
    public function getPdosUpdate(): PDOStatement
    {
        return $this->pdos_update;
    }

    /**
     * @return PDOStatement
     */
    public function getPdosInsert(): PDOStatement
    {
        return $this->pdos_insert;
    }

    /**
     * @return PDOStatement
     */
    public function getPdosDelete(): PDOStatement
    {
        return $this->pdos_delete;
    }

    /**
     * @return PDOStatement
     */
    public function getPdosCount(): PDOStatement
    {
        return $this->pdos_count;
    }

    /**
     * @return string
     */
    public function getNomTable(): string
    {
        return $this->nomTable;
    }
}
