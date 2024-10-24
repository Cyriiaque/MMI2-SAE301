<?php
class Order extends Cart {
    private int $id_user;
    private string $date;
    private string $statut;

    public function __construct(array $data){
        parent::__construct($data);
        $this->id_user = $data["id_user"];
        $this->date = $data["date"];
        $this->statut = $data["statut"];
    }

    public function getIdUser(): int
    {
        return $this->id_user;
    }

    public function getDate(): string
    {
        return $this->date;
    }

    public function getStatut(): string
    {
        return $this->statut;
    }



    public function JsonSerialize(): mixed
    {
        $t = parent::JsonSerialize();
        $t["id_user"] = $this->id_user;
        $t["date"] = $this->date;
        $t["statut"] = $this->statut;
        return $t;
    }


    /**
     * @return  self
     */
    public function setIdUser($id_user): self
    {
        $this->id_user = $id_user;
        return $this;
    }

    /**
     * @return  self
     */
    public function setDate($date): self
    {
        $this->date = $date;
        return $this;
    }

    /**
     * @return  self
     */
    public function setStatut($statut): self
    {
        $this->statut = $statut;
        return $this;
    }
}