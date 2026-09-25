#import "@local/evan-zh:1.0.0":*

= Alfa 部习题解答 <ch-sol-alfa>

== @exer-tsafe 的解答（类型安全）

#recall-thm(<exer-tsafe>)

- 表达式 $(bf(u) dot bf(v)) dot bf(w)$ 是*向量*，因为
  $ bf(u) dot bf(v) & = "标量"\
  "标量" dot bf(w) & = "向量" $

- 表达式 $bf(u) dot bf(v) + bf(w)$ 是*类型错误*，因为
  $ bf(u) dot bf(v) & = "标量" \
  "标量" + bf(w) & = "无定义（标量与向量不能相加）". $

- 表达式 $bf(u) dot (bf(v) + bf(w))$ 是*实数*，因为
  $ bf(v) + bf(w) & = "向量"\
  bf(u) dot "向量" & = "标量" $

== @exer-vectors-dir 的解答（方向）

#recall-thm(<exer-vectors-dir>)

这个例子的用意在于强调，你可以把像 $0.0001 pi$ 这样奇怪的正常数缩放掉；
向量 $ bf(w) = vec(-8, -9, -12) $
指向同一个方向。
因此只需找出与 $bf(w)$ 方向相同的单位向量，即
$ 1/(|bf(w)|) bf(w)
  &= 1/sqrt((-8)^2 + (-9)^2 + (-12)^2) vec(-8, -9, -12)
  = 1/sqrt(64+81+144) vec(-8, -9, -12)
  = 1/sqrt(289) vec(-8, -9, -12) \
  &= 1/17 vec(-8, -9, -12) = #boxed[$ vec(-8 slash 17, -9 slash 17, -12 slash 17) $]. $
（注意 $chevron.l 8 slash 17, 9 slash 17, 12 slash 17 chevron.r$
并不是正确答案：那个向量指向相反的方向。）

== @exer-vectors-scaledet 的解答（$det(10A)$）

#recall-thm(<exer-vectors-scaledet>)

我断言答案是
$ det(10A) = 10^3 dot det A = #boxed[$ 2000 $]. $
有两种理解它的方式：

- 从几何上看，考虑由 $A$ 的列向量
  构成的平行六面体。
  如果我们把它的每条边长都放大 $10$ 倍，
  那么体积应当增大 $10^3 = 1000$ 倍。
- 从代数上看，在行列式的公式中，
  要点在于每一项都放大 $10$ 倍，
  而乘积每次是三个因子相乘。

  举一个例子也许更容易看清，所以我们取
  $ A = mat(3,5,0;5,9,0;0,0,1) $
  作为行列式为 $2$ 的矩阵的例子：
  $ det(A) = 3 dot 9 dot 1 - 5 dot 5 dot 1 = 2. $
  于是
  $ 10A = mat(30,50,0;50,90,0;0,0,10) $
  所以
  $ det(A) = 30 dot 90 dot 10 - 50 dot 50 dot 10 = 2000. $

== @exer-vectors-coplanar 的解答（共面）

#recall-thm(<exer-vectors-coplanar>)

记这些点为 $P_1 = (0,0,0)$, $P_2 = (1,0,1)$, $P_3 = (0,1,2)$, $P_4 = (1,2,a)$。

解决这个问题有几种方法（包括用到后面材料的方法）；
使用本章材料的方法是下面这种：

#idea[
  四点共面，当且仅当由“连接其中一点到另外三点的向量”
  所构成的平行六面体体积为零。
  这个条件等价于由这三个向量构成的
  矩阵的行列式为零。
]

选取 $P_1 = (0,0,0)$ 作为参考点。
那么从 $P_1$ 指向其余各点的向量为：
$ bf(v)_1 &= P_2 - P_1 = vec(1, 0,  1) \
  bf(v)_2 &= P_3 - P_1 = vec(0 , 1 , 2) \
  bf(v)_3 &= P_4 - P_1 = vec(1, 2 , a) $
然后把这三个向量作为列，构造一个 $3 times 3$ 矩阵：
$ M = mat(1, 0, 1; 0, 1, 2; 1, 2, a). $
$M$ 的行列式为：
$ det (M) = 1 dot detmat(1, 2; 2, a)
  - 0 dot detmat(0, 2; 1, a)
  + 1 detmat(0, 1; 1, 2). $
计算每个余子式行列式：
$ detmat(1, 2; 2, a) &= (1) (a) - (2) (2) = a - 4 \
  detmat(0, 2; 1, a) &= (0) (a) - (2) (1) = - 2 \
  detmat(0, 1; 1, 2) &= (0) (2) - (1) (1) = - 1. $
代回得：
$ det M = 1 dot (a - 4) - 0 dot (- 2) + 1 dot (- 1) = a - 4 - 1 = a - 5. $
因此 $det M = 0 <==> #boxed[$ a = 5 $]$。

== @exer-dot-perp4d 的解答（四维向量）

#recall-thm(<exer-dot-perp4d>)

我们需要点积为零：
$ 0 &= chevron.l 1,2,3,4 chevron.r dot chevron.l 5,6,7,t chevron.r \
  &= 1 dot 5 + 2 dot 6 + 3 dot 7 + 4 dot t \
  &= 38 + 4t ==> #boxed[$ t = -19/2 $]. $

== @exer-dot-proj 的解答（投影）

#recall-thm(<exer-dot-proj>)

第一部分要求计算
$chevron.l 123,456,789 chevron.r$
在 $ee_1$ 方向上的向量投影。
答案就是 $ #boxed[$ chevron.l 123,0,0 chevron.r  $]. $
如果你愿意，也可以用方法得到它，
但如果你画个图，要点就在于你只是把
向量 $chevron.l 123, 456, 789 chevron.r$ 投影到 $x$ 轴上，
得到的正是它的 $x$ 分量。

对于第二部分，令
$ bf(v) &= vec(1 , 2 , 3) \
  bf(w) &= vec(- 3000, - 4000, 0). $

注意 $bf(w)$ 中的因子 $-1000$ 无关紧要，
因为对 $bf(w)$ 缩放本来就不影响结果。
我们保留这个 $-1000$ 只是为了演示，
但实际上有经验的学生会直接用
$bf(w) = chevron.l 3, 4, 0 chevron.r$ 代替。

我们直接照着 @sec-recipe-proj 中的方法做。
先计算点积：
$ bf(v) dot bf(w) = (1) (- 3000) + (2) (- 4000) + (3) (0)
  = - 3000 - 8000 + 0 = - 11000 $
模长为
$ |bf(w)| = sqrt((- 3000)^2 + (- 4000)^2 + 0^2) = 5000. $
$bf(v)$ 沿 $bf(w)$ 的标量分量为：
$ op("comp")_(bf(w))(bf(v)) = frac(bf(v) dot bf(w), |bf(w)|)
  = (- 11000) / (5000) = - 11/5. $

$bf(v)$ 沿 $bf(w)$ 的向量投影为：
$ op("proj")_(bf(w))(bf(v))
  = frac(bf(v) dot bf(w), |bf(w)|) (bf(w) / (|bf(w)|))
  = -11/5 dot vec(-3000, -4000, 0) / 5000
  = -11/5 dot vec(-3 slash 5, -4 slash 5, 0)
  = #boxed[$ vec(33 slash 25, 44 slash 25, 0) $]. $

== @exer-dot-reverse 的解答（点积为 $3$）

#recall-thm(<exer-dot-reverse>)

从几何上看，我们预期有两个解：
若 $theta$ 是两向量之间的夹角，我们需要 $cos theta = 3/5$，
因此应当有两个向量满足条件。
图见 @fig-sol-alfa-dot-reverse。
（你可能已经猜到了其中一个解 ——
$bf(v) = chevron.l 1,0 chevron.r $ 显然可行 —— 但我们就假装没注意到。）

#figure(
  image("figures/sol-alfa-dot-reverse.svg", width: auto),
  caption: [@exer-dot-reverse 的两个答案，
    即与 $chevron.l 3,4 chevron.r$ 相距相等夹角的两个单位向量。
  ],
) <fig-sol-alfa-dot-reverse>

把已知条件翻译成代数语言，
我们得到如下方程组：
$ bf(v) dot bf(w) = 3 &==> 3 x + 4 y = 3 \
  |bf(v)| = 1 &==> x^2 + y^2 = 1 $

由点积条件解出 $x$：
$ 3 x + 4 y = 3 ==> x = (3 - 4 y) / (3). $

把 $x = (3 - 4 y) / (3)$ 代入 $x^2 + y^2 = 1$ 并求解：
$ ((3 - 4 y) / (3))^2 + y^2 &= 1 \
  <==> (25 y^2 - 24 y + 9) / (9) &= 1 \
  <==> y (25 y - 24) &= 0. $
因此要么 $y = 0$，要么 $y = 24/25$。

- 若 $y = 0$，得到 $x = frac(3 - 4 (0), 3) = 1$。
  因此第一个单位向量是：$bf(v)_1 = chevron.l 1 , 0 chevron.r$。
- 若 $y = 24 / 25$，得到 $x = frac(3 - 4 (24 / 25), 3) = - 7 / 25$。
  因此第二个单位向量是：
  $bf(v)_2 = chevron.l -7 / 25 , 24 / 25 chevron.r$。

总之，答案是
$ #boxed[$ chevron.l 1,0 chevron.r " 与 " lr(chevron.l -7/25, 24/25 chevron.r) $]. $
两个解的图示见 @fig-sol-alfa-dot-reverse。

== @exer-cauchy 的解答（$2$ 与 $5$）

#recall-thm(<exer-cauchy>)

构造 $RR^3$ 中的向量 $bf(v) = chevron.l a,b,c chevron.r$
与 $bf(w) = chevron.l x,y,z chevron.r$。
那么题目的意思是 $|bf(v)| = sqrt(2)$, $|bf(w)| = sqrt(5)$，
并要求出 $bf(v) dot bf(w)$ 所有可能的取值。
但点积的几何定义告诉我们
$ bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta = sqrt(10) cos theta $
其中 $theta$ 是 $bf(v)$ 与 $bf(w)$ 之间的夹角。

由于 $theta$ 可以是任意角（因为 $bf(v)$ 与 $bf(w)$ 是任意的 $RR^3$ 向量），
当 $cos theta$ 从 $-1$ 取到 $1$ 时，
$sqrt(10) cos theta$ 的可能取值将遍历区间
$#boxed[$ [-sqrt(10), sqrt(10)] $]$。

== @exer-planes-cube 的解答（正方体的面）

#recall-thm(<exer-planes-cube>)

主要的观察是这样的：
#idea[
  正方体各个面的法向量互相正交。
]
而这两个平面的法向量是：
$ bf(n)_1 = chevron.l 1 , 2 , 3 chevron.r \
  bf(n)_2 = chevron.l 5 , 6 , k chevron.r. $
要使这两个平面垂直，它们的法向量必须满足：
$ 0 &= bf(n)_1 dot bf(n)_2 \
  &= (1) (5) + (2) (6) + (3) (k) = 5 + 12 + 3 k = 17 + 3 k. $
解出 $k$ 得 $#boxed[$ k = -17/3 $]$。

== @exer-planes-sandwich 的解答（到两个平面的距离）

#recall-thm(<exer-planes-sandwich>)

#figure(
  image("figures/sol-alfa-plane-sandwich.svg", width: auto),
  caption: [一幅示意图，画出平面 $Pi_1$ 与 $Pi_2$
    以及点 $P$ 的几个可能位置。],
) <fig-sol-alfa-plane-sandwich>

记这两个平面为
$ "平面" Pi_1 : quad 3 x + 4 y + 12 z &= - 1 \
  "平面" Pi_2 : quad 3 x + 4 y + 12 z &= 1000. $
见图 @fig-sol-alfa-plane-sandwich。
设 $d$ 为所求的距离。

思路是这两个平面平行，所以实际上应当只有
两个可能的答案。
做代数计算时，首先注意到（平行的）平面 $Pi_1$ 与 $Pi_2$
有相同的法向量：
$ bf(n) = chevron.l 3 , 4 , 12 chevron.r $
其模长为 $|bf(n)| = sqrt(3^2+4^2+12^2) = 13$。

现在要计算 $Pi_1$ 与 $Pi_2$ 之间的距离，
我们考虑 $Pi_2$ 上的任意一点 $(x_0, y_0, z_0)$
（即 $3x_0 + 4y_0 + 12z_0 = 1000$），
并求它到 $Pi_1$ 的距离。
根据 @sec-distance-plane 中的方法，它等于
$ "点 " (x_0, y_0, z_0) " 到 " Pi_1 " 的距离"
  &= (|3x_0 + 4y_0 + 12z_0 + 1|) / (|bf(n)|) \
  &= (|1000 + 1|) / 13 = 77. $
因此答案是 $d = 77 pm 42$，即
$#boxed[$ d = 35 $]$ 或 $#boxed[$ d = 119 $]$。

#remark[
  如果你没有想到去看 $Pi_1$ 与 $Pi_2$ 之间的距离，
  你仍然可以把 @sec-distance-plane 中的方法
  直接用在 $P$ 上求解本题。
  事实上，设 $P = (x_1, y_1, z_1)$。
  那么
  $ 42 = op("dist")(P, Pi_1) &= (|3x_1 + 4y_1 + 12z_1 + 1|) / (|bf(n)|) \
    d = op("dist")(P, Pi_2) &= (|3x_1 + 4y_1 + 12z_1 - 1000|) / (|bf(n)|) $
  第一个方程告诉我们
  $ 3x_1 + 4y_1 + 12z_1 = pm 42 dot 13 - 1. $
  第二个方程告诉我们
  $ d = (|(pm 42 dot 13 - 1) - 1000|) / 13
    = (|pm 42 dot 13 - 1001|) / 13
    = |pm 42 - 77| $
  这给出相同的答案。
]

== @exer-cross-100ab 的解答（叉积为 $0$）

#recall-thm(<exer-cross-100ab>)

两个非零向量的叉积为 $0$，
当且仅当它们互为倍数。
因此得到 $#boxed[$ a= 200 $]$ 与 $#boxed[$ b = 300 $]$。

== @exer-cross-scale 的解答（$5 bf(w) times 4 bf(v)$）

#recall-thm(<exer-cross-scale>)

利用叉积的性质：
$ 5bf(w) times 4bf(v)
  = 20 (bf(w) times bf(v))
  = -20 (bf(v) times bf(w))
  = -20 vec(1,2,3) = #boxed[$ vec(-20, -40, -60) $]. $
$5bf(w) times 4bf(v) = 20 (bf(w) times bf(v))$ 这一事实
既可直接由几何定义得到
（平行四边形的面积变为 $20$ 倍），
也可由代数定义看出
（其中 $4$ 与 $5$ 被提取出来）。
而 $bf(w) times bf(v) = -bf(v) times bf(w)$ 这一事实
同样可直接由右手定则得到。

== @exer-cross-pythag 的解答（$|bf(v) times bf(w)|^2 + (bf(v) dot bf(w))^2$）

#recall-thm(<exer-cross-pythag>)

设 $theta$ 为两向量之间的夹角。
那么叉积与点积的几何定义给出
$ |bf(v) times bf(w)| &= |bf(v)| |bf(w)| lr(|sin theta|)
  = 1 dot 1 dot lr(|sin theta|) = lr(|sin theta|) \
  bf(v) dot bf(w) &= |bf(v)| |bf(w)| cos theta
  = 1 dot 1 dot cos theta = cos theta. $
因此答案是
$ lr(|sin theta|)^2 + (cos theta)^2 = #boxed[$ 1 $] $
由勾股定理：只有一种可能的取值。

== @exer-cross-perp 的解答（解出 $k$）

#recall-thm(<exer-cross-perp>)

要点在于 $vec(1,2,3)$ 与 $vec(4,5,k)$ 应当
互相垂直；除此之外，向量 $bf(v)$ 完全无关紧要。
要它们互相垂直，我们需要
$ 0 &= vec(1,2,3) dot vec(4,5,k) = 1 dot 4 + 2 dot 5 + 3k = 3k + 14
  ==> #boxed[$ k = -14 / 3 $] $.
