<?php

require_once("Repository/EntityRepository.php");
require_once("Class/Cart.php");
require_once("Class/Order.php");

class CartRepository extends EntityRepository {

    public function __construct(){
        parent::__construct();
    }

    public function find($id_order): array{
        $requete = $this->cnx->prepare("select * from Orders inner join Cart_products on Orders.id_order = Cart_products.id_order inner join Products on Cart_products.id_product = Products.id_product where Cart_products.id_order=:value");
        $requete->bindParam(':value', $id_order);
        $requete->execute();


        $answer = $requete->fetchAll(PDO::FETCH_OBJ);
        
        $res = [];
        
        foreach($answer as $obj){
            $p = new Cart((array)$obj);
            $p->setIdOrder($obj->id_order);
            $p->setIdProduct($obj->id_product);
            $p->setQuantity($obj->quantity);
            $p->setPromo($obj->promo);
            $p->setName($obj->name);
            $p->setSubtitle($obj->subtitle);
            $p->setPrice($obj->price);
            $p->setImage($obj->image);
            $p->setStock($obj->stock);

            $p->setSize($obj->size);
            $p->setShoesize($obj->shoesize);
            
            array_push($res, $p);

            // $sizes=[$obj->size,$obj->shoesize];
            // array_push($res, $sizes);
        }
       
        return $res;
    }

    public function findAll(){
        $requete = $this->cnx->prepare("select * from Orders inner join Cart_products on Orders.id_order = Cart_products.id_order inner join Products on Cart_products.id_product = Products.id_product");
        $requete->execute();


        $answer = $requete->fetchAll(PDO::FETCH_OBJ);
        
        $res = [];
        
        foreach($answer as $obj){
            $p = new Order((array)$obj);
            $p->setIdOrder($obj->id_order);
            $p->setIdProduct($obj->id_product);
            $p->setQuantity($obj->quantity);
            $p->setPromo($obj->promo);
            $p->setName($obj->name);
            $p->setSubtitle($obj->subtitle);
            $p->setPrice($obj->price);
            $p->setImage($obj->image);
            $p->setIdUser($obj->id_user);
            $p->setDate($obj->date);
            $p->setStatut($obj->statut);
            array_push($res, $p);
        }
       
        return $res;
    }

    public function findbyAttribute($entity){
        return false;
    }

    public function findType(){
        return false;
    }

    public function save($entity){
        $id_order = $entity["id_order"];
        $id_product = $entity["id_product"];
        $req = $this->cnx->prepare("select stock from Products WHERE id_product = :id_product");
        $req->bindParam(':id_product', $id_product);
        $req->execute();
        $ans = $req->fetch(PDO::FETCH_OBJ);

        if ($ans->stock > 0){

            $r = $this->cnx->prepare("select * from Cart_products WHERE id_order = :id_order AND id_product = :id_product");
            $r->bindParam(':id_order', $id_order);
            $r->bindParam(':id_product', $id_product);
            $r->execute();
            $a = $r->fetch(PDO::FETCH_OBJ);

            if ($a->quantity < $ans->stock){
                if($a == false){
                    $requete = $this->cnx->prepare("insert into Cart_products (id_order, id_product, quantity) values (:id_order, :id_product ,:quantity)");
                    $quantity = 1;
                    $requete->bindParam(':id_order', $id_order );
                    $requete->bindParam(':id_product', $id_product );
                    $requete->bindParam(':quantity', $quantity);
                    $answer = $requete->execute();
                }
                else{
                    $requete = $this->cnx->prepare("update Cart_products set quantity = quantity + 1 where id_order = :id_order and id_product = :id_product");
                    $requete->bindParam(':id_order', $id_order );
                    $requete->bindParam(':id_product', $id_product);
                    $answer = $requete->execute();
                }
                return true;
            }
            else{
                return false;
            }
        }
        else{
            return false;
        }
    }

    public function delete($entity){
        $id_order = $entity["id_order"];
        $id_product = $entity["id_product"];
        $r = $this->cnx->prepare("select * from Cart_products WHERE id_order = :id_order AND id_product = :id_product");
        $r->bindParam(':id_order', $id_order);
        $r->bindParam(':id_product', $id_product);
        $r->execute();
        $a = $r->fetch(PDO::FETCH_OBJ);
        var_dump($a);
        if($a){
            $count=$a->quantity;

            if($count == 1){
                $request = $this->cnx->prepare("delete from Cart_products where id_order = :id_order and id_product = :id_product");
                $quantity = 1;
                $request->bindParam(':id_order', $id_order );
                $request->bindParam(':id_product', $id_product );
                $answer = $request->execute();
            }
            else{
                $request = $this->cnx->prepare("update Cart_products set quantity = quantity - 1 where id_order = :id_order and id_product = :id_product");
                $request->bindParam(':id_order', $id_order );
                $request->bindParam(':id_product', $id_product);
                $answer = $request->execute();
            }
            return true;
        }
        else{
            return false;
        }
    }

    public function update($entity){
        return false;
    }
}