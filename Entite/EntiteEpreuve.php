<?php

namespace natation;

class EntiteEpreuve
{
    protected int $id_epreuve;
    protected string $nom_epreuve;
    protected string $type_epreuve;
    protected string $statut_epreuve;

    /**
     * @return int
     */
    public function getIdEpreuve(): int
    {
        return $this->id_epreuve;
    }

    /**
     * @param int $id_epreuve
     */
    public function setIdEpreuve(int $id_epreuve): void
    {
        $this->id_epreuve = $id_epreuve;
    }

    /**
     * @return string
     */
    public function getNomEpreuve(): string
    {
        return $this->nom_epreuve;
    }

    /**
     * @param string $nom_epreuve
     */
    public function setNomEpreuve(string $nom_epreuve): void
    {
        $this->nom_epreuve = $nom_epreuve;
    }

    /**
     * @return string
     */
    public function getTypeEpreuve(): string
    {
        return $this->type_epreuve;
    }

    /**
     * @param string $type_epreuve
     */
    public function setTypeEpreuve(string $type_epreuve): void
    {
        $this->type_epreuve = $type_epreuve;
    }

    /**
     * @return string
     */
    public function getStatutEpreuve(): string
    {
        return $this->statut_epreuve;
    }

    /**
     * @param string $statut_epreuve
     */
    public function setStatutEpreuve(string $statut_epreuve): void
    {
        $this->statut_epreuve = $statut_epreuve;
    }



}