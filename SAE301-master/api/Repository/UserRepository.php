<?php

require_once("Repository/EntityRepository.php");
require_once("Class/User.php");

class UserRepository extends EntityRepository {

    public function __construct(){
        parent::__construct();
    }

    public function find($email): array{
        $requete = $this->cnx->prepare("select * from Users where email=:value");
        $requete->bindParam(':value', $email);
        $requete->execute();

        $answer = $requete->fetch(PDO::FETCH_OBJ);

        $p = new User((array)$answer);
        $p->setIdUser($answer->id_user);
        $p->setLastName($answer->last_name);
        $p->setFirstName($answer->first_name);
        $p->setEmail($answer->email);
        $p->setPassword($answer->password);
        return $p;
    }

    public function findAll(){
        return false;
    }

    public function findType(){
        return false;
    }

    public function save($entity){
        $email=$entity["email"];
        $password=$entity["password"];
        $last_name=$entity["last_name"];
        $first_name=$entity["first_name"];
        $req = $this->cnx->prepare("insert into Products (last_name,first_name,email,password) values (:last_name, :first_name, :email, :password)");
        $req->bindParam(':last_name', $last_name);
        $req->bindParam(':first_name', $first_name);
        $req->bindParam(':email', $email);
        $req->bindParam(':password', $password);
        $req->execute();
        $ans = $req->fetch(PDO::FETCH_OBJ);
        return false;
    }

    public function delete($entity){
        return false;
    }

    public function update($entity){
        return false;
    }
}