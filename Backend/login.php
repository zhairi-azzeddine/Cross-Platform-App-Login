<?php //login.php

require_once "./dbConnection.php";

// Start the session
session_start();

// Login the user
if(isset($_POST['submit'])){

    $email = $_POST['email'];
    $password = $_POST['password'];
    $user = login($email, $password);   
    
    if($user){

        // Store user data in the session
        $_SESSION['user'] = $user;

        // Return the user data as a response
        $username = $_SESSION['user'][0]['USERNAME'];        

        echo json_encode([
            'status' => 'success',
            'type' => 'login',
            'message' => 'Logged in successfully'
        ]);

    }else{
        
        echo json_encode([
            'status' => 'error',
            'type' => 'login',
            'message' => 'Wrong credentials'
        ]);
        
    }
}

// Function to login a user
function login($email, $password)
{
    $pdo = new Database();
    $query = "SELECT * FROM users WHERE email = :email";
    $array = [];
    array_push($array, $email);
    $user = $pdo->execQuery($query, $array);
    
    if($user && password_verify($password, $user[0]['password']) == false){        
        return $user;
    }
    
    return false;
}


