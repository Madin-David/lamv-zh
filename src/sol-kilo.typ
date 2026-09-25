#import "@local/evan-zh:1.0.0":*

= Kilo 部解答 <ch-sol-kilo>

目前我们这里只有 "模拟半期末" 的解答。
（如果你想为余下的题目提交一个 pull request，非常欢迎。）

== @exer-mf-1 的解答（立方根）

#recall-thm(<exer-mf-1>)

我们只需像 @sec-recipe-complex-nth-root 那样求出 $z^3 = -1000 i$
的全部解，然后找出相关的那个。
写成极坐标形式，
$ z^3 = - 1000 i = 1000 dot (cos 270 degree + i sin 270 degree). $
按标准方法取立方根：
模应当为 $root(3, 1000) = 10$，
而辐角应当从 $(270 degree) / 3 = 90 degree$ 开始，
并且彼此相差 $120 degree$。
也就是说，三个立方根应当是
$ z_1 &= 10 (cos 90 degree + i sin 90 degree) \
  z_2 &= 10 (cos 210 degree + i sin 210 degree) \
  z_3 &= 10 (cos 330 degree + i sin 330 degree). $

在这三个答案中，我们要的是
实部和虚部都为负的那个。
只有 $z_2$ 符合；它的直角坐标形式为
$ z_2 = 10 (- sqrt(3) / 2 - i 1 / 2) = #boxed[$ - 5sqrt(3) - 5 i $] $
（而这是唯一可能的例子）。

== @exer-mf-2 的解答（两个特征值之一）

#recall-thm(<exer-mf-2>)

#h3[硬算解法]

已知 $2$ 是 $M$ 的一个特征值，
我们应当有 $det (M - 2 I) = 0$。
写出
$ 0 = det(M - 2 I) = detmat(1 - 2, 1; a, 6 - 2) = detmat(- 1, 1; a, 4)
  = -4 - a ==> #boxed[$ a=  -4 $]. $

现在我们再回到特征多项式。
特征值是那些满足下式的 $lambda$
$ 0 = detmat(1 - lambda, 1; -4, 6 - lambda)
  = (1 - lambda)(6 - lambda) + 4 = lambda^2 - 7 lambda + 10. $
我们知道 $lambda = 2$ 是这个二次方程的一个根；
另一个根是 $#boxed[$ lambda = 5 $]$。

为求特征向量，设 $vec(x,y)$，于是我们需要
$ M vec(x,y) = 5vec(x,y) ==>
  cases((1-5)x + y = 0, -4x+(6-5)y=0) ==> y=4x. $
所以对应于 $5$ 的一个特征向量是 $#boxed[$ vec(1,4) $]$（或它的任意非零倍数）。

#h3[利用迹与行列式捷径的解法]

设 $lambda_2$ 为另一个特征值。
如果你恰好记得迹是特征值之和，
而行列式是特征值之积（@sec-trace-det），
那么这道题可以做得更快：

$ lambda_2 + 2 = op("迹") M &= 1 + 6 \
  lambda_2 dot 2 = det M &= detmat(1, 1; a, 6) = 6 - a. $
第一个方程推出 $lambda_2 = 5$；然后第二个方程推出 $a = -4$。
特征向量随后用与第一种解法相同的方式求出。

== @exer-mf-3 的解答（平面）

#recall-thm(<exer-mf-3>)

我们首先确定过 $P_1 = (b,0,0)$、$P_2 = (0,b,0)$
和 $P_3 = (0,0,b)$ 的平面方程。
你也许一眼就能猜出这个方程，
但如果你没看出来，也可以用叉积
$ (P_2 - P_1) times (P_3 - P_1)
  &= vec(-b,b,0) times vec(-b,0,b)
  = vec(b^2, b^2, b^2) = b^2 vec(1,1,1). $
因此，$vec(1,1,1)$ 是该平面的一个法向量，
所以平面方程应当是 $x+y+z = "const"$。
该平面应当过 $(b,0,0)$ 等点；因此平面方程为
$ x + y + z = b. $

为了使它也过 $(2,3,6)$，
我们需要 $b = 2 + 3 + 6 = #boxed[$ 11 $]$。

接下来要计算从 $(1,2,3)$ 到平面 $x+y+z=11$ 的距离。
如果你为此使用点到平面公式（@sec-distance-plane），你会得到
$ abs(1+2+3-11) / (sqrt(1^2+1^2+1^2)) = #boxed[$ 5/sqrt(3) $]. $

如果你不记得这个公式，你应当改为
计算向量 $bf(v) = (1,2,3) - (2,3,6) = chevron.l -1,-1,-3 chevron.r$
沿 $bf(n) = chevron.l 1,1,1 chevron.r$ 方向投影的长度
（你可以把 $(2,3,6)$ 换成平面上任何其他点，
比如 $(0,0,11)$ 之类）。
手算可得
$ (bf(v) dot bf(n)) / (|bf(n)|)
  = (chevron.l -1,-1,-3 chevron.r dot chevron.l 1,1,1 chevron.r) / sqrt(3)
  = -5 / sqrt(3) $
与之前一样，不过正如我之前说过的，
我们其实只是在重复点到平面公式的证明。

== @exer-mf-4 的解答（经过临界点的等值线）

#recall-thm(<exer-mf-4>)

设 $f(x,y) = cos(x) + sin(y)$。
梯度为
$ nabla f = chevron.l -sin(x), cos(y) chevron.r. $
因此，凡是满足 $sin(x) = cos(y) = 0$ 的点都是临界点。
（这些就是满足 $cos(x) = pm 1$ 且 $sin(y) = pm 1$ 的点。）

#h3[鞍点]

为找出一个鞍点，我们计算二阶导数：
$ f_(x x) &= -cos(x) \
  f_(x y) &= 0 \
  f_(y y) &= -sin(y). $
只需选取任意一个使 $f_(x x)$ 与 $f_(y y)$ 异号的 $(x,y)$ 即可。
一个例子是 $(x,y) = #boxed[$ (0, (3pi)/2) $]$，这样的例子还有很多。
在该点处我们得到 $f(0, (3pi)/2) = 0$。

事实上，鞍点的完整列表如下：
只要 $m$ 与 $n$ 是整数且 $m+n$ 为奇数，点
$ (x,y) = (m pi, (n + 1/2) pi) $
就是鞍点，而这就是全部的鞍点。
前面的例子是 $m = 0$、$n = 1$ 的特殊情形。

$f$ 的等值线是满足 $cos(x) + sin(y) = 0$ 的点 $(x,y)$ 的集合，
所以实际上每个鞍点都位于这条等值线上。
在 @fig-practice-level-saddle 中，我们用蓝色画出下面的等值线，用红色画出鞍点。
由于只要 $x pm y + pi/2$ 是 $2 pi$ 的倍数就有 $cos(x) = sin(y)$，
这些等值线构成了一张以对角线方向穿过平面的网格。

#figure(
  image("figures/practice-level-saddle.svg", width: auto),
  caption: [$f = cos(x) + sin(y) =  0$ 的等值线。
    鞍点用红色标出，而这些就是全部的鞍点。],
) <fig-practice-level-saddle>


#h3[局部最大值]

局部最大值的一个例子是 $#boxed[$ 0, pi/2 $]$，
在该点 $f(0, pi/2) = cos 0 + sin (pi/2) = 2$。
事实上，$f(x,y) = 2$ 的等值线经过所有的局部最大值点，
而这些点只在 $cos x = sin y = 1$ 时出现，也就是说 $x$ 与 $y-pi/2$ 都是 $2pi$ 的整数倍。
所以 $f$ 取值为 $2$ 的等值线_只_包含一组离散的点，
如 @fig-practice-level-max 所示。

#figure(
  image("figures/practice-level-max.svg", width: auto),
  caption: [$f = cos(x) + sin(y) = 2$ 的等值线，用绿色表示。
    每个绿点都是 $f$ 的一个局部最大值（而且这些就是全部的局部最大值）。],
) <fig-practice-level-max>


== @exer-mf-5 的解答（最优化）

#recall-thm(<exer-mf-5>)

设 $f(x,y) = x^2 + 2y^2 + 4x$。
令 $cal(R)$ 表示区域 $x^2 + y^2 <= 9$，
它是二维的，没有极限情形，边界为 $x^2 + y^2 = 9$。
我们执行 @ch-opt 中的最优化方法。


0. 没有极限情形，但有一条边界 $x^2 + y^2 = 9$，即半径为 $3$ 的圆。

1. 首先来求 $f(x,y,z) = x^2 + 2y^2 + 4x$ 的临界点。
  写出 $ nabla f = vec(2x+4, 4y). $
  唯一使 $nabla f = 0$ 的点是 $(-2,0)$，在该点 $ f(-2,0) = -4. $

2. $cal(R)$ 的边界是 $x^2 + y^2 = 9$。
  我们在边界上使用拉格朗日乘子，把这个边界记为 $cal(S)$，
  约束为 $g(x,y) = x^2+y^2 = 9$。

  0. 新区域 $cal(S)$ 没有边界，也没有极限情形。
  1. 我们来求 $f$ 在 $cal(S)$ 上的拉格朗日乘子临界点。
    取 $g$ 的梯度得到
    $ nabla g = vec(2x, 2y). $
    唯一使 $nabla g = bf(0)$ 的点是 $x=y=0$，它不在 $cal(S)$ 上，
    所以不必担心 $nabla g = bf(0)$ 这种情形。
    现在我们转而求解
    $ vec(2x+4,4y) = lambda vec(2x, 2y). $
    第二个方程给出
    $ 4y = lambda 2y ==> lambda = 2 " or " y = 0. $
    若 $y = 0$，我们得到需要检查的点 $(3,0)$ 和 $(-3,0)$。
    我们有
    $ f(3,0) = 21 \
      f(-3,0) = -3. $
    现在改设 $lambda = 2$。
    于是 $2x+4 = 4x ==> x = 2$，从而 $y = pm sqrt(5)$。
    我们检查这些点
    $ f(2, sqrt(5)) &= 22 \
      f(2, -sqrt(5)) &= 22. $


  2. $cal(S)$ 没有需要考虑的边界。
  3. $cal(S)$ 没有需要考虑的极限情形。

3. $cal(R)$ 没有需要考虑的极限情形。

在我们检查过的五个点中，$#boxed[$ f(-2,0) = -4 $]$
和 $#boxed[$ f(2, pm sqrt(5)) = 22 $]$ 给出最优值。

== @exer-mf-6 的解答（三重积分）

#recall-thm(<exer-mf-6>)

积分区域可以简洁地描述为
$ cal(R) = { 0 <= x <= y <= z <= 1 }. $
交换积分次序，使 $z$ 在最外层：
$ integral_(x=0)^1 integral_(y=x)^1 integral_(z=y)^1 e^(z^3) dif z dif y dif x
  &= integral_(z=0)^1 integral_(y=0)^z integral_(x=0)^y e^(z^3) dif x dif y dif z \
  &= integral_(z=0)^1 e^(z^3) integral_(y=0)^z integral_(x=0)^y 1 dif x dif y dif z \
  &= integral_(z=0)^1 e^(z^3) integral_(y=0)^z y dif y dif z \
  &= integral_(z=0)^1 e^(z^3) z^2/2 dif z \
  &= 1/6 integral_(z=0)^1 e^(z^3) 3z^2 dif z \
  &= 1/6 [e^(z^3)]_(z=0)^1 = #boxed[$ (e-1)/6 $]. $

== @exer-mf-7 的解答（旋度）

#recall-thm(<exer-mf-7>)

$bf(F)$ 的旋度可以计算为
$ nabla times bf(F)
  = detmat(
    ee_1, ee_2, ee_3;
    partial/(partial x), partial/(partial y), partial/(partial z);
    7 cos(x), cos(y) cos(2z), c sin(y) sin(2z)
  ) = vec(c cos(y) sin(2z) - cos(y) dot (-2sin(2z)), 0, 0) $
它仅对 $#boxed[$ c = -2 $]$ 恒为零。
对该 $c$ 值，我们可以通过写出下式来求出势函数 $f$
$ (partial f) / (partial x) &= 7 cos(x) ==> f = 7 sin(x) + C_1(y,z) \
  (partial f) / (partial y) &= cos(y) cos(2z) ==> f = sin(y) cos(2z) + C_2(z,x) \
  (partial f) / (partial z) &= -2 sin(y) sin(2z) ==> f = sin(y) cos(2z) + C_3(x,y). $
因此，可以求出势函数：
$ f(x,y,z) = 7 sin(x) + sin(y) cos(2z). $
对于从 $P$ 出发、到 $Q$ 结束的曲线 $cal(C)$，我们有
$ integral_(cal(C)) f dot dif bf(r) = f(Q) - f(P). $
然而，由于两个三角函数 $sin$ 与 $cos$ 的取值都在 $[-1,1]$ 内，
容易看出 $max f = 8$（例如 $f(pi/2, pi/2, 0) = 8$），
而 $min f = -8$（例如 $f(-pi/2, -pi/2, 0) = -8$）。
因此该线积分可能取得的最大值是 $8 - (-8) = #boxed[$ 16 $]$。

== @exer-mf-8 的解答（通量）

#recall-thm(<exer-mf-8>)

散度为
$nabla dot bf(F) =
  partial / (partial x)(x + e^y + z^3)
  + partial / (partial y)(e^x + y + z^3)
  + partial / (partial z) z = 1 + 1 + 1 = 3. $

给定 $cal(S)$，我们加上两个盖子，$cal(S)_"顶面"$ 与 $cal(S)_"底面"$。
顶盖是由 $z = 9$ 且 $x^2+y^2 <= 100$ 给出的平坦曲面，
法向量朝上。
底盖是由 $z = 7$ 且 $x^2+y^2 <= 100$ 给出的平坦曲面，
法向量朝下。
最后，令 $cal(T)$ 表示由 $7 <= z <= 9$ 且 $x^2 + y^2 <= 100$ 给出的圆柱体，
它由 $cal(S)$、$cal(S)_"顶面"$、$cal(S)_"底面"$ 围成。
于是散度定理给出
$ integral.triple_(cal(T)) nabla dot bf(F) dif V
  = integral.double_(cal(S)_("顶面")) bf(F) dot bf(n) dif S
  + integral.double_(cal(S)_("底面")) bf(F) dot bf(n) dif S
  + integral.double_(cal(S)) bf(F) dot bf(n) dif S. $
第四个量就是我们要求的通量，
所以我们的策略是算出前三个量。

散度很容易处理，因为它是常数：
$ integral.triple_(cal(T)) nabla dot bf(F) dif V
  = integral.triple_(cal(T)) 3 dif V = 3 op("体积")(cal(T)) = 3 dot 100pi dot 2 = 600 pi $
（高度为 $2$、底面积为 $100pi$ 的圆柱体体积）。

对于顶盖，我们回忆一下，对于平行于 $x y$ 平面的平坦曲面，
有 $bf(n) dif S = pm chevron.l 0,0,1 chevron.r dif x dif y$。
于是对顶盖，我们有
$ integral.double_(cal(S)_("顶面")) bf(F) dot bf(n) dif S
  &= integral.double_(cal(S)_("顶面")) chevron.l x+e^y+729, e^x+y+729, 9 chevron.r dot chevron.l 0,0,1 chevron.r dif x dif y \
  &= integral.double_(cal(S)_("顶面")) 9 dif x dif y \
  &= 9 op("面积")(cal(S)_("顶面")) = 900 pi. $
对底盖，我们则得到
$ integral.double_(cal(S)_("底面")) bf(F) dot bf(n) dif S
  &= integral.double_(cal(S)_("底面")) chevron.l x+e^y+343, e^x+y+343, 7 chevron.r dot chevron.l 0,0,-1 chevron.r dif x dif y \
  &= integral.double_(cal(S)_("底面")) (-7) dif x dif y \
  &= - 7 op("面积")(cal(S)_("底面")) = - 700 pi. $
因此，散度定理中的各个量变为
$ 600pi = 900pi - 700pi + integral.double_(cal(S)) bf(F) dot bf(n) dif S $
所以 $integral.double_(cal(S)) bf(F) dot bf(n) dif S = #boxed[$ 400 pi $]$。
