<?php

require_once "./dbConnection.php";

if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $user = register($username, $email, $password);
    
    if($user){
        session_start();
        $_SESSION['user'] = $user;
        
        echo json_encode([
            'status' => 'success',
            'type' => 'register',
            'message' => 'Registered successfully',
        ]);

    }else{
        
        echo json_encode([
            'status' => 'error',
            'type' => 'register',
            'message' => 'Wrong credentials',
        ]);

    }
}

function register($username, $email, $password)
{
    $pdo = new Database();
    $query = "INSERT INTO users VALUE(null, :username, :password, :email)";
    $array = [];
    array_push($array, $username);
    array_push($array, $password);
    array_push($array, $email);
    $user = $pdo->execQuery($query, $array);
    if($user == null){
        $query = "SELECT * FROM users WHERE email = :email";
        $array  = [];
        array_push($array, $email);
        $user = $pdo->execQuery($query, $array);
        return $user;
    }
    
    return false;
}