#import "@local/evan-zh:1.0.0":*

= Golf 部习题解答

== @exer-slicing-standard 的解答（用切片法练习）

#recall-thm(<exer-slicing-standard>)

设 $cal(R)$ 为曲线 $y = sqrt(x)$ 与 $y = x^3$ 所围成的区域。
我们要计算积分
$ I = integral.double_(cal(R)) x^(100) y^(200) dif x dif y . $

为确定积分限，
我们通过解 $sqrt(x) = x^3$ 来求交点。
两边平方得 $x = x^6 ==> x(x^5-1) = 0$，所以 $x=0$ 或 $x=1$。
也就是说，交点为 $(0,0)$ 与 $(1,1)$。
该区域的草图见 @fig-sol-golf-double-sol1。

#figure(
  image("figures/sol-golf-double-sol1.svg", width: auto),
  caption: [$y = sqrt(x)$ 与 $y = x^3$ 之间的区域。],
) <fig-sol-golf-double-sol1>

由图可见，我们可以用不等式
$ 0 <= x^3 <= y <= sqrt(x) <= 1. $
来描述区域 $cal(R)$。

#h3[内层对 $x$ 积分、外层对 $y$ 积分]

$y$ 的取值从 $0$ 到 $1$。
对每个固定的 $y$，$x$ 的取值范围是
$ y^2 <= x <= y^(1\/3) $
所以积分为：
$ I = integral_(y = 0)^1 integral_(x = y^2)^(y^(1 \/ 3)) x^(100) y^(200) dif x dif y . $
计算内层积分：
$ integral_(x = y^2)^(y^(1 \/ 3)) x^100 dif x = [x^101 / 101]_(x = y^2)^(y^(1\/3))
  = y^(101 \/ 3) / 101 - y^202 / 101 . $
现在对 $y$ 积分：
$ I &= integral_(y = 0)^1 (y^(101 \/ 3) / 101 - y^202 / 101) y^200 dif y \
    &= 1 / 101 (integral_(y=0)^1 y^(701\/3) dif y - integral_(y=0)^1 y^(402) dif y) \
    &= 1 / 101 (3/704 - 1/403) = #boxed[$ 5 / 283712 $]. $

#h3[内层对 $y$ 积分、外层对 $x$ 积分]

$x$ 的取值从 $0$ 到 $1$。
对固定的 $x$，$y$ 的取值范围是
$ x^3 <= y <= x^(1\/2) $
所以积分为
$ I = integral_(x = 0)^1 integral_(y = x^3)^(x^(1 \/ 2)) x^(100) y^(200) dif y dif x . $

计算内层积分：
$ integral_(y = x^3)^(sqrt(x)) y^200 dif y = [y^201 / 201]_(y = x^3)^(y = sqrt(x))
  = x^(201\/2) / 201 - x^603 / 201 . $
现在对 $x$ 积分：
$ I &= integral_(x = 0)^1 x^100 (x^(201\/2) / 201 - x^603 / 201) dif x \
  &= 1/201 (integral_(x=0)^1 x^(401\/2) dif x - integral_(x=0)^1 x^(703) dif x) \
  &= 1/201 (2/403 - 1/704) = #boxed[$ 5 / 283712 $]. $

== @exer-slicing-mass 的解答（区域的质心）

#recall-thm(<exer-slicing-mass>)

该区域与前一题中的区域非常相似，同理也可以描述为
$ 0 <= x^2 <= y <= sqrt(x) <= 1 $
如 @fig-sol-golf-double-sol2 所示。
（除了把 $x^3$ 换成 $x^2$ 之外，它与上一题完全相同，
所以只需把所有 $3$ 都换成 $2$ 即可。）
注意该区域关于直线 $y = x$ 对称，
所以_先验地_我们也应期望答案落在 $y = x$ 上。

#figure(
  image("figures/sol-golf-double-sol2.svg", width: auto),
  caption: [$y=sqrt(x)$ 与 $y=x^2$ 之间的区域。],
) <fig-sol-golf-double-sol2>

首先，为计算 $cal(R)$ 的面积，我们可以写出
$ op("面积")(cal(R)) = integral_(x = 0)^1 integral_(y=x^2)^(sqrt(x)) 1 dif y dif x
  = integral_(x=0)^1 (sqrt(x) - x^2) dif x
  = [2/3 x^(3\/2) - 1/3 x^3]_(x=0)^1 = 1/3. $

因此质心的 $x$ 坐标为
$ dash(x) = 1 / (op("面积")(cal(R))) integral_(cal(R)) x dif A
  &= 1 / (1\/3) integral_(x = 0)^1 integral_(y=x^2)^(sqrt(x)) x dif y dif x \
  &= 3 integral_(x = 0)^1 x (sqrt(x) - x^2) dif x \
  &= 3 [2/5 x^(5/2) - 1/4 x^4]_(x=0)^1 = 9/20. $

至于 $y$ 坐标，由区域的对称性我们期望 $dash(y) = dash(x)$，事实确实如此
$ dash(y) = 1 / (op("面积")(cal(R))) integral_(cal(R)) y dif A
  &= 1 / (1\/3) integral_(x = 0)^1 integral_(y=x^2)^(sqrt(x)) y dif y dif x \
  &= 3 integral_(x = 0)^1 [y^2/2]_(y=x^2)^(sqrt(x)) dif x \
  &= 3/2 integral_(x = 0)^1 (x-x^4) dif x \
  &= 3/2 [1/2 x^(2) - 1/5 x^5]_(x=0)^1 = 9/20. $

因此，该区域的质心为：$ #boxed[$ (9/20, 9/20) $]. $

== @exer-swapint-fifth 的解答（含五次根号的二重积分）

#recall-thm(<exer-swapint-fifth>)

把它写成一个区域，即
$ cal(R) = cases(0 <= y <= 1, y <= x <= root(5, y)). $
$x$ 的取值可以在 $0 <= x <= 1$ 中任意变动。
对固定的 $x$，$y$ 需要满足四个条件：$0 <= y <= 1$
以及 $x^5 <= y <= x$。
但实际上 $ 0 <= x^5 <= y <= x <= 1 $
所以我们可以把它压缩为：
$ cal(R) = cases(0 <= x <= 1, x^5 <= y <= x). $
于是，新的积分限变为：
$ integral_(x = 0)^1 integral_(y = x^5)^x (x y^2) / (1 - x^12) dif y dif x $

我们现在计算关于 $y$ 的内层积分：
$ integral_(y = x^5)^x y^2 dif y = [y^3 / 3]_(y = x^5)^(y = x) $
代入积分限：
$ 1 / 3 (x^3 - (x^5)^3) = 1 / 3 (x^3 - x^15) $

现在把这个结果代入外层积分：
$ integral_(x = 0)^1 (x) / (1 - x^12) dot 1 / 3 (x^3 - x^15) dif x $
化简：

$ 1 / 3 integral_(x = 0)^1 (x) / (1 - x^12) (x^3 - x^15) dif x
  &= 1 / 3 integral_(x = 0)^1 (x^4 - x^16) / (1 - x^12) dif x \
  &= 1/3 integral_(x = 0)^1 x^4 dif x \
  &= 1/3 (1/5 - 0) = 1/15. $

== @exer-rat-slice 的解答（有理式积分）

#recall-thm(<exer-rat-slice>)

为简便起见，令 $N := 999^5$。

乍看之下，这像是一个 18.01 的积分，
但我们从 18.01 中知道，这个积分其实是在度量某条曲线下方的面积。
思路是：为了避免应付那些丑陋的根号，
我们将对图中曲线下方的区域使用水平切片。

#figure(
  image("figures/practice-undergraph.svg", width: auto),
  caption: [区域 $0 <= y <= root(3, root(5,x) + 1)$，其中 $0 <= x <= N$。完全没有按比例绘制。],
)

我们先把该区域写成不等式的形式：我们有 $0 <= x <= N$、$y >= 0$ 以及
$ y <= root(3, root(5, x) + 1) <==> x >= (y^3-1)^5. $
因此，曲线下方的面积可以分成两部分。
在 $0 <= y <= 1$ 的范围内，我们得到上面所示的浅蓝色矩形（图的下半部分），
它从 $0 <= x <= N$ 延伸到 $0 <= y <= 1$，面积为 $N$。
然后在 $1 <= y <= 10$ 时，$x$ 的界则变为
$ (y^3-1)^5 <= x <= N. $
这就是深蓝色区域（图的上半部分），它的面积为
$ integral_(y=1)^(10) integral_(x = (y^3-1)^5)^N 1 dif x dif y = integral_(y=1)^(10) (N - (y^3-1)^5) dif y. $
因此总面积为
$ N + integral_(y=1)^(10) (N - (y^3-1)^5) dif y
  = N + 9N - integral_(y=1)^(10) (y^3-1)^5 dif y. $
容易看出这是一个有理数。
#remark[
  用计算器，也可以显式地算出
  $ integral_(y=1)^(10) (y^3-1)^5 dif y
  = integral_(y=1)^(10) (y^(15) - 5y^(12) + 10y^9 - 10y^6 + 5y^3 - 1) dif y
  = 904414539218186169/1456 $
  只要你愿意。
]

#digression[
  也可以用 18.01 的方法，通过作 $u$-代换 $u = x^(1/5)+1$ 来计算这个积分，
  但那样相当繁琐。
]

== @exer-chvar-triangle 的解答（在三角形上的积分）

#recall-thm(<exer-chvar-triangle>)

我们使用变换：$ u = x + y , quad v = x / y . $
在 $(u,v)$ 坐标下，该区域可以表示为
$ 0 <= u <= 3, quad 1/2 <= v <= 2. $
这画在 @fig-sol-golf-triangle 中。

#figure(
  image("figures/sol-golf-triangle.svg", width: auto),
  caption: [顶点为 $(0,0)$、$(1,2)$ 与 $(2,1)$ 的三角形，
    图中提示的换元是 $u = x+y$ 与 $v = x/y$],
) <fig-sol-golf-triangle>

这里我们要使用逆雅可比
$ det (J_(bf(T)^(-1))) = detmat(
    (partial u)/(partial x), (partial u)/(partial y);
    (partial v)/(partial x), (partial v)/(partial y)
  ) = detmat(
    1, 1;
    1/y, -x/y^2
  ) = -(x+y) / y^2. $
所以
$ 1 / (|det (J_(bf(T)^(-1)))|) = y^2 / (x+y). $

因此，变换后的积分变为
$
  integral_(u=0)^3 integral_(v=1/2)^2 (x+y)^2 / (x y) dot y^2 / (x+y) dif v dif u
  &= integral_(u=0)^3 integral_(v=1/2)^2 y/x dot (x+y) dif v dif u \
  &= integral_(u=0)^3 integral_(v=1/2)^2 1/v dot u dif v dif u \
  &= (integral_(u=0)^3 u dif u)(integral_(v=1/2)^2 1/v dif v) \
  &= [u^2/2]_(u=0)^3 dot [log v]_(v=1/2)^2 \
  &= 9/2 dot (log 2 - log (1/2)) = #boxed[$ 9 log 2 $].
$

== @exer-polar1 的解答（极坐标积分 1）

#recall-thm(<exer-polar1>)

这些积分限所描述的区域由以下条件界定：
- $0 <= x <= 1$，
- $0 <= y <= sqrt(1 - x^2)$。
这对应于单位圆盘第一象限中的四分之一圆，
即 $x^2 + y^2 <= 1$ 且 $x >= 0$、$y >= 0$。

使用极坐标变换：
$ x = r cos theta , quad y = r sin theta , quad dif x dif y = r dif r dif theta . $
给定的区域对应于：
- $0 <= r <= 1$，
- $0 <= theta <= pi / 2$。
改写被积函数：
$ x y = (r cos theta) (r sin theta) = r^2 cos theta sin theta . $

因此该积分化为：
$ I &= integral_(theta = 0)^(pi \/ 2) integral_(r = 0)^1 r^2 cos theta sin theta dot r dif r dif theta \
  &= (integral_(r=0)^1 r^3 dif r) (integral_(theta = 0)^(pi \/ 2) sin(2theta)/2 dif theta) \
  &= [r^4/4]_(r=0)^1 [-cos(2theta)/4]_(theta=0)^(pi\/2) \
  &= 1/4 dot 1/2 = #boxed[$ 1/8 $]. $

== @exer-polar2 的解答（极坐标积分 2）

#recall-thm(<exer-polar2>)

在 @sec-offset-circle 中，我们已经确定所给区域在极坐标下描述为：
$ 0 <= r <= 2 cos theta , quad - pi / 2 <= theta <= pi / 2 . $
使用标准的极坐标变换：
$ x = r cos theta , quad y = r sin theta , quad dif x dif y = r dif r dif theta , $
给定的被积函数就是 $r$。
$ 1 / sqrt(x^2 + y^2) = 1 / sqrt(r^2) = 1 / r . $
因此，该积分
变为：
$ I &= integral_(theta = - pi \/ 2)^(pi \/ 2) integral_(r = 0)^(2 cos theta) 1 / r dot r dif r dif theta \
  &= integral_(theta = - pi \/ 2)^(pi \/ 2) integral_(r = 0)^(2 cos theta) dif r dif theta \
  &= integral_(theta = - pi \/ 2)^(pi \/ 2) 2 cos theta dif theta \
  &= [2 sin theta]_(theta = - pi \/ 2)^(pi \/ 2) \
  &= #boxed[$ 4 $]. $

== @exer-polar3 的解答（极坐标积分 3）

#recall-thm(<exer-polar3>)

这实际上是 @sec-offset-circle 中那道例题的变装版本！
也就是说，答案同样是 $32/9$。

重复一下，在 @sec-offset-circle 中，那道例题可以看作是在说明
$ I_1 = integral.double_((x-1)^2 + y^2 <= 1) sqrt(x^2+y^2) dif x dif y = 32/9. $
我们的目标是论证
$ I_2 = integral.double_(x^2+y^2 <= 1) sqrt((x+3/5)^2 + (y+4/5)^2) dif x dif y = #boxed[$ 32/9 $]. $

注意：
- 第一个积分 $I_1$ 取在以 $(1 , 0)$ 为圆心、半径为 1 的圆盘上。
  我们把这个圆盘称为 $cal(R)_1$。
- 第二个积分 $I_2$ 取在以 $(0 , 0)$ 为圆心的单位圆盘上。
  我们把这个圆盘称为 $cal(R)_2$。

注意圆盘 $cal(R)_1$ 与 $cal(R)_2$ 是全等的。
此外，

- $I_1$ 中的被积函数是 $sqrt(x^2 + y^2)$。
  它度量 $cal(R)_1$ 中每个点到原点 $O = (0 , 0)$ 的距离。
  注意 $O$ 是 $cal(R)_1$ 边界上的一点。
- $I_2$ 中的被积函数是 $sqrt((x + 3 / 5)^2 + (y + 4 / 5)^2)$。
  它度量 $cal(R)_2$ 中每个点到原点 $P = (-3/5, -4/5)$ 的距离。
  注意 $P$ 是 $cal(R)_2$ 边界上的一点。

见 @fig-sol-golf-polar 中的图示。

#figure(
  image("figures/sol-golf-polar.svg", width: auto),
  caption: [@sec-offset-circle 与 @exer-polar3 中积分 $I_1$ 与 $I_2$ 的图示，
    说明它们计算的是同一件事。],
) <fig-sol-golf-polar>

由于这两个积分本质上都是在全等的区域上计算同一个函数，
结果必然相等。
