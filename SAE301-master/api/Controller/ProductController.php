<?php
require_once "Controller.php";
require_once "Repository/ProductRepository.php" ;


// This class inherits the jsonResponse method  and the $cnx propertye from the parent class Controller
// Only the process????Request methods need to be (re)defined.

class ProductController extends Controller {

    private ProductRepository $products;

    public function __construct(){
        $this->products = new ProductRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        if ($id){
            // URI is .../products/{id}
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
// $category = $request->getType("category");
//         if ($category){
//             // URI is .../products/{category}
//             $c = $this->products->findByCategory($category);
//             return $c==null ? false :  $c;
//         }
?>