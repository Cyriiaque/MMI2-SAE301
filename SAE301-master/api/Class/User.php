<?php
class User implements JsonSerializable {
    private int $id_user=0;
    private string $last_name;
    private string $first_name;
    private string $email;
    private string $password;


    public function __construct(array $data){
        $this->id_user = $data["id_user"];
        $this->last_name = $data["last_name"];
        $this->first_name = $data["first_name"];
        $this->email = $data["email"];
        $this->password = $data["password"];
    }

    public function getIdUser(): int
    {
        return $this->id_user;
    }

    public function getLastName(): string
    {
        return $this->last_name;
    }

    public function getFirstName(): string
    {
        return $this->first_name;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getPassword(): string
    {
        return $this->password;
    }


    public function JsonSerialize(): mixed{
        return ["id_user" => $this->id_user, "last_name" => $this->last_name, "first_name" => $this->first_name, "email" => $this->email, "password" => $this->password];
    }


    /**
     *@return  self
     */ 
    public function setIdUser($id_user): self
    {
        $this->id_user = $id_user;
        return $this;
    }

    /**
     *@return  self
     */
    public function setLastName($last_name): self
    {
        $this->last_name = $last_name;
        return $this;
    }

    /**
     *@return  self
     */
    public function setFirstName($first_name): self
    {
        $this->first_name = $first_name;
        return $this;
    }

    /**
     *@return  self
     */
    public function setEmail($email): self
    {
        $this->email = $email;
        return $this;
    }

    /**
     *@return  self
     */
    public function setPassword($password): self
    {
        $this->password = $password;
        return $this;
    }
}