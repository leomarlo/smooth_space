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
  <script id="vs" type="x-shader/x-vertex">
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
