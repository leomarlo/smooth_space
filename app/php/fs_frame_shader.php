<?php
    echo '<script id="fs_frame" type="x-shader/x-fragment">
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
    </script>'
?>