// --- CJK preamble (zh build) ---
usepackage("xeCJK");
texpreamble("\setCJKmainfont{SimSun}");
size(10cm);
usepackage("amssymb");
pair E = (0,0);
dot("质点 $m$", E, dir(-90), deepcyan);
pair O = (5,3);
real r = 1.4;
filldraw(circle(O, r), lightyellow, orange);
int N = 25;
for (int i=0; i<N; ++i) {
  real theta = 360 / N * i;
  draw((O + 1.7*dir(theta)) -- (O + 1.9*dir(theta)), orange);
}

pair P = O + 0.6*dir(160);
pair Q = O + 0.8*dir(260);

label("质量 $\mathcal{T}$ (例如太阳)", O+2*dir(90), dir(90), orange);
draw("$P$ 施加的引力", E--P, dir(140), grey, EndArrow, Margins);
draw("$Q$ 施加的引力", E--Q, dir(-40), grey, EndArrow, Margins);
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(90));
