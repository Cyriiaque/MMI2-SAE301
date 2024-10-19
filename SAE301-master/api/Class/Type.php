<?php
class Type implements JsonSerializable {
    private string $type;


    public function __construct(array $data){
        $this->type = $data["type"];
    }

    public function getType()
    {
        return $this->type;
    }



    public function JsonSerialize(): mixed{
        return ["type" => $this->type];
    }

    /**
     * @return  self
     */
    public function setType($type): self
    {
        $this->type = $type;
        return $this;
    }
}