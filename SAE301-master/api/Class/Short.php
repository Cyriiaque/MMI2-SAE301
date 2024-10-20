<?php
class Short extends Product {
    private string $size;

    public function __construct(array $data){
        parent::__construct($data);
        $this->size = $data["size"];
    }

    public function getSize()
    {
        return $this->size;
    }



    public function JsonSerialize(): mixed
    {
        $t = parent::JsonSerialize();
        $t["size"] = $this->size;
        return $t;
    }


    /**
     * @return  self
     */
    public function setSize($size): self
    {
        $this->size = $size;
        return $this;
    }

        /**
     * @return  self
     */
    public function setShoesize(): self
    {
        $this->shoesize = NULL;
        return $this;
    }
}