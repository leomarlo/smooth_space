<?php
$host = "mysql";
$user = "testuser";
$pass = "testpassword";
$db = "testapp";
try {
    $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM some";
    $stmt = $conn->prepare($sql);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
    $stmt->execute();
    $things = $stmt->fetchAll();
    // // echo "Connected successfully";
    // $users = $getUsers->fetchAll();
    foreach ($things as $thing) {
        echo '' . $thing['thing'] . '<br />';
    }
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>