<?php
require_once "Controller.php";
require_once "Repository/ProductRepository.php" ;

class ProductController extends Controller {

    private ProductRepository $products;

    public function __construct(){
        $this->products = new ProductRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        if ($id){
            $p = $this->products->find($id);
            return $p==null ? false :  $p;
        }
        else{
            return $this->products->findAll();
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        return false;
    }
   
}
?>