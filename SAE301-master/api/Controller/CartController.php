<?php
require_once "Controller.php";
require_once "Repository/CartRepository.php" ;

class CartController extends Controller {

    private CartRepository $cart;

    public function __construct(){
        $this->cart = new CartRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        $id2 = $request->getId2("id2");
        $id3 = $request->getId3("id3");
        if ($id){
            if($id == "add"){
                if($id2){
                    if($id3){
                        $p = $this->cart->save($id2, $id3);
                        return $p==null ? false :  $p;
                    }
                    else{
                        return false;
                    }
                }
                else{
                    return false;
                }
            }
            else{
                $p = $this->cart->find($id);
                return $p==null ? false :  $p;
            }
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        return false;
    }
   
}
?>