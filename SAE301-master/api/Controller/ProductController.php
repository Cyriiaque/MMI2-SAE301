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
        if($id){
            if (strlen($id)<5){
                $p = $this->products->find($id);
                return $p==null ? false :  $p;
            }
            else{
            $tableau=urldecode($id);
            $table = json_decode($tableau);
            $authh = $request->isAuth();

            $entity = [];
            $name = $table->name;
            $color = $table->color;
            $size = isset($table->size) ? $table->size : null;
            $shoesize = isset($table->shoesize) ? $table->shoesize : null;
            array_push($entity, $name, $color, $size, $shoesize);
            $p = $this->products->findbyAttribute($entity);
            return $p==null ? false :  $p;
            }
        }
        
        else{
            return $this->products->findAll();
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        $id = $request->getId();

        if($id=="add"){
            $name=$request->getParam("name");
            $subtitle=$request->getParam("subtitle");
            $description=$request->getParam("description");
            $price=$request->getParam("price");
            $image=$request->getParam("image");
            $type=$request->getParam("type");
            $gender=$request->getParam("gender");
            $color=$request->getParam("color");
            $shoesize=$request->getParam("shoesize");
            $size=$request->getParam("size");
            $stock=$request->getParam("stock");
            $promo=$request->getParam("promo");

            $productdata = [];
            $productdata["name"] = $name;
            $productdata["subtitle"] = $subtitle;
            $productdata["description"] = $description;
            $productdata["price"] = $price;
            $productdata["image"] = $image;
            $productdata["type"] = $type;
            $productdata["gender"] = $gender;
            $productdata["color"] = $color;
            $productdata["shoesize"] = $shoesize;
            $productdata["size"] = $size;
            $productdata["stock"] = $stock;
            $productdata["promo"] = $promo;

            $p = $this->products->save($productdata);
            return $p==null ? false :  $p;
        }
        else{
            return false;
        }
        
    }
}
?>