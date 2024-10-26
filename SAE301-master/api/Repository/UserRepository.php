<?php

require_once("Repository/EntityRepository.php");
require_once("Class/User.php");

class UserRepository extends EntityRepository {

    public function __construct(){
        parent::__construct();
    }

    public function find($email){
        $requete = $this->cnx->prepare("select * from Users where email=:value");
        $requete->bindParam(':value', $email);
        $requete->execute();

        $answer = $requete->fetch(PDO::FETCH_OBJ);
        if ($answer==false){
            return null;
        }
        else{
            $p = new User((array)$answer);
            $p->setIdUser($answer->id_user);
            $p->setEmail($answer->email);
            $p->setPassword($answer->password);
            $p->setLastName($answer->last_name);
            $p->setFirstName($answer->first_name);
            return $p;
        }
    }

    public function findAll(){
        return false;
    }

    public function findType(){
        return false;
    }

    public function findbyAttribute($entity){
        return false;
    }

    public function saveAll($entity){
        return false;
    }

    public function save($users){
        $req = $this->cnx->prepare("insert into Users (last_name,first_name,email,password) values (:last_name, :first_name, :email, :password)");
        $email=$users->getEmail();
        $password=$users->getPassword();
        $last_name=$users->getLastName();
        $first_name=$users->getFirstName();
        $req->bindParam(':email', $email);
        $req->bindParam(':password', $password);
        $req->bindParam(':last_name', $last_name);
        $req->bindParam(':first_name', $first_name);
        $ans = $req->execute();

        if ($ans){
            $id = $this->cnx->lastInsertId();
            $users->setIdUser($id);
            return true;
        }
        else{
            return false;
        }
    }

    public function delete($entity){
        return false;
    }

    public function update($entity){
        return false;
    }
}