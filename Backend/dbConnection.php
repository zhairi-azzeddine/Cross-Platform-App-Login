<?php //Db Connection 

class Database
{
    private $host = "localhost";
    private $port = "3306";
    private $data = "users";
    private $user = "root";
    private $pass = "";
    private $chrs = "utf8mb4";
    private $opts =
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];

    private $pdo;

    public function __construct()
    {
        try {
            $this->pdo = new PDO("mysql:host=$this->host;port=$this->port;dbname=$this->data;charset=$this->chrs", $this->user, $this->pass, $this->opts);
            // echo json_encode([
            //     'status' => 'success',
            //     'type' => 'connection',
            //     'message' => 'Connection Established'
            // ]);
        } catch (Exception $ex) {
            print "Erro!: " . $ex->getMessage() . "<br>";
            echo json_encode([
                'status' => 'error',
                'type' => 'connection',
                'message' => 'Erro!: '.$ex->getMessage()
            ]);
            die();
        }
    }

    public final function execQuery($q, $array = [])
    {
        try {
            $query = $this->pdo->prepare($q);
            $query->execute($array);
            // echo json_encode([
            //     'status' => 'success',
            //     'type' => 'query',
            //     'message' => 'Query Executed'
            // ]);
            return $result = $query->fetchAll();
            // print_r($result);
        } catch (Exception $ex) {
            echo json_encode([
                'status' => 'error',
                'type' => 'query',
                'message' => 'Erro!: '.$ex->getMessage()
            ]);
            die();
        }
    }

}