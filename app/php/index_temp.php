<?php
use DevCoder\DotEnv;

// require("dotenv.php")
require_once "./dotenv.php";

(new DotEnv(__DIR__ . '/.env'))->load();

// echo __DIR__ . '<br/>';

$host = getenv('MYSQL_HOST');
$user = getenv('MYSQL_USER');
$pass = getenv('MYSQL_PW');
$db = getenv('MYSQL_DB');
try {
    $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM teilnehmer";
    $stmt = $conn->prepare($sql);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
    $stmt->execute();
    $things = $stmt->fetchAll();
    // // echo "Connected successfully";
    // $users = $getUsers->fetchAll();
    foreach ($things as $thing) {
        echo 'Name: ' . $thing['Name'] . '<br />Affiliation: ' . $thing['Affiliation']  . '<br /><br />' ; 
    }
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
    
?>
