<?php
class EntiteParticipe{
    protected int $id_nageur;
    protected int $id_epreuve;
    protected int $date_epreuve;
    protected int $performance;
    protected int $classement;
    protected string $nom_medaille;

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
     * @return int
     */
    public function getDateEpreuve(): int
    {
        return $this->date_epreuve;
    }

    /**
     * @param int $date_epreuve
     */
    public function setDateEpreuve(int $date_epreuve): void
    {
        $this->date_epreuve = $date_epreuve;
    }

    /**
     * @return int
     */
    public function getPerformance(): int
    {
        return $this->performance;
    }

    /**
     * @param int $performance
     */
    public function setPerformance(int $performance): void
    {
        $this->performance = $performance;
    }

    /**
     * @return int
     */
    public function getClassement(): int
    {
        return $this->classement;
    }

    /**
     * @param int $classement
     */
    public function setClassement(int $classement): void
    {
        $this->classement = $classement;
    }

    /**
     * @return string
     */
    public function getNomMedaille(): string
    {
        return $this->nom_medaille;
    }

    /**
     * @param string $nom_medaille
     */
    public function setNomMedaille(string $nom_medaille): void
    {
        $this->nom_medaille = $nom_medaille;
    }

}

