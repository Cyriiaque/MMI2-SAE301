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
        if ($id){
            $p = $this->cart->find($id);
            return $p==null ? false :  $p;
        }
        else{
            $p = $this->cart->findAll();
            return $p==null ? false :  $p;
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        $id = $request->getId();
      
        if($id == "add"){
            $id_order = $request->getParam("id_order");
            $id_product = $request->getParam("id_product");
            $cartadd = [];
            $cartadd["id_order"] = $id_order;
            $cartadd["id_product"] = $id_product;

            $p = $this->cart->save($cartadd);
            return $p==null ? false :  $p;
        }
        if($id == "check"){
            $data = $request->getJson();
            $tableau = urldecode($data);
            $decode = json_decode($tableau, true);
            $id_user = $decode['UserId'];
            $id_order = $decode['orderCount'];

            $checkout = [];
            $checkout["id_order"] = $id_order;
            $checkout["id_user"] = $id_user;

            $p = $this->cart->saveAll($checkout);
            return $p==null ? false :  $p;
        }
        else{
            return false;
        }
    }

    protected function processDeleteRequest(HttpRequest $request){
        $id = $request->getId();
        if($id == "del"){
            parse_str($request->getJson(),$output);
            $id_order = $output["id_order"];
            $id_product = $output["id_product"];
            $cartdelete = [];
            $cartdelete["id_order"] = $id_order;
            $cartdelete["id_product"] = $id_product;

            $p = $this->cart->delete($cartdelete);
            return $p==null ? false :  $p;
        }
        else{
            return false;
        }
    }
}
?>