<!doctype html>

<html lang="en">
<head>
  <script type="text/javascript" src="https://twgljs.org/dist/4.x/twgl-full.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./fonts/AlegreyaFont/stylesheet.css">
  <link rel="stylesheet" href="./fonts/ABeeZee/stylesheet.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">



</head>
<body>
  <div class="container-fluid">
    <canvas id="canvasholder" class="canvas_">
    </canvas>
    <div class="row foreground_ absolute_ mainheight_ totalwidth_">
      <div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_"></div>
      <div class="col-md-8 col-sm-8 col-xs-8 mainheight_ scrollable_ testdiv_">


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
        $stmt = $conn->prepare($allProfilesSQL);  // THANKS TO https://www.geeksforgeeks.org/how-to-fetch-data-from-database-in-php-pdo-using-loop/
        $stmt->execute();
        $profiles = $stmt->fetchAll();

        
        echo '<div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_"></div>';
        echo '<div class="col-md-8 col-sm-8 col-xs-8 mainheight_ scrollable_ testdiv_">';
        
        for ($i=0; $i<count($profiles); $i++){

            $thisMeetingId = $meetings[$i]["meetingId"];
            // get the fluid roles of this profile
            $stmt = $conn->prepare(getProjectRolesSQL($profiles[$i]["nameId"], 1)); 
            $stmt->execute();
            $fluidroles = $stmt->fetchAll();
            // get the project roles of this profile
            $stmt = $conn->prepare(getProjectRolesSQL($profiles[$i]["nameId"], 2)); 
            $stmt->execute();
            $projectroles = $stmt->fetchAll();
            // card DOM
            $cardDOMid = 'profile_card' . $profiles[$i]["nameId"];
            echo getProfile($profiles[$i], $cardDOMid , $fluidroles, $projectroles); 
            echo '<br>';
        } 

        echo '</div>';
        echo '<div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_ scrollable_ ">';
        echo '<div class="quite_long_ testdiv_" id="project_sidenav">';
        
        for ($i=0; $i<count($profiles); $i++){
          echo '<div class="row mt-4">
                  <div class="col-sm-12 col-md-12">
                    <div class="card cardborder_ rounded_card_borders_ gray_ " id="' . $profile["title"] . '_cardlette">
                      <div class="card-body center_">' . $profile["title"] . '</div>
                    </div>
                  </div>
                </div>';
        }
        echo '</div></div>';  
      
      ?>
      

        

        
    </div>
    <div class="row foreground_ bottomnav_ navheight_ totalwidth_ testdiv_">
      <div class="col-md-2 col-sm-2 col-xs-2 navheight_ testdiv_ menu_">
        <span ><a href="index.php"><img src="img/home.svg" alt="home" height="28pt"/> </span>
      </div>
      <div class="col-md-8 col-sm-8 col-xs-8 navheight_ testdiv_ white_ center_">
        <div class="menu_">
          <span > <a href="project.php"> Project   </span>|
          <span > <a href="w/index.php"> Wiki </a> </span>|
          <span > <a href="notations.php"> Notations </a> </span>|
          <span > <a href="meetings.php"> Meetings </a> </span>|
          <span > <a href="events.php"> Events   </span>|
          <span > <a href="team.php"> Team   </span>|
          <span > <a href="partners.php"> Partners   </span>
        </div>
      </div>
      <div class="col-md-2 col-sm-2 col-xs-2 navheight_ testdiv_"></div>
    </div>

            <!--
  <div class="card-text smll_box_ doc_">D</div>
  <div class="card-text smll_box_ choreo_">C</div>
  <div class="card-text smll_box_ rep_">R</div>
  <div class="card-text smll_box_ exp_">E</div> -->


  </div>
  <script type="module">
      import { navigation_adjust } from './js/navigation.js';

      var nav = new navigation_adjust();
      nav.all_cards_scroll_into_view();
  </script>
  <?php include './php/vs_shader.php'; ?>
  <?php include './php/fs_init_shader.php'; ?>
  <?php include './php/fs_frame_shader.php'; ?>
  <?php include './php/fs_render_shader.php'; ?>
  <script type="text/javascript" src="./js/shader.js" ></script>


</body>
</html>
