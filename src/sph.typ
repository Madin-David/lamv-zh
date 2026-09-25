#import "@local/evan-zh:1.0.0":*

= 球坐标 <ch-sph>

除了柱坐标（cylindrical coordinates）之外，我们还会用到另一个坐标系，
称为球坐标（spherical coordinates）。
本章将定义它，并说明如何使用它。

#warning(title: [警告：有_八_种互相竞争的标准，请以你的教材为准])[
  注意，存在互相竞争的约定！
  对我们来说，这些字母名称的含义将是
  $
    rho &:= "到 " (0,0,0) " 的距离" &quad& "（拼作 rho，读音近似 row）" \
    phi &:= "从 " z " 轴向下量" &quad& "（拼作 phi，读音近似 fee）" \
    theta &:= "与极坐标中相同" quad&& "（拼作 theta，读音近似 thay-tah）"
  $
  并且我们按这个顺序书写它们。
  然而，取决于你用的教材：
  - $theta$ 和 $phi$ 的名称可能互换。
    （另请注意，在不同的字体中，希腊字母 $phi$ 可能写作 $phi.alt$。
    如果你用 LaTeX，它们分别是 `\varphi` 和 `\phi`。）
  - $theta$ 和 $phi$ 的顺序可能互换（无论名称是否也随之改变）。
  - $rho$ 可能被替换为 $r$。
]

== [TEXT] 球坐标的定义

球坐标背后的想法是：点 $P$ 在 $x y$-平面上的投影
会具有极坐标 $(r cos theta, r sin theta, 0)$，其中 $r$ 为某个值。
但接下来我们不用 $z$ 把该点竖直抬起，
而是通过某个角度 $phi$ 旋转，得到一个新的距离 $rho$，使得
$r = rho sin phi$
后文中我们将用它来替换所有的 $r$。
见下方 @fig-triple-spherical。
#figure(
  image("figures/sph-def.svg", width: auto),
  caption: [球坐标的示意图。],
) <fig-triple-spherical>

由于这个直角三角形以 $phi$ 为角、以 $rho$ 为斜边、
以 $r$ 和 $z$ 为两条直角边，我们有
$ r &= rho sin phi \
  z &= rho cos phi. $
把一切展开以消去所有的 $r$，
过渡映射 $(rho, phi, theta) |-> (x,y,z)$ 由下式给出
$
  x &= underbrace(rho sin phi, =r) cos theta \
  y &= underbrace(rho sin phi, =r) sin theta \
  z &= rho cos phi.
$
正如我需要更简洁时会用 $(r, theta)_"pol"$ 来表示极坐标那样，
这里我们也有类似的简写：
#definition(title: [球坐标的定义])[
  我们如下定义球坐标
  $ (rho, phi, theta)_"sph" := (rho sin phi cos theta, rho sin phi sin theta, rho cos phi). $
]
现在，为了对它做积分，应该存在一个带某个雅可比的换元。
为了得到面积缩放因子，我们要计算雅可比
$
  det J_("球坐标") = detmat(
    (partial x) / (partial rho), (partial x) / (partial phi), (partial x) / (partial theta);
    (partial y) / (partial rho), (partial y) / (partial phi), (partial y) / (partial theta);
    (partial z) / (partial rho), (partial z) / (partial phi), (partial z) / (partial theta);
  ).
$
这要费一番功夫，
所以你可能一辈子只该算一次，然后把结果记住。
计算结果为
$
  det J_("球坐标")
  &=
  detmat(
    sin phi cos theta, rho cos phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho cos phi sin theta, rho sin phi cos theta;
    cos phi, - rho sin phi, 0
  ) \
  &=
  cos phi
  detmat( rho cos phi cos theta, - rho sin phi sin theta;
    rho cos phi sin theta, rho sin phi cos theta;)
  + rho sin phi
  detmat(
    sin phi cos theta, - rho sin phi sin theta;
    sin phi sin theta, rho sin phi cos theta;
  ) \
  &=
  cos phi (rho^2 cos phi sin phi) (cos^2 theta + sin^2 theta)
  + rho^2 sin phi (sin^2 phi) (cos^2 theta + sin^2 theta) \
  &= rho^2 sin phi (cos^2 phi + sin^2 phi) \
  &= rho^2 sin phi.
$
我在讨论课上试着做这个计算，结果卡在了黑板前；
这不是我擅长的事情。
你绝不想在考试时重做这个计算，所以记住结果就好。
#memo(title: [记住：球坐标的缩放因子])[
  $ dif V := dif x dif y dif z = rho^2 sin phi dif rho dif phi dif theta. $
]

== [TEXT] $phi$ 的取值范围

在讨论球坐标的取值范围之前，
让我回顾一下极坐标作为对照。

=== 极坐标的取值范围

在极坐标（或柱坐标）中，当我们考虑
$ (r, theta)_"pol" = (r cos theta, r sin theta), $
时，通常选择约定
#eqn[
  $ r >= 0 quad "and" quad 0 <= theta < 2 pi. $
  <eqn-polar-bounds>
]
我想强调的是，为 $theta$ 选择区间是经过一番思考的：
我们使用长度为 $2 pi$ 的区间，是因为
如果你选取大于 $2 pi$ 的 $theta$ 值，
那么这个点就会"绕回"到你已经知道的某个点；例如
$ (r, 2.7 pi )_"pol" = (r, 0.7 pi)_"pol" $
表示同一个点。
更一般地，
$ (r, theta + 2 pi)_"pol" = (r, theta)_"pol". $

这就是我们采用约定 @eqn-polar-bounds 的原因。
当我们定义一个坐标系 $(r, theta)_"pol"$ 时，
我们希望确保每个 $(x,y)$ 点都由_恰好_一对坐标给出。
也就是说，每个点都应有坐标，
但不同的坐标应指向不同的点。

因此，为了避免用相同的坐标重复表示同一个点，通常的约定是
选取 $0 <= theta < 2 pi$，不过约定 $-pi < theta <= pi$ 也完全可行，
任何长度为 $2 pi$ 的区间也都可行。

#digression(title: [关于 $r = 0$ 的题外话])[
  说 @eqn-polar-bounds 完美对应，其实是个善意的谎言：
  $x y$-坐标中的原点 $(0,0)$ 可以由 $(0, theta)_"pol"$
  对每个 $theta$ 值表示。
  所以 @eqn-polar-bounds 几乎是对的，只有一个特例 $r = 0$ 除外，
  此时 $theta$ 是不确定的。
  我们会把这件事遮掩过去，不去想它。
]

=== 球坐标的取值范围

让我们回到球坐标
$ (rho, phi, theta)_"sph" := (rho sin phi cos theta, rho sin phi sin theta, rho cos phi). $
我们想为 $(rho, phi, theta)$ 的取值选择一种约定，使得
（除了少数我们将忽略的退化情形之外）
每个点都恰好只有一组坐标。
我们将采用的选取是：
#memo(title: [记住：球坐标取值的约定])[
  当我们想为球坐标指定取值范围
  以避免重复表示点时，我们将选择如下约定：
  #eqn[
    $
      rho &>= 0 \
      0 &<= phi <= pi \
      0 &<= theta < 2 pi \
    $
    <eqn-sph-ranges>
  ]
]
也就是说，我断言这样取值 @eqn-sph-ranges
能保证每个点都由 $(rho, phi, theta)_"sph"$ 恰好表示一次，
只有少数例外#footnote[
  如果你想知道，例外正好就是 $z$-轴，
  在它上面 $theta$ 可以任意取。
  其他每个点都只应出现一次。
]
是我们忽略的。

$theta$ 从 $0$ 变到 $2 pi$ 与极坐标中相同。
然而，$phi$ 的角度范围可能会让你意外；
在各种论坛上常见的一个问题是：
#question[
  为什么 $phi$ 只在 $0$ 到 $pi$ 之间取值？
  如果 $-pi < phi < 0$ 或 $pi < phi < 2 pi$ 会发生什么？
]

好，如果我对 @eqn-sph-ranges 的断言成立，
那意味着如果我把一个"非法"的 $phi$ 值
代入公式，就应该得到一个已经被表示过的点。
这有点像 $(r, theta + 2 pi)_"pol" = (r, theta)_"pol"$，
只是公式更复杂一些。
所以我们将完整地说明两种情形，展示如何把非法的值转换成合法的值。

=== 情形一：大于 $pi$ 的非法角度

在这种情况下，我断言下面的等式成立：
#eqn[
  $ (rho, phi + pi, theta)_"sph" = (rho, pi - phi, theta pm pi)_"sph". $
  <eqn-sph-phi-too-big>
]
这里 $theta pm pi$ 的符号是任意的，
它的选取使得 $0 <= theta pm pi < 2 pi$ 是合法的取值。

#figure(
  image("figures/sph-phi-too-big.svg", width: auto),
  caption: [
    用图示说明 @eqn-sph-phi-too-big。
  ],
) <fig-sph-phi-too-big>

下面给出两种验证 @eqn-sph-phi-too-big 成立的方法。

/ 代数证明（较简单）:
  我们需要验证两边的 $x$、$y$、$z$ 坐标都相同：
  $
    rho sin (phi+pi) cos theta &= rho sin (pi-phi) cos (theta pm pi) \
    rho sin (phi+pi) sin theta &= rho sin (pi-phi) sin (theta pm pi) \
    rho cos (phi+pi) &= rho cos (pi-phi).
  $
  但 $sin(phi+pi) = -sin(pi-phi)$、$cos(theta pm pi) = -cos theta$、
  $sin(theta pm pi) = -sin(theta)$，且 $cos(phi+pi) = cos(pi-phi)$，
  所以所有等式都成立。

/ 几何证明（信息更多）:
  看图 @fig-sph-phi-too-big。
  当角度取"非法"值 $phi + pi$ 时，
  红色箭头最终会一直穿过 $O$。
  因此，新点在蓝色极坐标圆上的投影
  最终是对径点 $(r, theta pm pi)_"pol"$，而不是 $(r, theta)_"pol"$。
  如果我们接着考虑从 $+z$ 轴到棕色半径 $rho$ 的夹角，
  它反而变成了角 $pi - phi$。
  这幅图从几何上说明了 @eqn-sph-phi-too-big 为什么成立。

=== 情形二：小于零的非法角度

这次，我改为断言下面的等式：
#eqn[
  $ (rho, -phi, theta)_"sph" = (rho, phi, theta pm pi)_"sph". $
  <eqn-sph-phi-neg>
]
这其实比上一种情形更容易看出。

#figure(
  image("figures/sph-phi-neg.svg", width: auto),
  caption: [
    用图示说明 @eqn-sph-phi-neg。
  ],
) <fig-sph-phi-neg>

/ 代数证明（较简单）:
  我们需要验证两边的 $x$、$y$、$z$ 坐标都相同：
  $
    rho sin(-phi) cos theta &= rho sin phi cos (theta pm pi) \
    rho sin(-phi) sin theta &= rho sin phi sin (theta pm pi) \
    rho cos (-phi) &= rho cos phi.
  $
  但 $sin(-phi) = -sin(phi)$、$cos(theta pm pi) = -cos theta$、
  $sin(theta pm pi) = -sin(theta)$，且 $cos(-phi) = cos phi$，
  所以所有等式都成立。

/ 几何证明（信息更多）:
  看图 @fig-sph-phi-neg。
  这次发生的一切只是关于由 $z$-轴与直线 $O P$ 所确定的平面
  作镜像。

== [TEXT] 使用球坐标的例子

这里有两个千篇一律的用法：球心在原点，
我们直接在整个球上积分
（即取 $0 <= rho <= R$、$0 <= phi <= pi$ 和 $0 <= theta <= 2 pi$）。

#sample[
  考虑一个半径为 $R$ 的实心球。计算它的体积。
]
#soln[
  把球 $cal(T)$ 的球心放在原点：
  $ op("体积")(cal(T)) &= integral.triple_(cal(T)) 1 dif V
  = integral.triple_(cal(T)) rho^2 sin phi dif rho dif phi dif theta  \
  &= integral_(rho=0)^R integral_(phi=0)^(pi) integral_(theta=0)^(2 pi) rho^2 sin phi dif theta dif phi dif rho \
  &= (integral_(rho=0)^R rho^2 dif rho) (integral_(phi=0)^(pi) sin phi dif phi) (integral_(theta=0)^(2 pi) dif theta) \
  &= R^3/3 dot 2 dot (2 pi) = #boxed[$ 4/3 pi R^3 $]. #qedhere $
]

#sample[
  考虑一个半径为 $1$ 的实心球。
  遍历球内的所有点 $P$，
  计算从 $P$ 到球心的距离的平均值。
]
这里，函数 $f$ 在实心区域 $cal(T)$ 上的"平均"值
定义为 $1/(op("体积")(cal(T))) integral.triple_(cal(T)) f dif V$。

#soln[
  正如我们刚才看到的，这个球的体积是 $4/3 pi$。
  与之前所做唯一的不同是，我们不再对 $1 dif V$ 积分，
  而是把 $1$ 换成了距离：
  $ integral.triple_(cal(T)) ("到 " (0,0,0) " 的距离") dif V
    &= integral.triple_(cal(T)) rho dif V
    = integral.triple_(cal(T)) rho dot (rho^2 sin phi dif rho dif phi dif theta)  \
    &= integral_(rho=0)^1 integral_(phi=0)^(pi) integral_(theta=0)^(2 pi) rho^3 sin phi dif theta dif phi dif rho \
    &= (integral_(rho=0)^1 rho^3 dif rho) (integral_(phi=0)^(pi) sin phi dif phi) (integral_(theta=0)^(2 pi) dif theta) \
    &= 1/4 dot 2 dot (2 pi) = pi. $
  所以平均值为
  $ (integral.triple_(cal(T)) ("到 " (0,0,0) " 的距离") dif V) / (op("体积")(cal(T)))
  = (pi) / (4/3 pi) = #boxed[$ 3/4 $]. #qedhere $
]

== [TEXT] 著名例子：偏心球 <sec-offset-sphere>

回顾 @sec-offset-circle 中的著名例子，我们证明了在极坐标中
可以画出经过原点的圆；
我们称之为"偏心圆"。
这里有一个三维的类似物，即偏心球，
其中球坐落在 $x y$-平面上。
实际上它基本上一模一样。

#sample[
  设 $cal(T)$ 表示球心在 $(0,0,1)$、半径为 $1$ 的实心球。
  用球坐标表示区域 $cal(T)$。
]

#figure(
  [
    #image("figures/polar-offset.svg", width: auto)
    #image("figures/sph-offset.svg", width: auto)
  ],
  caption: [
    图中画出了 @fig-polar-offset 中 $(x-1)^2 + y^2 <= 1$ 的草图，
    以及它的三维版本：
    实心球 $x^2 + y^2 + (z-1)^2 <= 1$，
    即球心在 $(0,0,1)$ 的单位球，
    它位于 $x y$-平面上方，并在 $(0,0,0)$ 处与该平面相切。
    它对应于 $rho <= 2 cos phi$。
  ],
) <fig-sph-offset>


#soln[
  与 @sec-offset-circle 中一样，
  我们既可以用代数方法，也可以用几何方法。

  / 几何方法:
    见图 @fig-sph-offset。
    球的所有点都位于半空间 $z >= 0$ 中，
    这被描述为要求 $0 <= phi <= pi/2$。
    由旋转对称性，$theta$ 的取值无关紧要，
    可以是 $0$ 到 $2 pi$ 之间的任意值。
    所以我们需要弄清楚 $rho$ 与 $phi$ 的关系。

    设 $O = (0,0,0)$，$A = (0,0,2)$。
    设 $P$ 是球面上的一个点。
    与之前一样，我们有
    $ angle P = 90 degree, quad O A = 2, quad "and" angle A O P = phi. $
    所以球面就是那些满足 $rho = 2 cos phi$ 的点。
    相应地，球_内部_的点满足 $0 <= rho <= 2 cos phi$。

  / 代数方法:
    该球的 $x y z$ 坐标为
    $ x^2 + y^2 + (z-1)^2 <= 1. $
    回顾球坐标变换：
    $ x = rho sin phi cos theta \, quad y = rho sin phi sin theta \, quad z = rho cos phi . $
    把它们代入球的方程：
    $ (rho sin phi cos theta)^2 + (rho sin phi sin theta)^2 + (rho cos phi - 1)^2 <= 1 . $
    展开并化简：
    $ 1 &>= rho^2 sin^2 phi cos^2 theta + rho^2 sin^2 phi sin^2 theta + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi (cos^2 theta + sin^2 theta) + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi + (rho cos phi - 1)^2 \
      &= rho^2 sin^2 phi + rho^2 cos^2 phi - 2 rho cos phi + 1 \
      &= rho^2 (sin^2 phi + cos^2 phi) - 2 rho cos phi + 1 \
      &= rho^2 - 2 rho cos phi + 1. $
    移项整理，这给出
    $ 0 &>= rho^2 - 2 rho cos phi = rho(rho  - 2 cos phi) \
      <==> 0 &<= rho <= 2 cos phi. $
    特别地，这要求 $cos phi >= 0$，即 $phi <= pi/2$。

  总之，答案是：$cal(T)$ 在球坐标中恰好是
  $ #boxed[$ 0 <= theta < 2 pi " 与 " 0 <= phi <= pi/2 " 与 " rho <= 2 cos phi $]. #qedhere $
]

三维中类似的著名习题：
#sample[
  设 $cal(T)$ 表示球心在 $(0,0,1)$、半径为 $1$ 的实心球。
  计算 $ integral.triple_(cal(T)) sqrt(x^2+y^2+z^2) dif x dif y dif z. $
]
#soln[
  和之前一样，如果我们试图用 $x y z$ 积分，那将是一场灾难，
  但球坐标很好用，因为
  $ rho = sqrt(x^2 + y^2 + z^2). $
  我们刚才看到，$cal(T)$ 在球坐标中由下式给出：
  $0 <= phi <= pi/2$、$0 <= theta < 2pi$、$0 <= rho <= 2 cos phi$。
  因此，该积分变为：
  $ integral.triple_(cal(T)) rho dif V
    &= integral.triple_(cal(T)) rho^3 sin phi dif rho dif phi dif theta \
    &= integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) integral_(rho=0)^(2 cos phi)
      rho^3 sin phi dif rho dif phi dif theta \
    &= integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2)
      sin phi [rho^4 / 4]_(rho=0)^(2 cos phi) dif phi dif theta \
    &= integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2)
      sin phi dot (4 cos^4 phi) dif phi dif theta \
    &= 4 integral_(theta=0)^(2 pi) [ -1/5 cos^5 phi]_(phi=0)^(pi / 2) dif theta \
    &= 4 integral_(theta=0)^(2 pi) 1/5 dif theta \
    &= #boxed[$ (8pi) / 5 $]. #qedhere $
]

== [TEXT] 球坐标用于引力 <sec-sph-gravity>

让我们回到引力的公式，其分量由下式给出
$
  G_1 &:= G m integral.triple_(cal(T)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_2 &:= G m integral.triple_(cal(T)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
  G_3 &:= G m integral.triple_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
$

上一节我没有做任何例子，因为当你遇到 $(x^2+y^2+z^2)^(3/2)$ 时
使用 $x y z$ 坐标实在太烦人了。
然而，在球坐标中，这些方程变得容易处理得多。
例如，$G_3$ 的公式为：
#eqn[
  $ G_3 &= G m integral.triple_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    &= G m integral.triple_(cal(T)) ((rho cos phi) delta(x,y,z))/(rho^3) (rho^2 sin phi dif rho dif phi dif theta) \
    &= G m integral.triple_(cal(T)) delta(x,y,z) sin phi cos phi dif rho dif phi dif theta. $
  <eqn-sph-G3>
]
让我们用偏心球来看看它的实际应用。

#sample[
  设 $cal(T)$ 是一个半径为 $1$、密度恒为单位密度的金属球，
  $P$ 是其表面上一个质量为 $m$ 的点。
  计算作用在点 $P$ 上的引力的大小。
]

#soln[
  我们再次使用偏心球：我们选取坐标使 $P = (0,0,0)$
  （所以原点是点 $P$，而_不是_ $cal(T)$ 的球心）。
  $cal(T)$ 的球心则位于 $(0,0,1)$。
  于是由对称性，我们有 $G_1 = G_2 = 0$；在把密度设为 $1$ 后，
  @eqn-sph-G3 直接给出
  $ G_3 = G m integral.triple_(cal(T)) sin phi cos phi dif rho dif phi dif theta $

  然后我们可以代入偏心球的积分上下限：
  $ G_3
    &= G m integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) integral_(rho=0)^(2 cos phi)
    sin phi cos phi dif rho dif phi dif theta \
    &= G m integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) (2 cos phi) dot
    sin phi cos phi dif phi dif theta \
    &= 2 G m integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) cos^2 phi sin phi dif phi dif theta \
    &= 2 G m integral_(theta=0)^(2 pi)
    lr([-1/3 cos^3 phi])_(phi = 0)^(pi/2) dif theta \
    &= 2 G m integral_(theta = 0)^(2 pi) 1/3 dif theta \
    &= (4 pi G m) / 3.
  $
  换言之，在我们选取的坐标系中，引力由下式给出
  $ bf(G) = lr(chevron.l 0, 0, (4 pi G m)/3 chevron.r). $
  其大小为 $|bf(G)| = #boxed[$ (4 pi G m) / 3 $]. $
]

== [EXER] 习题

#exer[
  考虑一个半径为 $1$ 的实心球，以及一条过其球心的直线 $ell$。
  遍历球内的所有点 $P$，
  计算从 $P$ 到 $ell$ 的距离的平均值。
  （平均值定义为
  $1/(op("体积")(cal(T))) integral.triple_(cal(T)) d(P) dif V$，
  其中 $d(P)$ 是 $P$ 到 $ell$ 的距离。）
] <exer-sphere-line-distance>

#exer[
  设 $cal(T)$ 是一个半径为 $1$、密度恒为单位密度的实心金属半球，
  $P$ 是半球底面圆心处一个质量为 $m$ 的点。
  计算作用在点 $P$ 上的引力的大小。
] <exer-sphere-gravity>
