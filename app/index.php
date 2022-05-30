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
      <div class="col-md-2 col-sm-1 col-xs-1 mainheight_ testdiv_"></div>
      <div class="col-md-8 col-sm-10 col-xs-10 mainheight_ scrollable_ testdiv_">
        <div class="title_ testdiv_">
          ATLAS OF SMOOTH  SPACES<br>IN THE AUDIOCORPOREAL ARTS
        </div>
        <div class="subtitle_ testdiv_">
          AN ARTISTIC RESEARCH PROJECT<span id="symbol_1" ><sup>&#9824;</sup></span> ON<br>
          COMMUNICATING, CREATING AND COMPOSING SPACES<br>
          IN COLLABORATION WITH
        </div>
        <div class="logodiv_ testdiv_">
          <span class="inlineblock testdiv_"><a href="https://www.mdw.ac.at/"><img src="img/mdwLogo.svg" alt="MDW" height="80px" width="120px"/></a></span>
          <span class="inlineblock testdiv_"><a href="https://www.bruckneruni.at/"><img src="img/bruckneruni.svg" alt="BrucknerUni" height="80px" width="120px"/></a></span>
          <span class="inlineblock testdiv_"><a href="https://www.csh.ac.at/"><img src="img/logo_grafik_200x200.png" alt="Complexity Science Hub" height="80px" width="70px"/></a></span>
        </div>
        <div class="acknowlegeFWF">
          <span id="symbol_2"><sup>&#9824;</sup></span>This research was funded in whole by the Austrian Science Fund (FWF). Grant number: <a href="https://www.fwf.ac.at/en/news-and-media-relations/news/detail/nid/20210318-2635">AR640</a>
        </div>
      </div>
      <div class="col-md-2 col-sm-1 col-xs-1 mainheight_ testdiv_"></div>
    </div>
    <div class="row foreground_ bottomnav_ navheight_ totalwidth_ testdiv_">
      <div class="col-md-2 col-sm-1 col-xs-1 navheight_ testdiv_ menu_">
        <span ><a href="index.php"><img src="img/home.svg" alt="home" height="28pt"/></a></span>
      </div>
      <div class="col-md-8 col-sm-10 col-xs-10 navheight_ testdiv_ white_ center_">
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
      <div class="col-md-2 col-sm-1 col-xs-1 navheight_ testdiv_">
          <div class="credit_"> <!--style="position:absolute; text-align:right; bottom:0px;right:0px;">-->
            Animation: Klaus Györgyfavay
          </div>
      </div>
    </div>

  </div>

  <?php include './php/vs_shader.php'; ?>
  <?php include './php/fs_init_shader.php'; ?>
  <?php include './php/fs_frame_shader.php'; ?>
  <?php include './php/fs_render_shader.php'; ?>
  <script type="text/javascript" src="./js/shader.js" ></script>

</body>
<script type="text/javascript">
  console.log('hallo')
  let symbol_1 = document.getElementById("symbol_1")
  let symbol_2 = document.getElementById("symbol_2")
  const symbols = ['&#9824;','&#9837;', '&#8853;', '&#8629;', '&#9829;', '&#9839;'];
  const numberOfSymbols = symbols.length;
  let stateOfSymbol = {state: (numberOfSymbols>1? 1: 0)};
  setInterval(function() {
    let inner = '<sup>' + symbols[stateOfSymbol.state % numberOfSymbols] + '</sub>'
    symbol_1.innerHTML = inner;
    symbol_2.innerHTML = inner;
    stateOfSymbol.state += 1;
  }, 5 * 1000); 
</script>
</html>
