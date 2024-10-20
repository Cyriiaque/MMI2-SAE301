<?php
require_once "Controller.php";
require_once "Repository/CategoryRepository.php" ;

class CategoryController extends Controller {

    private CategoryRepository $category;

    public function __construct(){
        $this->category = new CategoryRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        if ($id){
            $p = $this->category->find($id);
            return $p==null ? false :  $p;
        }
        else{
            return $this->category->findType();
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        return false;
    }
   
}
?>