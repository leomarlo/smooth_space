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
      <div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_"></div>
      <div class="col-md-8 col-sm-8 col-xs-8 mainheight_ scrollable_ testdiv_">

        <div class="row mt-2">
          <div class="col-sm-12 col-md-12">
            <div class="card cardborder_ " id="alphabet_encoding_card">
              <div class="card-header center_"><h4 class="padding_">Notation &mdash; A Formal Excursion<br>Alphabet Encoding</h4></div>
              <div class="card-body justify_">
                <h3>Introduction</h3> 
                <p>
                  What is communication? Although covering the general literature about communication theory is beyond the scope of this short paragraph, we 
                  will nevertheless make a short excursion to one of the approaches taken around the middle of the 20th century on this topic. 
                  The seminal paper by Claude Shannon outlines an approach to <it>A formal theory of communication</it> The key ingredients are 
                  senders, encoders, signals, decoders, receivers and noise. We have used Shannons 1948 paper as a starting point to investigate certain 
                  aspects of communication, as it has been abstracted in that theory. </p>
                <h3>The Game</h3>
                <p>
                  As part of a communication game we have split up into two groups, 
                  each of which tries to efficiently communicate some information. In our case we
                  considered the English alphabet as the source of information that ought to be transmitted.
                  So each party had to encode the letters of the alphabet as efficiently as possible. Here we
                  opted for a binary encoding, which is convenient for computer-readible signals. The encoding is 
                  achieved via a binary decision tree, meaning that each group has to construct a series of yes-or-no questions
                  that uniquely single out each letter of the alphabet. 
                </p>
                <br>
                <!-- <form method="get" id="encoding_form"> -->
                <label for="tobeencoded">Enter Text:</label>
                <input type="text" id="tobeencoded_A" name="tobeencoded_A" value="Some example Text">
                <input type="radio" id="groupa-radio" name="encodingradio" value="GroupA"; style="margin-left:15px;" checked>
                <label for="groupa-radio" style="margin-left:5px; margin-right:10px">Group A</label>
                <input type="radio" id="groupb-radio" name="encodingradio" value="GroupB">
                <label for="groupb-radio"  style="margin-left:5px; margin-right:15px">Group B</label>
                <button id="encoding_submit" type="submit" form="encoding_form" class="btn btn-primary" style="margin-left:5px; margin-bottom:10px" value="Encode">Encode</button><br>
                <!-- </form> -->
                
                <p id="EncodingField" style="overflow-wrap: anywhere; padding: 10px; margin: 4px; border-width: 1px; border-style: solid; border-color: coral; border-radius: 5px;">
                  
                </p><br>
                <div style="margin-left:5px;"> Encoding length : <span id="encodingLength"></span></div>
              </div>
            </div>
            <br>
            <br>
            <div class="card cardborder_ " id="dialectic_encoding_card">
              <div class="card-header center_"><h4 class="padding_">Notation &mdash; Dialectic Attempts</h4></div>
              <div class="card-body justify_">
                <h3>Abstract</h3> 
                <p>In the project „Atlas of Smooth Spaces“ we explore how to notate, communicate and compose space phenomena across audio-corporeal artistic practices. In a sub-laboratory named „Dialectic attempts of a eurhythmician and a complexity scientist“ we worked towards a notation of perceptive processes related to a performers multifaceted expressions in her performance space/ sphere in the context of eurhythmics-performance. This we conducted from the performers inside view as well as the outside view of a complexity scientist. The work “Etude d`espace” was an artistic output connected to the concept of „Nullspace”. Following a number of questions the Dalcroze score served as a starting point: what is in the center of a eurhythmicians artistic routine? How do movement and sound meet in space? How does a eurhythmician connect her identities as an instrumentalist and mover and which kind of output is generated by her body archive as mover-instrumentalist? What role does listening play in this? How is space being created through the lense of a musical score?  </p>
                <br>
                <span > <a href="dialectic_description_project.php"> Link to the Notation </a> </span>
                <br>
              </div>
            </div>


          </div>
        </div>


        <!-- <div class="row mt-2" id="project_context_card">
          <div class="col-sm-12 col-md-12">
            <div class="card cardborder_ " id="overview_context_card">
              <div class="card-header center_ "><h4 class="padding_">Overview &mdash; Context</h4></div>
              <div class="card-body justify_">
              </div>
            </div>
          </div>
        </div> -->


      </div>
      <!-- <br> -->
      <div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_ scrollable_">

        <div class="quite_long_ testdiv_" id="project_sidenav">

          <div class="row mt-2">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="overview_synopsis_cardlette">
                <div class="card-header center_"></div>
                <div class="card-body">
                  <h5 class="card-title center_ "><b>Notations</b><br>A Formal Excursion</h5>
                </div>
              </div>
            </div>
          </div>

          <!-- <div class="row mt-2">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="overview_methodology_cardlette">
                <div class="card-header center_"></div>
                <div class="card-body">
                  <h5 class="card-title center_ "><b>Overview</b><br>Methodology</h5>
                </div>
              </div>
            </div>
          </div> -->

          <!-- <div class="row mt-2">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="overview_context_cardlette">
                <div class="card-header center_ "></div>
                <div class="card-body">
                  <h5 class="card-title center_ "><b>Overview</b><br>Context</h5>
                </div>
              </div>
            </div>
          </div> -->

          <!-- <div class="row mt-2">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="labs_organization_cardlette">
                <div class="card-header center_ doc_"></div>
                <div class="card-body">
                  <h5 class="card-title center_ "><b>Smooth Space Labs</b><br>Organization</h5>
                </div>
              </div>
            </div>
          </div> -->

        </div>

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
  <script type="module">
      import { navigation_adjust } from './js/navigation.js';

      var nav = new navigation_adjust();
      nav.all_cards_scroll_into_view();
  </script>
  <script type="text/javascript" src="./js/encoding.js"> </script>
  <script>
    function navigation_adjust() {
      var self=this;
      this.sidenav = document.getElementById("project_sidenav");
      this.cardstr = 'card';
      this.cardelm = this.sidenav.querySelectorAll("."+this.cardstr);
      this.focus_dom = function(event) {
        var current_node = event.target;
        for (domel=0; domel<=100; domel++) {
          var is_some_card_dom = current_node.className.slice(0,self.cardstr.length)==self.cardstr;
          var is_sub_card_dom = current_node.className[self.cardstr.length]=="-";
          if (is_some_card_dom && !is_sub_card_dom) {
            var ref_id = current_node.id.split("lette");
            document.getElementById(ref_id[0]).scrollIntoView()
            break;
          } else {
            current_node = current_node.parentNode;
          }
        }
        return null
      }
      this.add_event_listeners = () => {
        for (ix = 0; ix < this.cardelm.length; ix++) {
          this.cardelm[ix].addEventListener("click", this.focus_dom);
        };
        return null
      }
    };
    var nav = new navigation_adjust();
    nav.add_event_listeners();

  </script>
  <?php include './php/vs_shader.php'; ?>
  <?php include './php/fs_init_shader.php'; ?>
  <?php include './php/fs_frame_shader.php'; ?>
  <?php include './php/fs_render_shader.php'; ?>
  <script type="text/javascript" src="./js/shader.js" ></script>

</body>
</html>
