// --- CJK preamble (zh build) ---
usepackage("xeCJK");
texpreamble("\setCJKmainfont{SimSun}");
size(6cm);
pair O = (0,0);
pair v = (3,0);
pair w = (1.3,0.7);
fill(O--v--(v+w)--w--cycle, palegreen);
label("面积 $A$", (v+w)/2, deepgreen);
draw(O--v, blue, EndArrow, BeginMargin);
draw(O--w, blue, EndArrow, BeginMargin);
label("$\mathbf{v}$", v, dir(v), blue);
label("$\mathbf{w}$", w, dir(w), blue);
pair vxw = (0,4);
draw(O--vxw, red, EndArrow, BeginMargin);
label("$\mathbf{v} \times \mathbf{w}$", vxw, dir(90), red);
label("长度 $|\mathbf{v} \times \mathbf{w}| = A$", vxw/2, dir(0), red);
dot("$\mathbf{0}$", O, dir(225));
