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
            $p->setPromo($obj->promo);
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
                return false;
            }
            else{
                return false;
            }
        }
        else{
            return false;
        }
    }

    public function delete($id_order , $id_product){
        $r = $this->cnx->prepare("select * from Cart_products WHERE id_order = :id_order AND id_product = :id_product");
        $r->bindParam(':id_order', $id_order);
        $r->bindParam(':id_product', $id_product);
        $r->execute();
        $a = $r->fetch(PDO::FETCH_OBJ);
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
        return false;
    }

    public function update($product){
        return false;
    }
}