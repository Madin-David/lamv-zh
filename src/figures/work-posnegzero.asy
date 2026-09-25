// --- CJK preamble (zh build) ---
usepackage("xeCJK");
texpreamble("\setCJKmainfont{SimSun}");
size(11cm);

picture base;

import graph;
xaxis(base, "$x$", -0.8, 0.8, grey, Arrows);
yaxis(base, "$y$", -0.7, 0.7, grey, Arrows);
real w = 0.7;

for (int i=0; i<5; ++i) {
  for (int j=0; j<4; ++j) {
    draw(base,
      shift(-0.9*w,-0.6*w)*((0.4*i*w,0.45*j*w)--(0.4*i*w+0.2,0.45*j*w-0.15)),
      rgb(0.6,0.6,0.9), EndArrow(TeXHead));
  }
}

picture poswork, zerowork, negwork;
add(poswork, base);
add(zerowork, base);
add(negwork, base);

dot(poswork, "起点", (-0.6,0.45), dir(90), purple);
dot(poswork, "终点", (0.6,-0.45), dir(-90), purple);
draw(poswork, (-0.6,0.45)--(0.6,-0.45), purple+1.5, EndArrow(8), Margins);
dot(zerowork, "起点", (-0.45,-0.6), dir(-90), purple);
dot(zerowork, "终点", (0.45,0.6), dir(90), purple);
draw(zerowork, (-0.45,-0.6)--(0.45,0.6), purple+1.5, EndArrow(8), Margins);
dot(negwork, "起点", (0.6,-0.45), dir(-90), purple);
dot(negwork, "终点", (-0.6,0.45), dir(90), purple);
draw(negwork, (0.6,-0.45)--(-0.6,0.45), purple+1.5, EndArrow(8), Margins);
label(poswork, "正功", (0,-1));
label(zerowork, "零功", (0,-1));
label(negwork, "负功", (0,-1));

add(shift(0,0)*poswork);
add(shift(2,0)*negwork);
add(shift(4,0)*zerowork);
