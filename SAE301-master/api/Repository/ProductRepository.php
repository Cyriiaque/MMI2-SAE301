<?php

require_once("Repository/EntityRepository.php");
require_once("Class/Product.php");
require_once("Class/Short.php");
require_once("Class/Tshirt.php");
require_once("Class/Chaussures.php");

class ProductRepository extends EntityRepository {

    public function __construct(){
        parent::__construct();
    }

    public static function createProduct($data){
        $classname = ucfirst($data["type"]);
        if (class_exists($classname)){
            return new $classname($data);
        }
        else{
            throw new Exception("Type $classname inconnu");
        }
    }

    public function find($id): array{
        $requete = $this->cnx->prepare("select * from Products where id_product=:value");
        $requete->bindParam(':value', $id);
        $requete->execute();


        $answer = $requete->fetch(PDO::FETCH_OBJ);

        if ($answer==false) return null;

        //////////

        $requestcolor = $this->cnx->prepare("select distinct color from Products where name like '%".$answer->name."%' ");
        $requestcolor->execute();
        $answercolor = $requestcolor->fetchAll(PDO::FETCH_OBJ);
        

        $resultcolor = [];
        
        foreach($answercolor as $objcolor){
            $pcolor = $objcolor->color;
            array_push($resultcolor, $pcolor);
        }

        //////////

        $requestsize = $this->cnx->prepare("select distinct size from Products where name like '%".$answer->name."%' ");
        $requestsize->execute();
        $answersize = $requestsize->fetchAll(PDO::FETCH_OBJ);
        

        $resultsize = [];
        
        foreach($answersize as $objsize){
            $psize = $objsize->size;
            array_push($resultsize, $psize);
        }

        //////////

        $requestshoesize = $this->cnx->prepare("select distinct shoesize from Products where name like '%".$answer->name."%' ");
        $requestshoesize->execute();
        $answershoesize = $requestshoesize->fetchAll(PDO::FETCH_OBJ);
        

        $resultshoesize = [];
        
        foreach($answershoesize as $objshoesize){
            $pshoesize = $objshoesize->shoesize;
            array_push($resultshoesize, $pshoesize);
        }

        //////////

        $p = self::createProduct((array)$answer);
        $p->setId($answer->id_product);
        $p->setName($answer->name);
        $p->setSubtitle($answer->subtitle);
        $p->setDescription($answer->description);
        $p->setType($answer->type);
        $p->setPrice($answer->price);
        $p->setImage($answer->image);
        $p->setSize($answer->size);
        $p->setShoesize($answer->shoesize);
        $p->setGender($answer->gender);
        $p->setColor($answer->color);
        $p->setStock($answer->stock);
        $p->setPromo($answer->promo);
        return [$p, $resultcolor, $resultsize, $resultshoesize];
    }

    public function findAll(): array {
        $requete = $this->cnx->prepare("select * from Products group by name; select distinct name from Products");
        $requete->execute();
        $answer = $requete->fetchAll(PDO::FETCH_OBJ);

        $res = [];
        
        foreach($answer as $obj){
            $p = self::createProduct((array)$obj);
            $p->setId($obj->id_product);
            $p->setName($obj->name);
            $p->setSubtitle($obj->subtitle);
            $p->setDescription($obj->description);
            $p->setType($obj->type);
            $p->setPrice($obj->price);
            $p->setImage($obj->image);
            $p->setGender($obj->gender);
            $p->setSize($obj->size);
            $p->setShoesize($obj->shoesize);
            $p->setColor($obj->color);
            $p->setStock($obj->stock);
            $p->setPromo($obj->promo);
            array_push($res, $p);
        }
       
        return $res;
    }

    public function findType(){
        return false;
    }

    public function save($product){
        // pas d'appel avec get car l'id n'est pas défini dans ce cas
        $name=$product["name"];
        $subtitle=$product["subtitle"];
        $description=$product["description"];
        $price=$product["price"];
        $image=$product["image"];
        $type=$product["type"];
        $gender=$product["gender"];
        $color=$product["color"];
        $shoesize=$product["shoesize"];
        $size=$product["size"];
        $stock=$product["stock"];
        $promo=$product["promo"];
        if ($shoesize=="0") $shoesize=NULL;
        if ($size=="NULL") $size=NULL;

        $requete = $this->cnx->prepare("insert into Products (name, subtitle, description, price, image, type, gender, color, shoesize, size, stock, promo) values (:name, :subtitle, :description, :price, :image, :type, :gender, :color, :shoesize, :size, :stock, :promo)");
        $requete->bindParam(':name', $name);
        $requete->bindParam(':subtitle', $subtitle);
        $requete->bindParam(':description', $description);
        $requete->bindParam(':price', $price);
        $requete->bindParam(':image', $image);
        $requete->bindParam(':type', $type);
        $requete->bindParam(':gender', $gender);
        $requete->bindParam(':color', $color);
        $requete->bindParam(':shoesize', $shoesize);
        $requete->bindParam(':size', $size);
        $requete->bindParam(':stock', $stock);
        $requete->bindParam(':promo', $promo);
        
        $answer = $requete->execute();
        if($answer==false){
            return false;
        }
        else{
            return true;
        }
    }

    public function delete($entity){
        return false;
    }

    public function update($entity){
        return false;
    }
    
}