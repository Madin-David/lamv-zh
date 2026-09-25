#import "@local/evan-zh:1.0.0":*

= Echo 部的解答

== @exer-level-curves 的解答（五张等值线图）

#recall-thm(<exer-level-curves>)

在下文中，$c$ 始终表示我们为其绘制等值线的那一个值。

/ 对于 $f(x,y) = 3/2 x + y$:
  函数 $3/2 x + y$ 的等值线是斜率为 $-3/2$ 的直线，
  其 $y$ 轴截距为点 $(0,c)$。
  见 @fig-sol-echo-level-1。

/ 对于 $f(x,y) = x y$:
  当 $c != 0$ 时，$x y = c$ 的图像是双曲线 $y = c/x$。
  对于例外的值 $c = 0$，图像 $x y = 0$ 是两条坐标轴的并集。
  见 @fig-sol-echo-level-2。

/ 对于 $f(x,y) = sin(x^2+y^2)$:
  只有当 $-1 <= c <= 1$ 时，等值线才非空。
  对于这些 $c$，我们得到一簇同心圆，其半径 $r$ 满足 $sin(r^2) = c$。
  例如，当 $c = 0$ 时，我们得到半径为 $0$、$sqrt(pi)$、$sqrt(2pi)$ 等等的圆。
  见 @fig-sol-echo-level-3。

/ 对于 $f(x,y) = e^(y-x^2)$:
  只有当 $c > 0$ 时，等值线才非空。
  该等值线是抛物线 $y = x^2 + log(c)$。
  见 @fig-sol-echo-level-4。

/ 对于 $f(x,y) = max(x,y)$:
  该曲线由看起来像旋转过的 L 形的东西组成，如图所示。
  见 @fig-sol-echo-level-5。

#figure(
  image("figures/sol-echo-level-1.svg", width: auto),
  caption: [$f(x,y) = 3/2 x+y$ 的等值线],
) <fig-sol-echo-level-1>
#figure(
  image("figures/sol-echo-level-2.svg", width: auto),
  caption: [$f(x,y) = x y$ 的等值线],
) <fig-sol-echo-level-2>
#figure(
  image("figures/sol-echo-level-3.svg", width: auto),
  caption: [$f(x,y) = sin(x^2+y^2)$ 的等值线],
) <fig-sol-echo-level-3>
#figure(
  image("figures/sol-echo-level-4.svg", width: auto),
  caption: [$f(x,y) = e^(y-x^2)$ 的等值线],
) <fig-sol-echo-level-4>
#figure(
  image("figures/sol-echo-level-5.svg", width: auto),
  caption: [$f(x,y) = max(x,y)$ 的等值线],
) <fig-sol-echo-level-5>

== @exer-level-seven 的解答（含有七个点的等值线）

#recall-thm(<exer-level-seven>)

这相当棘手。下面的函数应该可行：

$ f(x,y) &= 100 + (x^2 + (y-1)^2)(x^2 + (y-2)^2) ... (x^2 + (y-7)^2). $

于是 $f = 100$ 当且仅当我们给出的那七个二次因式的乘积为零，
即对某个 $k = 1, ..., 7$ 有 $x^2 + (y-k)^2 = 0$。
但这只有在 $(x,y) = (0, k)$ 时才会发生。

换言之，这条对应于 $100$ 的等值线只由七个点组成：
$(0,1)$、$(0,2)$、$(0,3)$、$(0,4)$、$(0,5)$、$(0,6)$ 和 $(0,7)$。

== @exer-partials 的解答（偏导数练习）

#recall-thm(<exer-partials>)

这是直接计算，不需要任何技巧。

- 对于 $f(x,y,z) = x / y + y / z + z / x$，我们计算 $f_x$：
  $ f_x = 1 / y - z / x^2 . $
  同理：
  $ f_y = 1 / z - x / y^2 , quad f_z = 1 / x - y / z^2 . $

- 对于 $f(x,y,z) = sin(x y z)$，我们计算 $f_x$：
  $ f_x = y z cos (x y z) . $
  同理：
  $ f_y = x z cos (x y z) , quad f_z = x y cos (x y z) . $

- 对于 $f(x,y,z) = x^y + y^z + z^x$，我们计算 $f_x$：
  $ f_x = y x^(y - 1) + (log z) z^x . $
  同理：
  $ f_y = z y^(z - 1) + (log x) x^y , quad f_z = x z^(x - 1) + (log y) y^z . $

== @exer-sphere-123 的解答（球的切平面）

#recall-thm(<exer-sphere-123>)

给定球面的方程是：$ x^2 + y^2 + z^2 = 14 . $
为求出在点 $(1 , 2 , 3)$ 处的切平面方程，
我们先计算函数
$ F (x , y , z) = x^2 + y^2 + z^2 - 14 . $
的梯度，它是：
$ nabla F = chevron.l 2 x , 2 y , 2 z chevron.r . $
在 $(1 , 2 , 3)$ 处求值：
$ nabla F (1 , 2 , 3) = chevron.l 2, 4, 6 chevron.r. $
因此切平面应当由
$ 2 x + 4 y + 6 z = c $
给出，其中 $c$ 是某个数。
为使它经过 $(1,2,3)$，我们取
$ c = 2 dot 1 + 4 dot 2 + 6 dot 3 = 28. $

因此答案是 $ #boxed[$2x + 4y + 6z = 28$]. $
如果你不喜欢这个多余的因子 $2$，也可以把它写成 $x + 2y + 3z = 14$。

== @exer-level-grad-poss 的解答（已知等值线是圆）

#recall-thm(<exer-level-grad-poss>)

#h3[函数的例子]

举例来说，$f (x , y)$ 的一个自然选择是：
$ f (x , y) = x^2 + y^2 - 11 . $
它满足：
$ f (x , y) = - 7 quad "if and only if" quad x^2 + y^2 = 4 , $
这定义了一个以原点为心、半径为 $2$ 的圆。
还有别的例子，例如
$ f (x , y) = 100(x^2 + y^2) - 407  $
或
$ f (x , y) = e^(x^2 + y^2) - (e^4 + 7)  $
等等。

#h3[可能的梯度]

对于第二部分，令 $P$ 表示点 $(1.2, -1.6)$。
那么 $P$ 落在这个圆上。
然而，由高中几何（不涉及微积分）可知，
圆在 $P$ 处的切线是直线 $3(x-1.2) - 4(y+1.6) = 0$。
（见 @fig-sol-echo-circle-grad。）
梯度必须与这条直线垂直，
所以它必须是沿 $(1.2, -1.6)$ 方向的某个向量。
也就是说，$nabla f(1.2, -1.6)$ 可以是#footnote[
  严格来说，还应当说明每个向量都能由某个函数产生，
  但在 18.02 里我不想细究这一点。
  懂我在说什么的人应该能替我补上这一步 :P
]
*$(3,-4)$ 的任意倍数*。

#figure(
  image("figures/sol-echo-circle-grad.svg", width: auto),
  caption: [梯度应当垂直于红色圆在 $P$ 处的切线（绿色）。],
) <fig-sol-echo-circle-grad>

#h3[线性近似]

对于线性近似这一步，我们有
$ f(1.208, -1.594) approx f(1.2, -1.6) + (0.008, 0.006) dot nabla f(1.2, -1.6). $
但向量 $(0.008, 0.006)$ 与 $nabla f(1.2, -1.6)$ 互相垂直。
所以点积为零，答案是 $f(1.2, -1.6) = #boxed[-7]$。

== @exer-antigrad-preview 的解答（反梯度预览）

#recall-thm(<exer-antigrad-preview>)

对于前三道习题，只需取下面这些：

$
  f_1(x,y) &= x^2 / 2 + y^2 / 2  \
  f_2(x,y) &= 50 x^2 + y^2 / 2 \
  f_3(x,y) &= x y.
$

第四项任务是不可能的：这样的函数根本不存在。
在后面的章节里你会看得更清楚，
但即使现在直接看，也能意识到由 $f_x = 100 y$ 应当有
$ f(x,y) = 100 x y + ("stuff with only" y "in it") $
而对它关于 $y$ 求导，无论如何也得不到单独的 $x$。
更多细节请再读 @ch-antigrad。

== @exer-grad-abc 的解答（过 $(0,d)$ 的等值线）

#recall-thm(<exer-grad-abc>)

$f$ 的梯度为
$ nabla f = vec( a e^(x + y) + b e^(x - y),  a e^(x + y) - b e^(x - y) ). $
在原点 $(x,y) = (0,0)$ 处我们得到
$ nabla f (0,0) = vec(a+b, a-b). $
等值线在原点处与直线 $y = 5 x$ 相切这一条件意味着
梯度向量 $nabla f (0, 0)$ 必须是
$-5x + y = 0$ 的法向量 $vec(-5,1)$ 的某个倍数。
换言之，我们应当有
$ (a+b)/(a-b) = -5 ==> 3a=2b ==> b = 3/2 a. $

我们还知道 $c = f(0,0) = f(0,d)$。
我们计算
$ f(0,0) &= a e^(0+0) + b e^(0-0) = a + b = a + 3/2 a = 5/2 a \
  f(0,d) &= a e^d + b e^(-d) = (e^d + 3/2 e^(-d)) a. $
由于 $a != 0$，我们得出
$ e^d + 3/2 e^(-d) = 5/2 <==> (e^d-1)(e^d-3/2) = 0  $
因此 $#boxed[$ d = log(3/2) $]$。

== @exer-antigrad-quad 的解答（反梯度练习）

#recall-thm(<exer-antigrad-quad>)

已知函数 $f (x , y)$ 的梯度为：
$ nabla f (x , y) = vec(x^2 + a x y + 2 y^2 + y + 1 , x^2 + x + b x y + y^2 + 2) . $

为计算 $a$ 与 $b$，我们计算
$ (partial) / (partial y) (x^2 + a x y + 2 y^2 + y + 1) &= a x + 4 y + 1 \
  (partial) / (partial x) (x^2 + x + b x y + y^2 + 2) &= 2 x + 1 + b y . $
它们必须对所有的 $(x,y)$ 都相等，所以我们要求 $#boxed[$ (a,b)=(2,4) $]$。

为还原出 $f$，我们写出
$ f (x , y) = integral (partial f) / (partial x) dif x
  &= integral (x^2 + 2 x y + 2 y^2 + y + 1) dif x \
  &= x^3 / 3 + x^2 y + 2 x y^2 + x y + x + C_1(y). \
  f (x , y) = integral (partial f) / (partial y) dif y
  &= integral (x^2 + x + 4 x y + y^2 + 2) dif y \
  &= x^2 y + x y + 2 x y^2 + y^3/3 + 2 y + C_2(x). $
把它们拼接起来，得到 $f (x , y)$ 的最终表达式：
$ f (x , y) = #boxed($ x^3 / 3 + x^2 y + 2 x y^2 + y^3 / 3 + x y + x + 2 y + C $) $
其中 $C$ 为任意常数。
