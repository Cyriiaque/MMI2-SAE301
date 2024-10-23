<?php
require_once "Controller.php";
require_once "Repository/UserRepository.php" ;

class UserController extends Controller {

    private UserRepository $user;

    public function __construct(){
        $this->user = new UserRepository();
    }

   
    protected function processGetRequest(HttpRequest $request) {
        $id = $request->getId("id");
        if ($id){
            $p = $this->user->find($id);
            return $p==null ? false :  $p;
        }
        else{
            return false;
        }
    }

    protected function processPostRequest(HttpRequest $request) {
        $id = $request->getId();
        if($id == "signup"){
            return $this->processSignUpRequest($request);
        }
        if($id == "signin"){
            return $this->processSignInRequest($request);
        }
        if($id == "signout"){
            return $this->processSignOutRequest();
        }
    }

    private function processSignUpRequest(HttpRequest $request){
        $email= $request->getParam("email");
        $password = $request->getParam("password");

        $user = $this->user->find($email);

        if($user != null){
            return false;
        }

        $hash_password = password_hash($password, PASSWORD_DEFAULT);

        $userdata = [];
        $userdata["email"] = $email;
        $userdata["password"] = $hash_password;
        $userdata["last_name"] = $request->getParam("last_name");
        $userdata["first_name"] = $request->getParam("first_name");
        return $this->user->save($userdata);
    }

    protected function processDeleteRequest(HttpRequest $request){
        return false;
    }
}
?>