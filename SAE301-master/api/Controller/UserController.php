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
            return $this->processSignOutRequest($request);
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
        $userdata["id_user"] = 0;
        $userdata["email"] = $email;
        $userdata["password"] = $hash_password;
        $userdata["last_name"] = $request->getParam("last_name");
        $userdata["first_name"] = $request->getParam("first_name");
        $user = new User($userdata);
        return $this->user->save($user);
    }

    private function processSignInRequest(HttpRequest $request){
        $email= $request->getParam("email");
        $password = $request->getParam("password");

        $user = $this->user->find($email);

        if($user == null){
            return false;
        }
        

        if(password_verify($password, $user->getPassword())){
            session_regenerate_id();
            $_SESSION["user"] = $user;
            return $user;
        }
        else{
            return false;
        }
    }

    private function processSignOutRequest(HttpRequest $request){
        $_SESSION = [];
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }
        session_destroy();
        return true;
    }

    protected function processDeleteRequest(HttpRequest $request){
        return false;
    }
}
?>