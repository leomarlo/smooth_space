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
    <!-- <canvas id="canvasholder" class="canvas_">
    </canvas> -->
    <div class="row foreground_ heading_ headingheight totalwidth_ testdiv_">
      <div class="col-md-1 col-sm-1 col-xs-1 navheight_ testdiv_"></div>
      <div class="col-md-10 col-sm-10 col-xs-10 navheight_ testdiv_ white_ center_ padded_">
      </div>
      <div class="col-md-1 col-sm-1 col-xs-1 navheight_ testdiv_"></div>
    </div>
    <div class="row foreground_ display_ displayheight_ totalwidth_">
      <div class="col-md-1 col-sm-1 col-xs-1 displayheight_ testdiv_"></div>
      <div class="col-md-10 col-sm-10 col-xs-10 displayheight_ scrollable_ testdiv_ white_">

        <div class="row mt-4">
          <!-- <div class="card-deck"> -->
            <div class="col-sm-3 col-md-3">
              <div class="card rounded_card_borders_ cardborder_ padding_">
                <img class="card-img-top rounded_img_borders_ img_height_" src="img/mdwLogo.svg" alt="MDW"/>
                <div class="card-body">
                  <h5 class="card-title center_ "><a href="https://www.mdw.ac.at/" class="stretched-link">Universität für Musik und Darstellende Kunst Wien</a></h5>
                  <!-- <img src="img/Portrait Hanne Pilgrim.jpg" alt="Card image" style="width:100%"> -->
                  <div class="card-text center_">
                  </div>
                </div>
              </div>
            </div>

            <div class="col-sm-3 col-md-3">
              <div class="card rounded_card_borders_ cardborder_ padding_">
                <img class="card-img-top rounded_img_borders_ img_height_" src="img/bruckneruni.svg" alt="ABPU"/>
                <div class="card-body">
                  <h5 class="card-title center_"><a href="https://www.bruckneruni.at/" class="stretched-link">Anton Bruckner Privat Universität</a></h5>
                  <!-- <img src="img/Portrait Hanne Pilgrim.jpg" alt="Card image" style="width:100%"> -->
                  <div class="card-text center_">
                  </div>
                </div>
              </div>
            </div>

            <div class="col-sm-3 col-md-3">
              <div class="card rounded_card_borders_ cardborder_ padding_">
                <img class="card-img-top rounded_img_borders_ img_height_" src="img/HumboldtForum.svg"  alt="HF"/>
                <div class="card-body">
                  <h5 class="card-title center_"><a href="https://www.humboldtforum.org/" class="stretched-link">Humboldt Forum Berlin</a></h5>
                  <!-- <img src="img/Portrait Hanne Pilgrim.jpg" alt="Card image" style="width:100%"> -->
                  <div class="card-text center_">
                  </div>
                </div>
              </div>
            </div>

            <div class="col-sm-3 col-md-3">
              <div class="card rounded_card_borders_ cardborder_ padding_">
                <img class="card-img-top rounded_img_borders_ img_height_" src="img/logo_grafik_200x200.png" alt="CSH"/>
                <div class="card-body">
                  <h5 class="card-title center_"><a href="https://www.csh.ac.at/" class="stretched-link">Complexity Science Hub Vienna</a></h5>
                  <!-- <img src="img/Portrait Hanne Pilgrim.jpg" alt="Card image" style="width:100%"> -->
                  <div class="card-text center_">
                  </div>
                </div>
              </div>
            </div>

        </div>
        <!-- </div> -->




      </div>
      <div class="col-md-1 col-sm-1 col-xs-1 displayheight_ testdiv_"></div>
    </div>
    <div class="row foreground_ bottomnav_ navheight_ totalwidth_ testdiv_">
      <div class="col-md-2 col-sm-1 col-xs-1 navheight_ testdiv_ menu_">
        <span ><a href="index.php"><img src="img/home.svg" alt="home" height="28pt"/></a></span>
      </div>
      <div class="col-md-8 col-sm-10 col-xs-10 navheight_ testdiv_ white_ center_">
        <div class="menu_">
          <span > <a href="project.php"> Project </a> </span>|
          <span > <a href="notations.php"> Notations </a> </span>|
          <span > <a href="events.php"> Events </a> </span>|
          <span > <a href="team.php"> Team </a> </span>|
          <span > <a href="partners.php"> Partners </a> </span>
        </div>
      </div>
      <div class="col-md-2 col-sm-1 col-xs-1 navheight_ testdiv_"></div>
    </div>

  </div>
  <?php include './php/vs_shader.php'; ?>
  <?php include './php/fs_init_shader.php'; ?>
  <?php include './php/fs_frame_shader.php'; ?>
  <?php include './php/fs_render_shader.php'; ?>
  <script type="text/javascript" src="./js/shader.js" ></script>

</body>
</html>
