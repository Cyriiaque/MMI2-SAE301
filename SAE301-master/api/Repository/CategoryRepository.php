<?php

require_once("Repository/EntityRepository.php");
require_once("Class/Product.php");
require_once("Class/Short.php");
require_once("Class/Tshirt.php");
require_once("Class/Chaussures.php");
require_once("Class/Type.php");

class CategoryRepository extends EntityRepository {

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

    public function find($type): array{
        $requete = $this->cnx->prepare("select * from Products where type=:value group by name; select distinct name from Products");
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
            $p->setPromo($obj->promo);
            array_push($res, $p);
        }
       
        return $res;
    }
    
    public function findbyAttribute($entity){
        return false;
    }

    public function findType(): array {
        $requete = $this->cnx->prepare("select distinct type from Products");
        $requete->execute();
        $answer = $requete->fetchAll(PDO::FETCH_OBJ);

        $res = [];
        
        foreach($answer as $obj){
            $p =  new Type((array)$obj);
            $p->setType($obj->type);
            array_push($res, $p);
        }
       
        return $res;
    }

    public function findAll(){
        return false;
    }

    public function saveAll($entity){
        return false;
    }

    public function save($entity){
        return false;
    }

    public function delete($entity){
        return false;
    }

    public function update($entity){
        return false;
    }

   
    
}