<?php
// require("dotenv.php")
require_once "./php/dbconfig.php";
require_once "./php/templates.php";

$allEventParagraphs = "SELECT 
    prgph.postId, prgph.text, ps.title, ps.subtitle, prgph.ordinal 
    FROM paragraphs prgph 
    LEFT JOIN posts ps ON prgph.postId=ps.postId;";

$allEventsSQL = "SELECT  
ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.title, ps.subtitle , eS.description as EventStatus, eT.description as EventType
FROM events ev 
LEFT JOIN posts ps ON ev.postId=ps.postId
LEFT JOIN eventType eT ON ev.eventTypId=eT.eventTypeId
LEFT JOIN eventStatus eS ON ev.statusId=eS.statusId;";


$stmt = $conn->prepare($allEventsSQL);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
$stmt->execute();
$events = $stmt->fetchAll();
$stmt = $conn->prepare($allEventParagraphs);
$stmt->execute();
$paragraphs = $stmt->fetchAll();
// // echo "Connected successfully";
// $users = $getUsers->fetchAll();

foreach ($events as $event) {
    echo getCard($event['name'], $event['EventType'], $event['EventStatus']);
}
echo '';

// try {
//     // $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
//     // $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//     $sql = "SELECT * FROM teilnehmer";
//     $stmt = $conn->prepare($sql);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
//     $stmt->execute();
//     $things = $stmt->fetchAll();
//     // // echo "Connected successfully";
//     // $users = $getUsers->fetchAll();
//     echo '<ul>';
//     foreach ($things as $thing) {
//         echo '<li>Name: ' . $thing['Name'] . ', Affiliation: ' . $thing['Affiliation'] ; 
//     }
//     echo '</ul>';
// } catch(PDOException $e) {
//     echo "Connection failed: " . $e->getMessage();
// }
    
?>
