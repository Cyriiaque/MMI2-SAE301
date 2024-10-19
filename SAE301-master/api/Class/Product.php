<?php
class Product implements JsonSerializable {
    private int $id_product;
    private string $name;
    private string $subtitle;
    private string $description;
    private string $type;
    private float $price;
    private string $image;
    private string $gender;
    private string $color;
    private string $stock;


    public function __construct(array $data){
        $this->id_product = $data["id_product"];
        $this->name = $data["name"];
        $this->subtitle = $data["subtitle"];
        $this->description = $data["description"];
        $this->type = $data["type"];
        $this->price = $data["price"];
        $this->image = $data["image"];
        $this->gender = $data["gender"];
        $this->color = $data["color"];
        $this->stock = $data["stock"];
    }

    public function getId(): int
    {
        return $this->id_product;
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getSubtitle()
    {
        return $this->subtitle;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function getType()
    {
        return $this->type;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function getImage()
    {
        return $this->image;
    }


    public function getGender()
    {
        return $this->gender;
    }

    public function getColor()
    {
        return $this->color;
    }

    public function getStock()
    {
        return $this->stock;
    }



    public function JsonSerialize(): mixed{
        return ["id_product" => $this->id_product, "name" => $this->name, "subtitle" => $this->subtitle, "description" => $this->description, "type" => $this->type, "price" => $this->price, "image" => $this->image, "gender" => $this->gender, "color" => $this->color, "stock" => $this->stock];
    }


    /**
     *@return  self
     */ 
    public function setId($id_product): self
    {
        $this->id_product = $id_product;
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
    public function setDescription($description): self
    {
        $this->description = $description;
        return $this;
    }

    /**
     * @return  self
     */
    public function setType($type): self
    {
        $this->type = $type;
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
    public function setGender($gender): self
    {
        $this->gender = $gender;
        return $this;
    }

    /**
     * @return  self
     */
    public function setColor($color): self
    {
        $this->color = $color;
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
}