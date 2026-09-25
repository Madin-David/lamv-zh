#import "@local/evan-zh:1.0.0":*

= 标量场线积分与曲面积分 <ch-scalint>

回想一下 @poster-triangle。
到目前为止，除了标着"线积分"和"曲面积分"的那几项之外，
其他内容我们都已讲过。
本章将讨论它们。
为清楚起见，我实际上把它们称为*标量场线积分*
和*标量场曲面积分*。

这样命名的原因是，稍后我们会遇到
线积分与曲面积分的向量场版本，
它们在 18.02 中扮演重要得多的角色。
事实上我们在 @sec-warning-trio 中提到过，这些标量场积分
只在少数特定情形下才会用到。

== [TEXT] 弧长，及其向标量场线积分的推广

其实我们早在 Part Delta 就已经见过弧长了！
为了方便，我在这里再陈述一次，但这是重复内容：

#definition(title: [定义：弧长])[
  如果参数化 $bf(r)(t) : RR -> RR^n$ 在 $RR^n$ 中描出一条路径，
  那么*弧长*定义为
  $ L = integral_(t="起始时刻")^("终止时刻") lr(|bf(r)'(t)|) dif t. $
]

#warning(title: [警告：这些积分没有红箭头])[
  *我们没那么喜欢这些标量场线积分与曲面积分*；
  它们就是表现不太好，部分原因在于那个别扭的绝对值。
  例如，斯托克斯定理——18.02 课程中最重要的定理——
  对弧长并不成立（本章中的其他内容也一样）。

  特别地：*弧长没有微积分基本定理*。
  为了把这个警告说清楚，注意两个常见的"错误猜测"：
  $ integral_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b)| - |bf(r)(a)| \
    integral_(t=a)^(b) lr(|bf(r)'(t)|) dif t &!= |bf(r)(b) - bf(r)(a)|. $
  这是一个很诱人的错误，我见过有人犯；
  你可能会希望微积分基本定理
  对 $|bf(r)'(t)|$ 也能以某种方式成立，类比于对可微函数 $f : RR -> RR$ 有
  $integral_(x=a)^b f'(x) dif x = f(b) - f(a)$。
  但事实根本不是这样。
  弧长根本没有微积分基本定理的类似物。
  （的确，左端的弧长取决于你从
  $bf(r)(a)$ 走到 $bf(r)(b)$ 的_方式_——直线段的路程最短，
  绕来绕去、多处绕远的路程会长得多。
  所以你不可能只凭起点和终点
  就知道你走的路线有多长。）
]

更一般地，如果参数化 $bf(r)(t) : RR -> RR^n$ 在 $RR^n$ 中描出一条路径，
且 $f : RR^n -> RR$ 是一个函数，
那么 $f$ 的*标量场线积分*定义为
$ integral_(t="起始时刻")^("终止时刻") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t. $
然而，在本课程中我们不会使用这个定义，
除了弧长对应的特殊情形 $f = 1$。

#typesig[
  曲面 $cal(S)$ 的表面积是一个标量
  （并且不依赖于曲面如何被参数化）。
  标量场线积分也是一个标量。
]

正如我在简写表（@table-shorthand）中提到的，许多其他资料会简写
$ dif s := lr(|bf(r)'(t)|) dif t. $
每当使用这种简写时，人们常常也会把起始与停止时间一并省去。
做法是：令 $cal(C)$ 表示 $bf(r)(t)$ 描出的曲线。
于是我们可以把积分简写为
$ integral_(t="起始时刻")^("终止时刻") f(bf(r)(t)) lr(|bf(r)'(t)|) dif t = integral_(cal(C)) f dif s. $
特别地，取 $f=1$，弧长公式就被简写为 $L = integral_(cal(C)) dif s$。

== [TEXT] 表面积 <sec-surface-area-explanation>

好，类似地还有表面积和标量场曲面积分。
我们使用从 @ch-psurf 中学到的参数化知识。

#definition(title: [定义：表面积])[
  如果参数化 $bf(r)(u,v) : cal(R) -> RR^3$ 在 $RR^3$ 中截出一个曲面 $cal(S)$，
  那么*表面积*由下式给出
  $ op("曲面面积")(cal(S)) := integral.double_(cal(R))
    lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
]
是的，这里出现了叉积。是的，它很讨厌（见 @sec-cross-sucks）。
这是你可能更愿意使用简写
$ dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v $
的情形之一，这样就能把表面积缩写成仅仅
$ op("曲面面积")(cal(S)) &:= integral.double_(cal(S)) dif S $
其中我们也从记号中省去了制图师地图上的区域 $cal(R)$；
改为直接写 $cal(S)$。

$lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|)$ 是从哪里来的？
理解它的方式是看 @fig-scalint-surf-cross
（它其实类似于我们在 @sec-jacobian-picture 中论证雅可比时画的图）。
如果你把区域 $cal(R)$ 想象成一张带有红色与蓝色网格线的纸，
那么 $(partial bf(r))/(partial u)$ 和 $(partial bf(r))/(partial v)$
对应于曲面 $cal(S)$ 上沿网格线的小箭头。
但早在介绍叉积时，它有一个几何定义是这样说的：

- 叉积的模长对应于曲面上由网格线围成的小"格子"的面积，
  即 @fig-scalint-surf-cross 中带阴影的部分。
  所以把它们全部加起来，就应该得到表面积！

- 叉积的方向同时垂直于
  水平与竖直网格线，所以叉积其实应该被看成
  _垂直于_曲面的。
  现在我们还不关心这一点，但它在后面的 @ch-flux 中会很重要。

#figure(
  image("figures/scalint-surf-cross.svg", width: auto),
  caption: [考虑由 $bf(r) : cal(R) -> RR^3$ 参数化的曲面 $cal(S)$。
    两个偏导数的叉积用绿色画出。
    叉积的模长对应于那一小块带阴影的面积。],
) <fig-scalint-surf-cross>


更一般地，如果有一个函数 $f : RR^3 -> RR$，我们可以把 $f$ 在 $cal(S)$ 上的
*标量场曲面积分*定义为
$integral.double_(cal(R)) f(bf(r)(u,v)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v$；
但这个定义在本课程中不会用到，
除了表面积对应的特殊情形 $f = 1$。
不过如果要用它，我们可以有一个简写 $integral.double_(cal(S)) f dif S$。

#typesig[
  标量场曲面积分（因而也包括表面积）输出一个标量。
]

== [RECIPE] 表面积（直接计算） <sec-recipe-surface-area-direct>

下面用方法（recipe）的形式给出表面积。
#recipe(title: [手工计算表面积的方法])[
  1. 用某个 $bf(r)(u,v) : cal(R) -> RR^3$ 参数化该曲面，
    其中 $cal(R)$ 是某个 2D 区域（理想情况下是像圆或矩形这样的简单区域）。
  2. 计算偏导数
    $(partial bf(r))/(partial u)$ 和 $(partial bf(r))/(partial v)$
    （它们在每个点都是三维向量）。
  3. 计算叉积 $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$。
  4. 计算模长 $lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|)$，
    即这个叉积的大小。
  5. 用任何一种二重积分的方法（如水平/竖直切片、极坐标、换元等）
    把整个式子对 $cal(R)$ 积分。
]

#tip(title: [提示：下一章我们将列出一张常用叉积表])[
  在本章中，我们将在上面的方法里手工计算叉积。
  然而，这很快就会变得很繁琐。
  所以在下一章 @ch-surfcross 中，我们实际上会把
  大多数"常见"情形的叉积全部集中在一处算好，
  以便之后查阅。
]

下面从一个相当难看的例子开始，让你练习一下球坐标。

#example(title: [例子：球面的表面积])[
  计算单位球面 $x^2+y^2+z^2=1$ 的表面积。
]
#soln[
  我们将用上述公式、借球坐标以纯粹的蛮力硬闯过这一任务。
  （我们会在后面的 @sec-surf-grad-magic 中给出更优雅的解法。）

  参数化 $bf(r)$ 由球坐标系给出：
  $ bf(r) (phi, theta) = (sin phi cos theta , sin phi sin theta , cos phi) , $
  其中区域 $cal(R)$ 的范围为
  $ 0 <= theta <= 2 pi quad "and" quad 0 <= phi <= pi $。
  因此偏导数为
  $ frac(partial bf(r), partial phi) &= chevron.l cos phi cos theta , cos phi sin theta , - sin phi chevron.r \
    frac(partial bf(r), partial theta) &= chevron.l - sin phi sin theta , sin phi cos theta , 0 chevron.r. $
  我们用蛮力算完整个叉积。
  我们有
  $ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
    &= detmat(ee_1, ee_2, ee_3;
      cos phi cos theta , cos phi sin theta , - sin phi;
      - sin phi sin theta , sin phi cos theta , 0) \
    &= (0 dot cos phi sin theta - sin phi cos theta dot (- sin phi)) bf(e_1)  \
    &quad - (0 dot cos phi cos theta - (- sin phi sin theta) dot (- sin phi) ) ee_2 \
    &quad + (sin phi cos theta dot cos phi cos theta + sin phi sin theta dot cos phi sin theta) ee_3 \
    &= (sin^2 phi cos theta) ee_1  + (sin^2 phi sin theta) ee_2
    + (sin phi cos phi sin^2 theta + sin phi cos phi cos^2 theta) ee_3 \
    &= (sin^2 phi cos theta) ee_1  + (sin^2 phi sin theta) ee_2
    + (sin phi cos phi) ee_3 $
  因为 $cos^2 theta + sin^2 theta = 1$。
  如果我们取模长，就得到
  $ lr(|frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)|)
    &= sqrt((sin^2 phi cos theta)^2 + (sin^2 phi sin theta)^2 + (sin phi cos phi)^2) \
    &= sqrt(sin^4 phi cos^2 theta + sin^4 phi sin^2 theta + sin^2 phi cos^2 phi) \
    &= sqrt(sin^4 phi (cos^2 theta + sin^2 theta) + sin^2 phi cos^2 phi) \
    &= sqrt(sin^4 phi dot 1 + sin^2 phi cos^2 phi) \
    &= sqrt(sin^2 phi (sin^2 phi + cos^2 phi)) \
    &= sqrt(sin^2 phi dot 1) = lr(|sin phi|). $
  谢天谢地，答案很简单。
  好，现在我们可以计算球面的表面积了：
  $ op("曲面面积")("球面")
    &= integral_(theta=0)^(2 pi) integral_(phi=0)^pi
      lr(|frac(partial bf(r), partial theta) times frac(partial bf(r), partial phi)|)
      dif phi dif theta \
    &= integral_(theta=0)^(2 pi) integral_(phi=0)^pi |sin phi| dif phi dif theta \
    &= (integral_(phi=0)^(pi) |sin phi| dif phi) (integral_(theta=0)^(2pi) dif theta) \
    &= (integral_(phi=0)^(pi) sin phi dif phi) (integral_(theta=0)^(2pi) dif theta) \
    &= [-cos phi]_(phi=0)^(pi) dot 2 pi \
    &= #boxed[$ 4 pi $]. #qedhere $
]

#digression(title: [关于叉积方向的题外话])[
  正如我们早先画 @fig-scalint-surf-cross 时所说的，
  一般地，如果你用 $bf(r)(u,v)$ 参数化曲面 $cal(S)$，
  那么 $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  是一个同时垂直于
  $frac(partial bf(r), partial u)$ 和 $frac(partial bf(r), partial v)$ 的向量。
  也就是说，这个叉积的方向就是
  曲面 $cal(S)$ 在 $bf(r)(u,v)$ 处切平面的法向量。

  当然，由于我们取了绝对值，在表面积中方向被丢弃了。
  但如果你观察得足够仔细，可能会注意到算出的叉积是
  $ (sin^2 phi cos theta) ee_1  + (sin^2 phi sin theta) ee_2
    + (sin phi cos phi) ee_3 = sin phi dot bf(r)(theta, phi) $
  它恰好是球面上对应点的倍数；其中的原因在于，
  对于球面，$bf(r)(theta, phi)$ 恰好垂直于切平面。
]

下面是一个计算量稍小一些的例子。
#sample[
  计算由 $z = sqrt(x^2+y^2) <= 1$ 定义的圆锥的表面积。
]
#soln[
  给定的圆锥可以用笛卡尔坐标参数化为：
  $ bf(r) (x , y) = (x , y , sqrt(x^2 + y^2)) $
  其中 $(x , y)$ 位于圆盘 $x^2 + y^2 <= 1$ 内。

  计算 $bf(r)$ 关于 $x$ 和 $y$ 的偏导数：
  $ frac(partial bf(r), partial x)
    &= lr(chevron.l (partial x) / (partial x) , (partial y) / (partial x) , (partial z) / (partial x) chevron.r)
    = lr(chevron.l 1 , 0 , x / sqrt(x^2 + y^2) chevron.r) \
    frac(partial bf(r), partial y)
    &= lr(chevron.l (partial x) / (partial y) , (partial y) / (partial y) , (partial z) / (partial y) chevron.r)
    = lr(chevron.l 0 , 1 , y / sqrt(x^2 + y^2) chevron.r). $
  因此叉积为
  $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
    &= detmat(
      ee_1, ee_2, ee_3;
      1 , 0 , x / sqrt(x^2 + y^2);
      0 , 1 , y / sqrt(x^2 + y^2)) \
    &= (0 dot y / sqrt(x^2 + y^2) - 1 dot x / sqrt(x^2 + y^2)) ee_1 - (1 dot y / sqrt(x^2 + y^2) - 0 dot x / sqrt(x^2 + y^2)) ee_2 \
    &#h(6em) + (1 dot 1 - 0 dot 0) ee_3 \
    &= lr(chevron.l - x / sqrt(x^2 + y^2) , - y / sqrt(x^2 + y^2) , 1 chevron.r) $
  现在计算这个叉积的模长：
  $ lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) &= sqrt((- x / sqrt(x^2 + y^2))^2 + (- y / sqrt(x^2 + y^2))^2 + 1^2) \
    &= sqrt((x^2) / (x^2 + y^2) + (y^2) / (x^2 + y^2) + 1) = sqrt(2). $
  这真的很方便：我们得到了一个常数！因此
  $ op("曲面面积")("圆锥") = integral.double_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("面积")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. #qedhere $
]

== [EXER] 习题

#exer[
  考虑由参数化 $bf(r) : RR^2 -> RR^3$ 给出的曲面 $cal(S)$，其定义为
  $ bf(r)(u,v) = chevron.l u-v, u+v, u v chevron.r $
  对 $RR^2$ 中所有的 $(u,v)$ 成立。
  求 $cal(S)$ 在点 $(3, 7, 10)$ 处的切平面。
] <exer-surf-tangent>

/*
#exerstar[
  设 $cal(S)$ 是半径为 $1$ 的单位球面，$A$ 是它上面的一个点。
  计算长度 $P A$ 在所有球面上的点 $P$ 上的平均值。
  （平均值定义为标量场曲面积分
  $1/(op("曲面面积")(cal(S))) integral.double_(cal(S)) |P A| dif S$。）
] <exer-sphere-avg-distance>
*/
