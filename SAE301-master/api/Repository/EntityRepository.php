<?php

abstract class EntityRepository {
    protected $cnx;

    protected function __construct(){
        $this->cnx = new PDO("mysql:host=mmi.unilim.fr;dbname=lemesle8", "lemesle8","lemesle8");
        // "mysql:host=mmi.unilim.fr;dbname=lemesle8", "lemesle8","lemesle8"
        // "mysql:host=mmi.unilim.fr;dbname=lajudie6", "lajudie6","lajudie6"
    }

    abstract public function find($id);

    abstract public function findAll();

    abstract public function findType();

    abstract public function findbyAttribute($entity);

    abstract public function save($entity);

    abstract public function delete($entity);

    abstract public function update($entity);
}