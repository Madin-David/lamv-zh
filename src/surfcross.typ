#import "@local/evan-zh:1.0.0":*

= 常见曲面的预计算叉积 <ch-surfcross>

_TL;DR_：叉积太烦人了，所以我们把它们全部预先算好。

== [TEXT] 叉积的预计算公式

正如上一章的例子所示，
手工计算叉积实际上非常烦人。
因此，如果我们把某些常见情形下叉积的结果预先算好，
就不必每次需要时都重新手算一遍，这能让我们的日子轻松很多。

在这份讲义中，我们将预计算五种不同的叉积：

- 任意 _图像_，即形如 $z = f(x,y)$ 的曲面（我们讨论过的圆锥就是一个很好的例子）。
- 任意等值面 $g(x,y,z) = c$，在某个 $x y$ 区域上。
- $x y$ 平面中的平坦曲面（也可以平行于 $y z$ 或 $z x$）。
- 沿 $z$-轴为中心、半径为 $R$ 的圆柱的弯曲部分，
  其中参数是 $theta$ 与 $z$。
- 以原点为中心、半径为 $R$ 的球面，
  其中参数是 $phi$ 与 $theta$。

事实证明，在 18.02 中，这很可能就是你会遇到的_仅有的_五种情形。

展示结果的表格是 @table-surfcross-1。
注意，对于表面积，你只需要叉积的_绝对值_（第四列）。
但我会把整个向量也一并列出，
因为稍后我们需要在 @ch-flux 中重新使用这张表
（在那里会把它重新整理成 @table-surfcross-2）。
到那时，我们实际上还需要知道向量所指的方向，
而不只是绝对值。

#figure(
  table(
    columns: 4,
    align: center + horizon,
    table.header([曲面], [参数],
      [$ frac(partial bf(r), partial u) times frac(partial bf(r), partial v) $],
      [$ lr(|frac(partial bf(r), partial u) times frac(partial bf(r), partial v)|) dif u dif v $],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$ lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r) $],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y$],
    [等值面 $g(x,y,z) = c$ \ 在 $x y$ 区域上 ],
      [$(x,y)$],
      [$ (nabla g) / (partial g slash partial z) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
    [平坦曲面 $z=c$],
      [$(x,y)$],
      [$ lr(chevron.l 0, 0, 1 chevron.r) $],
      [$dif x dif y$],
    [固定 $R$ 的柱坐标 \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$ chevron.l R cos theta, R sin theta, 0 chevron.r $],
      [$R dif theta dif z$],
    [固定 $R$ 的球坐标 \
      $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$ R sin phi dot bf(r)(phi, theta) $],
      [$R^2 sin phi dif phi dif theta$ \ （若 $0 <= phi <= pi$）],
  ),
  caption: [五种最常见情形下叉积的预计算公式，
    它们很可能就是你所需要的一切。],
  kind: table
) <table-surfcross-1>

回想先前 @fig-psurf-mesh 中的几何想法，
当时我们描述了叉积的来源：
#idea[
  向量 $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  在每个点处都垂直于曲面的切平面。
]
这对记住 @table-surfcross-1 的第三列有很大帮助。
例如：

- 对于等值面 $g(x,y,z) = c$，
  你应该记得 @ch-grad 中的结论：$nabla g$ 垂直于等值面的切平面，
  因此叉积是 $nabla g$ 的倍数，正如所需要的那样。
- 圆柱（的弯曲部分）的法向量笔直地背离 $z$-轴、
  背离原点，而 $chevron.l R cos theta, R sin theta, 0 chevron.r$ 确实如此。
- 对于球面，法向量应当笔直地背离球心，
  而 $sin(phi) dot bf(r)(phi, theta)$ 确实是该方向的倍数。

再次重申：对于表面积，你实际上只需要第四列
$lr(|frac(partial bf(r), partial u) times frac(partial bf(r), partial v)|)$，但是

- 我认为 $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$
  实际上比起
  $lr(|frac(partial bf(r), partial u) times frac(partial bf(r), partial v)|)$
  更容易记住，
  因为上面那个几何解释；
- 从 @ch-flux 开始，你将需要第三列中
  $frac(partial bf(r), partial u) times frac(partial bf(r), partial v)$ 的完整信息。

上面 @table-surfcross-1 的第一行与第二行非常通用，
所以在这些讲义中我把它们称为“魔法”公式，因为它们为我们省下了大量工作。
相比之下，其余各行则用于更特殊的情形。

== [TEXT] @table-surfcross-1 第 1 行：对于图像（形如 $z = f(x,y)$ 的曲面）

那么，设你的曲面由 $z = f(x,y)$ 给出，其中 $f$ 定义在
$x y$ 平面中的某个区域 $cal(R)$ 上（例如圆锥有 $cal(R) = {x^2+y^2<=1}$）。
（例如我们刚算过的圆锥是 $f(x,y) = sqrt(x^2+y^2)$）
我们要做的是，把叉积那些刻板的计算
浓缩成一个我们直接记住的单一公式，这样就不必每次重算叉积。

我们预期使用的参数化是
$ bf(r)(x,y) = vec(x, y, f(x,y)). $
偏导数是
$ frac(partial bf(r), partial x)
  &= vec((partial x) / (partial x) , (partial y) / (partial x) , (partial z) / (partial x))
  = vec(1 , 0 , (partial z) / (partial x) ) \
  frac(partial bf(r), partial y)
  &= vec((partial x) / (partial y) , (partial y) / (partial y) , (partial z) / (partial y))
  = vec(0 , 1 , (partial z) / (partial y)). $
因此，在这种情形下我们得到
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  &= detmat(ee_1, ee_2, ee_3;
    1 , 0 , (partial z) / (partial x);
    0 , 1 , (partial z) / (partial y)) \
  &= - (partial z) / (partial x) ee_1  - (partial z) / (partial y) ee_2 + ee_3 \
  &= - (partial f) / (partial x) ee_1  - (partial f) / (partial y) ee_2 + ee_3. $

现在把它写下来。

#memo(title: [记住：图像的魔法叉积公式 $z = f(x,y)$])[
  考虑由 $z = f(x,y)$ 给出的曲面，其中 $f$ 可微。
  那么对于显然的参数化 $bf(r)(x,y) = (x,y,f(x,y))$，我们有
  $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r). $
]

特别地，表面积变为
$ op("曲面面积")(cal(S)) = integral.double_(cal(R)) sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) dif x dif y. $
你会在很多其他教科书里看到这个公式，它值得记住
（我会说，你应该记住完整的魔法叉积公式，
因为从它得到模长是轻而易举的）。
让我们看看它如何能囊括圆锥例子中的刻板计算。

#sample[
  计算由 $z = sqrt(x^2+y^2) <= 1$ 定义的圆锥的表面积。
]
#soln[
  令 $f(x,y) = sqrt(x^2+y^2)$，这次我们直接跳到
  $ (partial f) / (partial x) &= x/(sqrt(x^2+y^2)) \
    (partial f) / (partial y) &= y/(sqrt(x^2+y^2)). $
  由此我们得到了先前找到的向量 $chevron.l -x/(sqrt(x^2+y^2)), -y/(sqrt(x^2+y^2)), 1 chevron.r$ 的一个捷径。
  我们用同样的方式求它的模长：
  $ sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)
  = sqrt(1 + (x^2) / (x^2 + y^2) + (y^2) / (x^2 + y^2)) = sqrt(2). $
  现在
  $ op("曲面面积")("圆锥") = integral.double_(x^2+y^2 <= 1) sqrt(2) dif A = sqrt(2) op("面积")(x^2+y^2 <= 1) = #boxed[$sqrt(2) pi $]. #qedhere $
]

== [TEXT] @table-surfcross-1 第 2 行：对于等值面 $g(x,y,z) = c$ <sec-surf-grad-magic>

然而，在很多情形下，利用隐式微分我们可以得到更好的公式。
基本想法是，我们更愿意把圆锥看成 $x^2+y^2-z^2 = 0$，
这样就不必去想平方根。
而这恰好就是一个等值面。

所以改而考虑_等值面_ $g(x,y,z) = c$，
其中区域 $cal(R)$ 中的每个 $(x,y)$ 都恰好对应一个 $z = z(x,y)$ 的值。
在纸面上，你想象解出 $z$ 关于 $x$ 与 $y$ 的表达式，然后使用
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  = - (partial z) / (partial x) ee_1  - (partial z) / (partial y) ee_2 + ee_3 $
但我们希望不必用这种蛮力的方式解出 $z$。

技巧在于考虑 $g$ 的梯度并使用链式法则。
你可能记得
$ nabla g = lr(chevron.l (partial g) / (partial x), (partial g) / (partial y), (partial g) / (partial z) chevron.r) $
通常很容易计算。
然而，如果我们对
$ g(x,y,z) = c $
关于 $x$ 与 $y$ 求偏导数，那么 $c$ 的导数为零，而链式法则给出
$ 0 = (partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)
  ==> (partial g) / (partial x) = - (partial g) / (partial z) dot (partial z) / (partial x). $
类似地
$(partial g) / (partial y) = - (partial g) / (partial z) dot (partial z) / (partial y)$。
因此
$ nabla g = lr(chevron.l -(partial g) / (partial z) dot (partial z) / (partial x),
  -(partial g) / (partial z) dot (partial z) / (partial y), (partial g) / (partial z)  chevron.r)
  = (partial g) / (partial z) dot lr(chevron.l -(partial z) / (partial x), -(partial z) / (partial y), 1 chevron.r). $

#digression(title: [题外话：关于链式法则])[
  你可能会被这里的负号吓到，
  我当初也是这样，因为如果你只看那些分式，这个表达式看起来是错的。
  这就是为什么我不喜欢把链式法则只记成“把分式约掉”，
  因为在某些语境下你会得到像这样看起来并不正确的等式。

  这里要记住的背景是，$z = z(x,y)$ 本身是 $x$ 与 $y$ 的函数，
  它始终维持着 $g(x,y,z(x,y)) = c$ 这一要求；
  也就是说，如果 $x$ 有微小变化，$z = z(x,y)$ 应当以“相反”的方式变化，
  以保证 $g = c$ 仍然成立。

  这个变化应该有多大？
  最容易的办法或许是通过两次应用线性近似来推理。
  若 $epsilon$ 是某个微小位移，那么线性近似说的是
  $ g(x + epsilon, y, z(x + epsilon, y))
    &approx g(x + epsilon, y, z(x, y) + (partial z) / (partial x) dot epsilon) \
    &approx g(x,y,z(x,y)) + nabla g dot vec(epsilon, 0, (partial z) / (partial x) dot epsilon) \
    &= g(x,y,z(x,y))
      + [(partial g) / (partial x) + (partial g) / (partial z) dot (partial z) / (partial x)] epsilon. $
  因此我们希望括号中 $epsilon$ 的系数为零，
  而这正是我们先前得到的那个方程。
]

这里发生了一件非常好的事情，因为我们想要的叉积就出现在右端！
正因为如此，我们得以导出下面这个奇妙的恒等式。
#memo(title: [记住：等值面的魔法叉积公式])[
  设 $g$ 可微，并考虑等值面 $g(x,y,z) = c$。
  设 $cal(S)$ 是该等值面中由某个函数 $z=f(x,y)$ 隐式描述的一部分，
  并假设在 $cal(R)$ 上 $(partial g) / (partial z) != 0$。
  那么对于显然的参数化 $bf(r)(x,y) = (x,y,f(x,y))$，我们有
    $ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
    = (nabla g) / (partial g slash partial z). $
]
这个魔法恒等式更好的原因是，无需对 $f$ 求导，
甚至无需确定它。
让我们用圆锥的例子重做一遍，看看它如何发挥作用。
#sample[
  计算由 $z = sqrt(x^2+y^2) <= 1$ 定义的圆锥的表面积。
]
#soln[
  圆锥是 $g(x,y,z) = x^2+y^2-z^2$ 的等值面中 $z >= 0$ 的那部分。
  （我们其实知道 $f(x,y) = sqrt(x^2+y^2)$，但我们不会用到这一点。）
  现在我们直接跳到
  $ (nabla g) / ((partial g) / (partial z)) = lr(chevron.l 2x, 2y, -2z chevron.r) / (-2z)
    = lr(chevron.l -x/z, -y/z, 1 chevron.r). $
  这个向量的模长是
  $ sqrt((-x/z)^2 + (-y/z)^2 + 1) = sqrt((x^2+y^2)/z^2 + 1) = sqrt(2) $
  于是我们得到
  $ op("曲面面积")("圆锥") = integral.double_(x^2+y^2 <= 1) sqrt(2) dif A
    = sqrt(2) op("面积")({x^2+y^2 <= 1}) = #boxed[$sqrt(2) pi $]. #qedhere $
]
如果你把这与 $z = sqrt(x^2+y^2)$ 仔细比较，
你会发现这_仍然_是第一个魔法公式给出的同一个答案，
而这又_仍然_与我们真正徒手计算时得到的答案相同。
但捷径的好处在于，它意味着你完全不必考虑叉积。

现在，如我们所承诺的，让我们展示如何求球面的表面积，
而不必在球坐标的痛苦中艰难跋涉。
#sample[
  计算球面 $x^2+y^2+z^2 = 1$ 的表面积。
]
#soln[
  我们先求 $z >= 0$ 的半球面的表面积，然后把它乘二。
  我们可以把半球面看成 $z = f(x,y) = sqrt(1 - (x^2+y^2))$，
  但为了避开平方根，我们更乐于令
  $ g(x,y,z) = x^2+y^2+z^2 $
  并把半球面看成等值面中 $z >= 0$ 且 $x^2+y^2 <= 1$ 的那一块。
  在那种情形下，
  $ (nabla g) / (partial g slash partial z) = lr(chevron.l 2x, 2y, 2z chevron.r) / (2z)
    = lr(chevron.l x/z, y/z, 1 chevron.r). $
  这次向量的模长是
  $ sqrt((x/z)^2 + (y/z)^2 + 1) = sqrt((x^2+y^2+z^2) / z^2) = 1/z = 1/sqrt(1-(x^2+y^2)). $
  因此，我们需要积分
  $ op("曲面面积")("半球") = integral.double_(x^2+y^2<=1) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
  不出所料，我们用极坐标把它变成
  $ op("曲面面积")("半球")
    &= integral_(theta=0)^(2pi) integral_(r=0)^1 1/(sqrt(1-r^2)) (r dif r dif theta) \
    &= (integral_(theta=0)^(2pi) dif theta) (integral_(r=0)^1 r/(sqrt(1-r^2)) dif r). $
  左边的积分是 $2pi$。
  对于内层积分，使用 $u$-代换 $u=1-r^2 ==> (dif u) / (dif r) = -2r$，得到
  $ integral_(r=0)^1 r/(sqrt(1-r^2)) dif r
    = integral_(u=1)^0 -1/2 u^(-1/2) dif u
    = integral_(u=0)^1 1/2 u^(-1/2) dif u
    = [u^(1/2)]_(u=0)^1 = 1. $
  因此
  $ op("曲面面积")("半球") = 2 pi dot 1 = 2 pi $
  而球面的表面积因此是 $2 pi dot 2 = #boxed[$ 4 pi $]$。
]

== [TEXT] @table-surfcross-1 第 3 行：对于平坦曲面

这是 $z = f(x,y)$ 中当 $f(x,y) = c$ 为常数时极其简单的特殊情形。
你的参数化就是 $ bf(r)(x,y) = chevron.l x,y,c chevron.r. $

我犹豫过是否要包含这一行，因为它太简单了，而且只是第一行的特殊情形，
但它足够常见，所以我决定不妨把它加进来。
然而，你应该即使在睡梦中也能毫无困难地自行推导出来；它就是
$ (partial bf(r)) / (partial x) &= chevron.l 1, 0, 0 chevron.r \
  (partial bf(r)) / (partial y) &= chevron.l 0, 1, 0 chevron.r $
而它们的叉积是 $chevron.l 0,0,1 chevron.r$，就这样。

注意，你可能会遇到平行于 $x z$ 或 $y z$ 平面的平坦曲面，
在这种情况下，你只需交换各变量的角色。

== [TEXT] @table-surfcross-1 第 4 行：对于柱坐标中圆柱的弯曲部分

如果你有一个与 $z$-轴对齐的圆柱，
那么你不会想用 $x y$ 平面作为参数，
因为大多数点对 $(x,y)$ 根本用不到。
因此，我们改用柱坐标
$ bf(r)(theta, z) = (R cos theta, R sin theta, z). $
计算偏导数：
$ frac(partial bf(r), partial theta) &= chevron.l - R sin theta, R cos theta, 0 chevron.r \
  frac(partial bf(r), partial z) &= chevron.l 0,0,1 chevron.r. $
在这种情形下叉积相当容易计算：
$ frac(partial bf(r), partial theta) times frac(partial bf(r), partial z)
  &= detmat(
    ee_1, ee_2, ee_3;
    -R sin theta, R cos theta, 0;
    0, 0, 1
  ) \
  &= R cos theta ee_1 + R sin theta ee_2 \
  &= chevron.l R cos theta, R sin theta, 0 chevron.r. $
这还不算太糟！
我们可以取它的绝对值：$ dif S = R dif theta dif z. $

#tip(title: [提示：圆柱的 $dif S$ 可以从几何上记住])[
  记住它的方式是“$dif S dif r approx dif V$”：
  把一小块曲面乘以一小段径向分量，
  你就得到球体的一小块体积。
  而由于我们在 @ch-triple 中看到 $dif V = r dif r dif theta dif z$，
  $dif S$ 的公式就是约去 $dif r$ 并令 $r = R$ 所得到的结果。

  或者，圆柱上的每一小块都可以看成
  一个高为 $dif z$、宽为 $R dif theta$ 的小矩形。
]

== [TEXT] @table-surfcross-1 第 5 行：对于球面的弯曲部分，在球坐标中

我们已经看到，球面其实可以用我们关于等值面的魔法公式处理，
所以如果你愿意使用 $x y$ 坐标，那就万事俱备了。
尽管如此，万一你需要球坐标，这里是结果。

我们在用蛮力计算球面表面积时其实已经算过它了：
如果我们取参数化
$ bf(r) (phi, theta) = (R sin phi cos theta , R sin phi sin theta , R cos phi) , $
那么重复 @sec-recipe-surface-area-direct 中的蛮力计算，
再额外乘上一个 $R$，我们就得到
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  &= (R^2 sin^2 phi cos theta) ee_1  + (R^2 sin^2 phi sin theta) ee_2
  + (R^2 sin phi cos phi) ee_3. $
这个公式可能看起来很难看，直到你意识到它其实只是
$ frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)
  = R sin phi dot bf(r)(phi, theta). $
由于 $|bf(r)(phi, theta)| = R$，我们得到
$ dif S := lr(|frac(partial bf(r), partial phi) times frac(partial bf(r), partial theta)|) d phi d theta
  = R^2 sin phi dif phi dif theta. $
这里我省略了 $sin phi$ 外面的绝对值符号，因为
我们的球坐标约定要求 $0 <= phi <= pi$。

#tip(title: [提示：球面的 $dif S$ 可以从几何上记住])[
  记住它的方式是“$dif S dif rho approx dif V$”：
  把一小块曲面乘以一小段径向分量，
  你就得到球体的一小块体积。
  而由于我们在 @ch-sph 中看到 $dif V = rho^2 sin phi dif rho dif phi dif theta$，
  $dif S$ 的公式就是约去 $dif rho$ 并令 $rho = R$ 所得到的结果。
]

== [RECIPE] 表面积回顾

既然我们有了 @table-surfcross-1，现在来写一个新的求表面积的方法。

#recipe(title: [用 @table-surfcross-1 升级后的表面积方法])[
  要计算曲面 $cal(S)$ 的表面积：

  1. 按照下面的清单，求出参数化 $bf(r)$ 的叉积
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$。
    - 如果你用 $(x,y)$ 坐标来参数化
      （意味着 $cal(S)$ 是图像 $z=f(x,y)$ 或等值面），
      使用 @table-surfcross-1 第 1 行或第 2 行的魔法公式。
    - 对于平坦曲面，它很简单（@table-surfcross-1 第 3 行）。
    - 如果 $cal(S)$ 具体由固定半径的柱坐标/球坐标给出，
      使用 @table-surfcross-1 第 4 行或第 5 行。
    - 否则，手工计算叉积：
      - 选取曲面 $cal(S)$ 的一个参数化 $bf(r)(u,v) : cal(R) -> RR^3$。
        有点像 @sec-flex-param 中那样，你在如何设定参数化上有一定的自由度。
      - 计算 $(partial bf(r))/(partial u)$ 与 $(partial bf(r))/(partial v)$
        （两者在每一点处都是三维向量）。
      - 按 @ch-cross 中的方式计算叉积 $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$。
  2. 取叉积的模长，得到曲面上每一点处的一个数值。
  3. 用任何二重积分的方法把它在 $cal(R)$ 上积分
    （例如水平/竖直切片、极坐标、换元等）。
]

== [EXER] 习题

#exer[
  计算由 $z = x^2+y^2 <= 1$ 定义的曲面的表面积。
] <exer-surface-area-paraboloid>

#exer[阿基米德帽盒定理][
  设 $-1 < a < b < 1$ 为实数。
  考虑单位球面 $x^2 + y^2 + z^2 = 1$ 与圆柱面 $x^2 + y^2 = 1$。
  证明它们（侧）面积中
  位于 $z=a$ 与 $z=b$ 之间的部分面积相等。
  见 @fig-surfcross-archimedes。
] <exer-archimedes>

#figure(
  image("figures/surfcross-archimedes.svg", width: auto),
  caption: [
    用于 @exer-archimedes 的图。
    证明两块蓝色侧面的面积相等。
  ],
) <fig-surfcross-archimedes>
