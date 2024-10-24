<?php
class Chaussures extends Product {
    private string $shoesize;

    public function __construct(array $data){
        parent::__construct($data);
        $this->shoesize = $data["shoesize"];
    }

    public function getShoesize()
    {
        return $this->shoesize;
    }

    public function JsonSerialize(): mixed
    {
        $t = parent::JsonSerialize();
        $t["shoesize"] = $this->shoesize;
        return $t;
    }


    /**
     * @return  self
     */
    public function setShoesize($shoesize): self
    {
        $this->shoesize = $shoesize;
        return $this;
    }

    /**
     * @return  self
     */
    public function setSize(): self
    {
        $this->size = NULL;
        return $this;
    }
}