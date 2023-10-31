<?php

require_once "./dbConnection.php";

if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    

    $query = "SELECT * FROM users WHERE username = '$username'";
    $pdo = new Database();
    $requete = $pdo->execQuery($query);
    if($requete == 1){
        echo "Username already exists";
    }
    else
    {
        echo "Username unavaible"
    }
}