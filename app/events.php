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

        

        <?php
          // require("dotenv.php")
          require_once "./php/dbconfig.php";
          require_once "./php/templates.php";

          $allEventsSQL = "SELECT  
          ev.eventId, ev.name, ev.host, ev.email, ev.from_date, ev.until_date, ev.wo, ev.beginn, ev.virtuell, ps.title, ps.subtitle , eS.description as EventStatus, eT.description as EventType
          FROM events ev 
          LEFT JOIN posts ps ON ev.postId=ps.postId
          LEFT JOIN gatherings gth ON ev.gatheringId=gth.gatheringId
          LEFT JOIN eventType eT ON gth.eventTypeId=eT.eventTypeId
          LEFT JOIN eventStatus eS ON ev.statusId=eS.statusId
          ORDER BY ev.from_date ASC;";

          function getParticipantsOfEventSQL ($eventid) {
              return "SELECT tn.Name, tn.Affiliation
              FROM events ev
              INNER JOIN gatherings gth ON gth.gatheringId=ev.gatheringId
              INNER JOIN participation pc on gth.gatheringId=pc.gatheringId
              INNER JOIN teilnehmer tn on pc.nameId=tn.id
              WHERE ev.eventId=" . $eventid . ";";
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
              echo getEvent($cardDOMid, $events[$i], $paragraphs, $images, $participants); 
              echo '<br>';
          } 
        ?>







      </div>
      <div class="col-md-2 col-sm-2 col-xs-2 mainheight_ testdiv_ scrollable_">

        <div class="quite_long_ testdiv_">

          <div class="row mt-4">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="workshop_csh_january_cardlette">
                <div class="card-header center_">17.-18. June 2021</div>
                <div class="card-body">
                  <h5 class="card-title center_ "> <b>Workshop</b><br>A Syntax for Smooth Spaces</h5>
                </div>
              </div>
            </div>
          </div>

          <div class="row mt-4">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="ignition_lab_september_cardlette">
                <div class="card-header center_">1.-4. September 2021</div>
                <div class="card-body">
                  <h5 class="card-title center_ "> <b>Workshop</b><br>Ignition Lab</h5>
                </div>
              </div>
            </div>
          </div>


          <div class="row mt-4">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="guenther_zimmermann_cardlette">
                <div class="card-header center_">11. November 2021</div>
                <div class="card-body">
                  <h5 class="card-title center_ "> <b>Performance</b><br>Günther-Zimmermann in Wels</h5>
                </div>
              </div>
            </div>
          </div>


          <div class="row mt-4">
            <div class="col-sm-12 col-md-12">
              <div class="card cardborder_ " id="guenther_zimmermann_2_cardlette">
                <div class="card-header center_">12. November 2021</div>
                <div class="card-body">
                  <h5 class="card-title center_ "> <b>Performance</b><br>Günther-Zimmermann in Linz</h5>
                </div>
              </div>
            </div>
          </div>




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
          <span > <a href="notations.php"> Notations </a> </span>|
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
  <script id="vs" type="x-shader/x-vertex" src="xvtx_vs.js">
    attribute vec4 a_position;
    attribute vec2 a_texcoord;

    varying vec2 v_texcoord;

    void main() {
      v_texcoord = a_texcoord;
      gl_Position = a_position;
    }
  </script>
  <script id="fs_init" type="x-shader/x-fragment">
    precision highp float;

    void main() {
      gl_FragColor= vec4(0.0);
    }
  </script>
  <script id="fs_frame" type="x-shader/x-fragment">
    precision highp float;

    varying vec2 v_texcoord;

    uniform float u_heatflow;
    uniform float u_intensity;
    uniform vec2 u_resolution;
    uniform float u_scale;
    uniform vec2 u_smudgepos[4];
    uniform vec2 u_smudgevel[4];
    uniform sampler2D u_texture;
    uniform float u_whiteout;

    float softlim(float v) {
      float l = abs(v);
      // if (v < 1e-4) {
      //   return 0.0;
      // }
      return v * (sqrt(4.0 * l * l + 1.0) - 1.0) / (2.0 * l * l);
    }

    vec4 safeadd(vec4 v, vec4 w) {
      float dfp = (1.0 - v.r - v.g - v.b - v.a);
      if (dfp < 1e-4) {
        return v;
      }
      float os = (w.r + w.g + w.b + w.a) / dfp;
      if (os < 1e-4) {
        return v + w;
      }
      // return  v + w;
      // for(int i = 0; i < 4; i++) {
      //   float tmp = 0.0 < w[i] ? 1.0 - v[i] : 0.0;
      //   if (tmp < 1e-4) {
      //     return v;
      //   }
      //   os = max(os, abs(w[i]) / tmp);
      // }
      w *= softlim(os) / os;
      return v + w;
      return max(vec4(0.0), min(vec4(1.0), v + w));
    }

    float sqlength(vec2 v) {
      return v.x * v.x + v.y * v.y;
    }

    void main() {
      vec4 fetch, tmp;
      // nbs[0] = texture2D(u_texture, v_texcoord + vec2(-1.0, 0.0) / u_resolution);
      // nbs[1] = texture2D(u_texture, v_texcoord + vec2(0.0, -1.0) / u_resolution);
      fetch = texture2D(u_texture, v_texcoord);
      // nbs[3] = texture2D(u_texture, v_texcoord + vec2(0.0, 1.0) / u_resolution);
      // nbs[4] = texture2D(u_texture, v_texcoord + vec2(1.0, 0.0) / u_resolution);
      // tmp = u_heatflow * (nbs[0] + nbs[1] + nbs[3] + nbs[4] - 4.0 * nbs[2]);
      for (int i = 0; i < 4; i++) {
        tmp[i] += u_intensity *
          exp(-sqlength(length(u_smudgevel[i]) * (v_texcoord * u_resolution - u_smudgepos[i]) / (0.1 + u_scale)));
      }
        gl_FragColor = safeadd((1.0 - u_whiteout) * fetch, tmp);
    }
  </script>
  <script id="fs_render" type="x-shader/x-fragment">
    precision highp float;

    varying vec2 v_texcoord;

    uniform vec3 u_colors[4];
    uniform sampler2D u_texture;

    float sq(float v) {
      return v * v;
    }

    void main() {
      vec4 fetch = texture2D(u_texture, v_texcoord);
      // float maxval = max(fetch[0], max(fetch[1], max(fetch[2], fetch[3])));
      // float secmaxval = 0.0;
      // bool flag = false;
      // for(int i = 0; i < 4; i++) {
      //   if(fetch[i] < maxval) {
      //     secmaxval = max(secmaxval, fetch[i]);
      //   } else if (flag) {
      //     secmaxval = maxval;
      //     break;
      //   } else {
      //     flag = true;
      //   }
      // }
      // fetch = max(vec4(0.0), min(vec4(1.0), fetch - secmaxval));
      gl_FragColor = vec4(
        1.0 -
        sq(fetch[0]) * (1.0 - u_colors[0]) -
        sq(fetch[1]) * (1.0 - u_colors[1]) -
        sq(fetch[2]) * (1.0 - u_colors[2]) -
        sq(fetch[3]) * (1.0 - u_colors[3]),
        1.0
      );
    }
  </script>
  <script type="text/javascript">
  const colrs = ["dd04a0", "a0aa04", "440aaa", "aa0000"],
    canvasdoc = document.getElementById("canvasholder"),
    containerdoc = document.getElementsByClassName("container-fluid"),
    dmnsn = [canvasdoc.offsetWidth, canvasdoc.offsetHeight],
    glCtx = (() => twgl.getContext(canvasdoc))(
      twgl.setDefaults({ attribPrefix: "a_" })
    ),
    frctn = 0.0001,
    htflw = 0.01,
    impls = 0.5, //0.5
    ntnst = 0.05,
    repel = 100,  //100
    rmSng = 50,  // 50
    scale = 500,
    whout = 0.01;
  var bfInf = twgl.primitives.createXYQuadBufferInfo(glCtx),
    bffrs = Array(2)
      .fill()
      .map(() =>
        twgl.createFramebufferInfo(
          glCtx,
          [{ internalFormat: glCtx.RGBA32F }],
          ...dmnsn
        )
      ),
    smdgs = Array(4)
      .fill()
      .map((_, k) => ({
        p: [((k + 1) * dmnsn[0]) / 5, dmnsn[1] / 2],
        v: [0, 0]
      })),
    pgInf = {
      init: twgl.createProgramInfo(glCtx, ["vs", "fs_init"]),
      frame: twgl.createProgramInfo(glCtx, ["vs", "fs_frame"]),
      render: twgl.createProgramInfo(glCtx, ["vs", "fs_render"])
    };
  function stNml() {
    let v = 0,
      w = 0;
    while (v === 0) {
      v = Math.random();
    }
    while (w === 0) {
      w = Math.random();
    }
    return Math.sqrt(-2.0 * Math.log(v)) * Math.cos(2.0 * Math.PI * w);
  }
  function rendr(fbi, pi, u) {
    twgl.bindFramebufferInfo(glCtx, fbi);
    twgl.drawObjectList(glCtx, [
      {
        programInfo: pi,
        bufferInfo: bfInf,
        uniforms: u
      }
    ]);
  }
  function prepr() {
    glCtx.canvas.width = dmnsn[0];
    glCtx.canvas.height = dmnsn[1];
    document.body.append(glCtx.canvas);
    rendr(bffrs[0], pgInf.init, {});
  }
  function frame() {
    for (let s of smdgs) {
      for (let a of [0, 1]) {
        s.v[a] *= 1 - frctn;
        s.v[a] += impls * stNml();
        s.v[a] += repel / (rmSng + s.p[a] ** 2);
        s.v[a] -= repel / (rmSng + (dmnsn[a] - s.p[a]) ** 2);
        for (let t of smdgs) {
          if (s != t) {
            s.v[a] +=
              (repel * Math.sign(s.p[a] - t.p[a])) /
              (rmSng + (t.p[a] - s.p[a]) ** 2);
          }
        }
      }
    }
    for (let s of smdgs) {
      for (let a of [0, 1]) {
        s.p[a] = Math.max(0, Math.min(dmnsn[a], s.p[a] + s.v[a]));
      }
    }
    rendr(bffrs[1], pgInf.frame, {
      u_heatflow: htflw,
      u_intensity: ntnst,
      u_resolution: dmnsn,
      u_scale: scale,
      u_smudgepos: smdgs.map((s) => s.p).flat(),
      u_smudgevel: smdgs.map((s) => s.v).flat(),
      u_texture: bffrs[0].attachments[0],
      u_whiteout: whout
    });
    rendr(null, pgInf.render, {
      // u_colors: [1,0,0,0,1,0,0,0,1,0,0,0],
      u_colors: ((s) =>
        Array(12)
          .fill()
          .map((_, k) => parseInt(s.slice(2 * k, 2 * (k + 1)), 16) / 255))(
        "".concat(...colrs)
      ),
      u_texture: bffrs[1].attachments[0]
    });
    bffrs = [bffrs[1], bffrs[0]];
    // window.requestAnimationFrame(frame);
    window.setTimeout(frame, 80);
  }
  function reset() {
    rendr(bffrs[0], pgInf.c2f, {
      u_texture: imgTx
    });
    count = 0;
  }
  prepr();
  frame();
  // window.setTimeout(frame, 800);

  </script>

</body>
</html>
