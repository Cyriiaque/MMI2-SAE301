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

    public function find($id): ?Product{
        $requete = $this->cnx->prepare("select * from Products where id_product=:value");
        $requete->bindParam(':value', $id);
        $requete->execute();


        $answer = $requete->fetch(PDO::FETCH_OBJ);
        
        if ($answer==false) return null;

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
        return $p;
    }

    public function findAll(): array {
        $requete = $this->cnx->prepare("select * from Products");
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
            array_push($res, $p);
        }
       
        return $res;
    }

    public function findType(){
        return false;
    }

    public function save($product,$product2){
        return false;
    }

    public function delete($id){
        return false;
    }

    public function update($product){
        return false;
    }

   
    
}