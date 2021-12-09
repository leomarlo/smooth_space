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
