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
        $requete = $this->cnx->prepare("select * from Products where id_product=:value");// prepare la requête SQL
        $requete->bindParam(':value', $id); // fait le lien entre le "tag" :value et la valeur de $id
        $requete->execute(); // execute la requête


        $answer = $requete->fetch(PDO::FETCH_OBJ);
        
        if ($answer==false) return null; // may be false if the sql request failed (wrong $id value for example)

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

    public function findByCategory($type): array {
        $requete = $this->cnx->prepare("select * from Products where type=:value");
        $requete->bindParam(':value', $type);
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
        // Not implemented ! TODO when needed !
        return false;
    }

    public function save($product){
        // $requete = $this->cnx->prepare("insert into Products (name, category) values (:name, :idcategory)");
        // $name = $product->getName();
        // $idcat = $product->getIdcategory();
        // $requete->bindParam(':name', $name );
        // $requete->bindParam(':idcategory', $idcat);
        // $answer = $requete->execute(); // an insert query returns true or false. $answer is a boolean.

        // if ($answer){
        //     $id = $this->cnx->lastInsertId(); // retrieve the id of the last insert query
        //     $product->setId($id); // set the product id to its real value.
        //     return true;
        // }
          
        return false;
    }

    public function delete($id){
        // Not implemented ! TODO when needed !
        return false;
    }

    public function update($product){
        // Not implemented ! TODO when needed !
        return false;
    }

   
    
}