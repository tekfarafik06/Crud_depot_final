<?php

namespace natation;

class EntiteNageur
{
    protected int $id_nageur;
    protected string $prenom_nageur;
    protected string $nom_nageur;
    protected string $pays_nageur;
    protected string $sexe_nageur;

    /**
     * @return int
     */
    public function getIdNageur(): int
    {
        return $this->id_nageur;
    }

    /**
     * @param int $id_nageur
     */
    public function setIdNageur(int $id_nageur): void
    {

        $this->id_nageur = $id_nageur;
    }

    /**
     * @return string
     */
    public function getPrenomNageur(): string
    {
        return $this->prenom_nageur;
    }

    /**
     * @param string $prenom_nageur
     */
    public function setPrenomNageur(string $prenom_nageur): void
    {
        $this->prenom_nageur = $prenom_nageur;
    }

    /**
     * @return string
     */
    public function getNomNageur(): string
    {
        return $this->nom_nageur;
    }

    /**
     * @param string $nom_nageur
     */
    public function setNomNageur(string $nom_nageur): void
    {
        $this->nom_nageur = $nom_nageur;
    }

    /**
     * @return string
     */
    public function getPaysNageur(): string
    {
        return $this->pays_nageur;
    }

    /**
     * @param string $pays_nageur
     */
    public function setPaysNageur(string $pays_nageur): void
    {
        $this->pays_nageur = $pays_nageur;
    }

    /**
     * @return string
     */
    public function getSexeNageur(): string
    {
        return $this->sexe_nageur;
    }

    /**
     * @param string $sexe_nageur
     */
    public function setSexeNageur(string $sexe_nageur): void
    {
        $this->sexe_nageur = $sexe_nageur;
    }











}
