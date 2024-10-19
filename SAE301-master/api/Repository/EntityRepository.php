<?php

abstract class EntityRepository {
    protected $cnx;

    protected function __construct(){
        $this->cnx = new PDO("mysql:host=localhost;dbname=lemesle8", "root", "");
        // "mysql:host=mmi.unilim.fr;dbname=lemesle8", "lemesle8","lemesle8"
    }

    abstract public function find($id);

    abstract public function findAll();

    abstract public function findType();

    abstract public function save($entity, $entity2);

    abstract public function delete($id);

    abstract public function update($entity);
}