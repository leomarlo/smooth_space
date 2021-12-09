<?php
    echo '<script id="fs_render" type="x-shader/x-fragment">
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
  </script>'
?>