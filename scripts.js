const colrs = ["ff0000", "00ff00", "0000ff", "000000"],
  dmnsn = [120, 300],
  frctn = 0.0001,
  // glCtx = document.getElementById("canvasholder").getContext("webgl")
  glCtx = (() => twgl.getContext(document.createElement("canvas")))(
    twgl.setDefaults({ attribPrefix: "a_" })
  ),
  htflw = 0.01,
  impls = 0.05,
  ntnst = 0.05,
  repel = 100,
  rmSng = 50,
  scale = 0.01,
  whout = 0.02;
var bfInf = twgl.primitives.createXYQuadBufferInfo(glCtx),
  bffrs = Array(2)
    .fill()
    .map(() => twgl.createFramebufferInfo(glCtx, [{internalFormat: glCtx.RGBA32F}], ...dmnsn)),
  smdgs = Array(4)
    .fill()
    .map((_,k) => ({
      p: [(k+1)*dmnsn[0]/5,dmnsn[1]/2],
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
  window.requestAnimationFrame(frame);
}
function reset() {
  rendr(bffrs[0], pgInf.c2f, {
    u_texture: imgTx
  });
  count = 0;
}
prepr();
frame();
