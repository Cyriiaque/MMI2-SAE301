<?php
class Cart implements JsonSerializable {
    private int $id_order;
    private string $id_product;
    private string $quantity;
    private float $promo;
    private string $name;
    private string $subtitle;
    private float $price;
    private string $image;
    private int $stock;


    public function __construct(array $data){
        $this->id_order = $data["id_order"];
        $this->id_product = $data["id_product"];
        $this->quantity = $data["quantity"];
        $this->promo = $data["promo"];
        $this->name = $data["name"];
        $this->subtitle = $data["subtitle"];
        $this->price = $data["price"];
        $this->image = $data["image"];
        $this->stock = $data["stock"];
        $this->size = $data["size"];
        $this->shoesize = $data["shoesize"];
    }

    public function getIdOrder(): int
    {
        return $this->id_order;
    }

    public function getIdProduct(): int
    {
        return $this->id_product;
    }

    public function getQuantity()
    {
        return $this->quantity;
    }

    public function getPromo()
    {
        return $this->promo;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getSubtitle()
    {
        return $this->subtitle;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function getStock()
    {
        return $this->stock;
    }

    public function getSize()
    {
        return $this->size;
    }

    public function getShoesize()
    {
        return $this->shoesize;
    }



    public function JsonSerialize(): mixed{
        return ["id_order" => $this->id_order, "id_product" => $this->id_product, "quantity" => $this->quantity, "promo" => $this->promo, "name" => $this->name, "subtitle" => $this->subtitle, "price" => $this->price, "image" => $this->image, "stock" => $this->stock, "size" => $this->size, "shoesize" => $this->shoesize];
    }


    /**
     *@return  self
     */ 
    public function setIdOrder($id_order): self
    {
        $this->id_order = $id_order;
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

    /**
     * @return  self
     */
    public function setPromo($promo): self
    {
        $this->promo = $promo;
        return $this;
    }

    /**
     * @return  self
     */
    public function setName($name): self
    {
        $this->name = $name;
        return $this;
    }

    /**
     * @return  self
     */
    public function setSubtitle($subtitle): self
    {
        $this->subtitle = $subtitle;
        return $this;
    }

    /**
     * @return  self
     */
    public function setPrice($price): self
    {
        $this->price = $price;
        return $this;
    }

    /**
     * @return  self
     */
    public function setImage($image): self
    {
        $this->image = $image;
        return $this;
    }

    /**
     * @return  self
     */
    public function setStock($stock): self
    {
        $this->stock = $stock;
        return $this;
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
    public function setShoesize($shoesize): self
    {
        $this->shoesize = $shoesize;
        return $this;
    }
}