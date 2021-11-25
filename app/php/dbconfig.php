<?php
use DevCoder\DotEnv;

// require("dotenv.php")
require_once "dotenv.php";
(new DotEnv(__DIR__ . '/../.env'))->load();


$host = getenv('MYSQL_HOST');
$user = getenv('MYSQL_USER');
$pass = getenv('MYSQL_PW');
$db = getenv('MYSQL_DB');
try {
    $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>