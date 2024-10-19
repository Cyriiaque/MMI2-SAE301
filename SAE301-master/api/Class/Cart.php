<?php
class Cart implements JsonSerializable {
    private int $id;
    private string $id_product;
    private string $quantity;


    public function __construct(array $data){
        $this->id_cart = $data["id_cart"];
        $this->id_product = $data["id_product"];
        $this->quantity = $data["quantity"];
    }

    public function getIdCart(): int
    {
        return $this->id_cart;
    }

    public function getIdProduct(): int
    {
        return $this->id_product;
    }

    public function getQuantity()
    {
        return $this->quantity;
    }



    public function JsonSerialize(): mixed{
        return ["id_cart" => $this->id_cart, "id_product" => $this->id_product, "quantity" => $this->quantity];
    }


    /**
     *@return  self
     */ 
    public function setIdCart($id_cart): self
    {
        $this->id_cart = $id_cart;
        return $this;
    }

    /**
     * @return  self
     */ 
    public function setIdProduct($id_product): self
    {
        $this->id_product = $id_product;
        return $this;
    }

    /**
     * @return  self
     */
    public function setQuantity($quantity): self
    {
        $this->quantity = $quantity;
        return $this;
    }
}