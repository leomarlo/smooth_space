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
    <canvas id="canvasholder" class="canvas_">
    </canvas>
    <div class="row foreground_ absolute_ mainheight_ totalwidth_">
      <div class="col-2 mainheight_ scrollable_"></div>
      <div class="col-8 mainheight_ scrollable_ ">

        

        <?php
          // require("dotenv.php")
          require_once "./php/dbconfig.php";
          // This will load:
          // conn (the database connection object)
          require_once "./php/templates.php";  
          // This will load:
          // get_Event
          require_once "./php/queries.php"; 
          // This will load:
          // getParticipantsOfEventSQL, getParagraphsOfEventSQL, getImagesOfEventSQL, allEventsSQL
          
          // fetch all the events
          $stmt = $conn->prepare($allMeetingsSQL);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
          $stmt->execute();
          $meetings = $stmt->fetchAll();

          for ($i=0; $i<count($meetings); $i++){

              $thisMeetingId = $meetings[$i]["meetingId"];
              // get all participants for this event
              $stmt = $conn->prepare(getParticipantsOfMeetingSQL($thisMeetingId)); 
              $stmt->execute();
              $participants = $stmt->fetchAll();
              // get all paragraphs for this event
              $stmt = $conn->prepare(getParagraphsOfMeetingSQL($thisMeetingId)); 
              $stmt->execute();
              $paragraphs = $stmt->fetchAll();
              // images
              $stmt = $conn->prepare(getImagesOfPostSQL($meetings[$i]["postId"])); 
              $stmt->execute();
              $images = $stmt->fetchAll();
              // card DOM
              $cardDOMid = 'meeting_card_' . $thisEventId;
              echo getMeeting($cardDOMid, $meetings[$i], $paragraphs, $images, $participants); 
              echo '<br>';
          } 
        ?>

      </div>
      <div class="col-2 mainheight_ testdiv_ scrollable_">

        <!-- <div class="quite_long_ testdiv_">

          <div class="row mt-4">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="workshop_csh_january_cardlette">
                <div class="card-header center_"></div>
                <div class="card-body">
                  <h5 class="card-title center_ "> <b>Meetings</b><br></h5>
                </div>
              </div>
            </div>
          </div>

        </div> -->

      </div>
    </div>
    <div class="row foreground_ bottomnav_ navheight_ totalwidth_ testdiv_">
      <div class="col-md-2 col-sm-2 col-xs-2 navheight_ testdiv_ menu_">
        <span ><a href="index.php"><img src="img/home.svg" alt="home" height="28pt"/></a></span>
      </div>
      <div class="col-md-8 col-sm-8 col-xs-8 navheight_ testdiv_ white_ center_">
        <div class="menu_">
          <span > <a href="project.php"> Project </a> </span>|
          <span > <a href="w/index.php"> Wiki </a> </span>|
          <span > <a href="notations.php"> Notations </a> </span>|
          <span > <a href="meetings.php"> Meetings </a> </span>|
          <span > <a href="events.php"> Events </a> </span>|
          <span > <a href="team.php"> Team </a> </span>|
          <span > <a href="partners.php"> Partners </a> </span>
        </div>
      </div>
      <div class="col-md-2 col-sm-2 col-xs-2 navheight_ testdiv_"></div>
    </div>

  </div>
  <script src="./js/readmore.js">console.log('hallo')</script>
  <?php include './php/vs_shader.php'; ?>
  <?php include './php/fs_init_shader.php'; ?>
  <?php include './php/fs_frame_shader.php'; ?>
  <?php include './php/fs_render_shader.php'; ?>
  <script type="text/javascript" src="./js/shader.js" ></script>

</body>
</html>
