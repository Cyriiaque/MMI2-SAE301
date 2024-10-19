<?php

require_once("Repository/EntityRepository.php");
require_once("Class/Cart.php");

class CartRepository extends EntityRepository {

    public function __construct(){
        parent::__construct();
    }

    public function find($id_order): array{
        $requete = $this->cnx->prepare("select * from Cart_products inner join Products on Cart_products.id_product = Products.id_product where id_order=:value");
        $requete->bindParam(':value', $id_order);
        $requete->execute();


        $answer = $requete->fetchAll(PDO::FETCH_OBJ);
        
        $res = [];
        
        foreach($answer as $obj){
            $p = new Cart((array)$obj);
            $p->setIdOrder($obj->id_order);
            $p->setIdProduct($obj->id_product);
            $p->setQuantity($obj->quantity);
            $p->setName($obj->name);
            $p->setSubtitle($obj->subtitle);
            $p->setPrice($obj->price);
            $p->setImage($obj->image);
            array_push($res, $p);
        }
       
        return $res;
    }

    public function findAll(){
        return false;
    }

    public function findType(){
        return false;
    }

    public function save($id_order, $id_product){
        $r = $this->cnx->prepare("select * from Cart_products WHERE id_order = :id_order AND id_product = :id_product");
        $r->bindParam(':id_order', $id_order);
        $r->bindParam(':id_product', $id_product);
        $r->execute();
        $a = $r->fetch(PDO::FETCH_OBJ);


        if($a == false){
            $requete = $this->cnx->prepare("insert into Cart_products (id_order, id_product, quantity) values (:id_order, :id_product ,:quantity)");
            $quantity = 1;
            $requete->bindParam(':id_order', $id_order );
            $requete->bindParam(':id_product', $id_product );
            $requete->bindParam(':quantity', $quantity);
            $answer = $requete->execute();
        }
        else{
            $requete = $this->cnx->prepare("update Cart_products set quantity = quantity + 1 where id_product = :value");
            $requete->bindParam(':value', $id_product);
            $answer = $requete->execute();
        }
        return false;
    }

    public function delete($id){
        return false;
    }

    public function update($product){
        return false;
    }

   
    
}