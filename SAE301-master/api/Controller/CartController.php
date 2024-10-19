<?php
require_once "Controller.php";
require_once "Repository/CartRepository.php" ;


// This class inherits the jsonResponse method  and the $cnx propertye from the parent class Controller
// Only the process????Request methods need to be (re)defined.

class CartController extends Controller {

    private CartRepository $cart;

    public function __construct(){
        $this->cart = new ProductRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        if ($id){
            // URI is .../products/{id}
            $p = $this->cart->find($id);
            return $p==null ? false :  $p;
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