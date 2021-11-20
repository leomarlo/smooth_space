<!doctype html>

<html lang="en">
<head>
  <script type="text/javascript" src="https://twgljs.org/dist/4.x/twgl-full.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="./fonts/AlegreyaFont/stylesheet.css">
  <link rel="stylesheet" href="./fonts/ABeeZee/stylesheet.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="container-fluid">
    <!-- <canvas id="canvasholder" class="canvas_">
    </canvas> -->
      <div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_"></div>
      <div class="col-md-8 col-sm-8 col-xs-8 mainheight_ scrollable_ testdiv_">

<?php
// require("dotenv.php")
require_once "./php/dbconfig.php";
require_once "./php/templates.php";

$allEventsSQL = "SELECT  
ev.eventId, ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.title, ps.subtitle , eS.description as EventStatus, eT.description as EventType
FROM events ev 
LEFT JOIN posts ps ON ev.postId=ps.postId
LEFT JOIN eventType eT ON ev.eventTypId=eT.eventTypeId
LEFT JOIN eventStatus eS ON ev.statusId=eS.statusId
ORDER BY ev.from_date ASC;";

function getParticipantsOfEventSQL ($eventid) {
    return "SELECT tn.Name, tn.Affiliation
        FROM participation pc
        INNER JOIN teilnehmer tn ON pc.nameId=tn.id
        WHERE pc.eventId=" . $eventid . ";";
}

function getParagraphsOfEventSQL ($eventid) {
    return "SELECT 
    prgph.postId, prgph.text, prgph.ordinal
    FROM events ev
    INNER JOIN paragraphs prgph ON ev.postId=prgph.postId
    WHERE ev.eventId=" . $eventid . " 
    ORDER BY prgph.ordinal ASC;";
}

function getImagesOfEventSQL ($eventid) {
    $mediatypeId = 1;
    return "SELECT md.path, md.author, md.alt
    FROM posts ps
    INNER JOIN mediaInPosts mIP ON ps.postId=mIP.postId
    INNER JOIN media md ON md.mediaId=mIP.mediaId
    WHERE ps.postId=" . $eventid . " AND md.mediatypeId=" . $mediatypeId . ";";
}


// fetch all the events
$stmt = $conn->prepare($allEventsSQL);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
$stmt->execute();
$events = $stmt->fetchAll();

for ($i=0; $i<count($events); $i++){

    $thisEventId = $events[$i]["eventId"];
    // get all participants for this event
    $stmt = $conn->prepare(getParticipantsOfEventSQL($thisEventId)); 
    $stmt->execute();
    $participants = $stmt->fetchAll();
    // get all paragraphs for this event
    $stmt = $conn->prepare(getParagraphsOfEventSQL($thisEventId)); 
    $stmt->execute();
    $paragraphs = $stmt->fetchAll();
    // images
    $stmt = $conn->prepare(getImagesOfEventSQL($thisEventId)); 
    $stmt->execute();
    $images = $stmt->fetchAll();
    // card DOM
    $cardDOMid = 'event_card_' . $thisEventId;
    echo getEvent2($cardDOMid, $events[$i], $paragraphs, $images, $participants); 
} 
?>


</div>
<div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_"></div>
</div>
</body>
</html>