#import "@local/evan-zh:1.0.0":*

= 通量 <ch-flux>

现在我们讨论（3D）通量，这是我们尚未见过的最后一种向量场积分。
它是海报 @poster-stokes 中我们尚未接触的最后一格。

#figure(
  box(image("figures/flux-cut.svg", width: auto), stroke: 1pt),
  caption: [海报 @poster-stokes 中圈出的曲面的通量积分。],
)

本章会让你相当想起 @ch-work。
我们首先给出通过参数曲面的通量的"直接计算"定义。
它可用，但相当笨重，所以在下一章 @ch-divthm 中
我们会立刻设法找捷径。
对于 18.02，你可以使用的方法有

- 直接参数化计算（本章讲解）
  - 即使在这里，魔法公式也能为你省下大量工作 --- 见 @table-surfcross-2。
- 捷径：转化为曲面积分（在 @sec-flux-to-surf 中讲解）
- 捷径：散度定理，即转化为 3D 体积分（在下一章 @ch-divthm 中讲解）

== [TEXT] 用直接参数化定义通量

#definition(title: [通量的定义])[
  设 $bf(r)(u,v) : cal(R) -> RR^3$ 参数化 $RR^3$ 中的一张定向曲面 $cal(S)$。
  向量场 $bf(F) : RR^3 -> RR^3$ 通过 $cal(S)$ 的通量定义为
  $ integral.double_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
]
（我们将在下一节解释"定向"是什么意思。）
#typesig[
  通量需要两个输入：一张_定向曲面_ $cal(S)$
  与一个_向量场_ $bf(F)$。
]

是的，那个可怕的叉积又出现了。
自然，人们有简写让它更容易下咽：这一次用的是
$ integral.double_(cal(S)) bf(F) dot dif bf(S) = integral.double_(cal(S)) bf(F) dot bf(n) dif S $
来把一切扫到地毯下面。
也就是说，$dif bf(S)$ 与 $bf(n) dif S$ 都是更长表达式
$(partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$ 的简写。
在本书中我们通常更偏爱 $bf(n) dif S$。

我在曲面积那一章（@ch-scalint）就向你保证过，总有一天
你会需要完整的叉积而不只是它的模长，现在就是那个时候！
事实上，绝对值消失某种意义上是一种_改进_：我会说
$lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r)$
比 $sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2)$ 更不凌乱。

我们马上就会做例题计算，但请先让我谈谈如何看待它，
并解释"定向"这个形容词的含义。

== [TEXT] 通量的水力学解释

请翻回 @fig-work-dot 看一眼。
当初我们讨论功积分
$bf(F)(bf(r)(t)) dot bf(r)'(t)$ 时，
我让你把功想象成把力向量与切向量的点积相加。

这里的解释与 2D 通量类似。
你应当把曲面 $cal(S)$ 想象成水中的某种薄膜；
那么通量度量的就是水穿过它的速率。

为了让这幅图完整，我需要向你介绍定向。
回想一下，当初做积分时，
曲线 $cal(C)$ 并不只是一堆点；
我们还必须告诉你哪个点是"起点"、哪个点是"终点"。
换言之，功积分作用在带有_方向_的曲线上。

曲面上的通量积分也有类似的情形：
除了实际的点之外，
我们还需要指定一个_定向_。
更确切地说，在曲面 $cal(S)$ 的每一点 $P$ 处，
由参数化得到的叉积可以指向两个相反方向之一。

#figure(
  image("figures/flux-cross-sign.svg", width: auto),
  caption: [前面提到的法向量及其取负的结果。
    注意当我们交换 $u$ 与 $v$ 时，
    该向量会向另一边翻转到负方向。
    因此在对曲面参数化时，$u$ 与 $v$ 的次序在曲面上诱导出一个定向。
  ],
) <fig-flux-cross-sign>

#definition(title: [给曲面定向的定义])[
  给曲面 $cal(S)$ _定向_，就是在每一点指定
  你希望参数化的叉积指向哪一边。
]

在代数上，这对应选择 _$u$ 与 $v$ 的次序_；
因为如果你交换这两个参数的次序，整个叉积就会变号：
$ (partial bf(r))/(partial u) times (partial bf(r))/(partial v)
  = - ((partial bf(r))/(partial v) times (partial bf(r))/(partial u)). $
因此通量也会变号。
这个符号问题令人迷失方向，因为功并没有这个问题，
那里"从起点到终点"相当容易理解；我们马上会给出更多例子。

回到我们新的通量积分，我们需要把点积可视化
$ integral.double_(cal(R)) bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v. $
$bf(F)$ 仍然是力向量，
而正如我们前面所说，
向量 $ (partial bf(r))/(partial u) times (partial bf(r))/(partial v) $
代表每一点处曲面的法向量。
我们在 @fig-flux-in-field 中画出了它。

#figure(
  image("figures/flux-in-field.svg", width: auto),
  caption: [
    一张置于向量场 $bf(F)$ 中的参数曲面的图像。
    在每一点，我们取该点处向量场 $bf(F)$（此处画成黑色）
    与曲面上一个法向量的点积，该法向量由我们为曲面积
    考虑过的同一个叉积给出（此处画成绿色）。
    通量可以看作整个曲面上所有点积之和。
  ],
) <fig-flux-in-field>

@fig-flux-in-field 中的点积应当与你的水力学直觉相符。
对于我们的定向曲面，当力沿着与法向量相同的方向运动时，点积就大。
这与我们对水流穿透曲面的描述相符。
另一方面，如果力大体平行于曲面运动，
那么点积乃至通量都接近于零。

== [TEXT] 关于定向的更多说明

这里再给一个定向的例子，让事情不那么抽象。

#example(title: [例：给球面定向])[
  我们来考虑球面 $x^2 + y^2 + z^2 = 1$ 上 $z > 0$ 的部分。
  对于球面上的每一点 $P$，球面在 $P$ 处的法向量
  要么笔直指向球心，要么背向球心。

  这在代数上对应什么？
  我们考虑两种只差次序的参数化球面的方式。

  - 设想我们对这个半球使用球坐标参数化
    $ bf(r)(phi, theta) = (sin phi cos theta, sin phi sin theta, cos phi) $
    其中 $0 <= phi <= pi/2$ 且 $0 <= theta <= 2 pi$。
    如果我们把叉积硬算出来，你会发现
    （完整的写出见 @ch-surfcross）
    $ (partial bf(r)) / (partial phi) times (partial bf(r)) / (partial theta)
      = sin phi dot (sin phi cos theta, sin phi sin theta, cos phi)
      = sin phi dot bf(r)(phi, theta). $
    在球面的每一点 $P = bf(r)(phi, theta) = (sin phi cos theta, sin phi sin theta, cos phi)$
    处，它指向外侧（因为 $sin phi >= 0$），
    所以这将是一个所有叉积都指向外侧的球面参数化。

  - 但如果我们把 $phi$ 与 $theta$ 的次序交换了呢？
    也就是说，假设我们改用
    $ bf(r)(theta, phi) = (sin phi cos theta, sin phi sin theta, cos phi) $
    其中改为 $0 <= theta <= 2 pi$ 且 $0 <= phi <= pi/2$。
    那么叉积会变号：
    $ (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial phi)
      = -sin phi dot (sin phi cos theta, sin phi sin theta, cos phi)
      = -sin phi dot bf(r)(phi, theta). $
    而现在在每一点，叉积都指向球面内部了！

  那么这两种定向哪一个"正确"？这正是需要约定俗成的原因。
  就像我们在 2D 中计算圆上的功积分或通量积分时一样，
  我们必须说"逆时针"或"顺时针"。
  对这个球面，我们必须说"向外"或"向内"之类的话，
  这样计算通量积分的人才知道该往哪个方向取叉积。
]

一般来说，对于向内与向外有明显含义的曲面，
约定的做法通常是"向外"。
但并非所有曲面都有明显的向内与向外之分
（例如由 $z = 0$ 给出的 $x y$ 平面），
在这些情况下，考试题目应当告诉你该题要使用哪一个。

#digression(title: [题外话：与 2D 通量的比较])[
  在 2D 通量中，即使对不闭的曲线 $cal(C)$，我们也有"外侧"与"内侧"的概念，
  因为我们有 $90 degree$ 顺时针与 $90 degree$ 逆时针的概念。
  遗憾的是，在 3D 空间中我们没有这个概念，这就是我们转而求助于法向量的原因。
]


== [TEXT] 叉积的魔法公式（重现）

_TL;DR_：叉积太烦人了，所以我们把它们全部预先算好。

在 @ch-surfcross 中我给了你 @table-surfcross-1，它让你在计算曲面积时
跳过叉积这一步，它在这里依然有效。
但我其实要重写这张表，把它与简写 $bf(n) dif S$ 联系起来。
事实上，人们常把简写 $bf(n) dif S$ 拆成两部分：
$bf(n)$ 是沿叉积_方向_的单位向量，
而 $dif S$ 代表那个绝对值再乘上 $dif u dif v$。
用符号表示就是
$ bf(n) := frac((partial bf(r))/(partial u) times (partial bf(r))/(partial v),
  lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|))
  quad " 与 " quad
  dif S := lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v. $
（所以 $bf(n) dif S$ 确实就是完整的叉积，因为两个绝对值因子相互抵消了。）

人们这样拆分的原因，是为了让几何图像更容易思考。
回想 @ch-cross 中的内容：叉积带有两部分信息：
一个_方向_（用来给出两个直角）与一个_模长_（用来解释面积）。
拆分这个简写的用意，就是让它们分别对应
$bf(n)$ 与 $dif S$。

就个人而言，我看不出这样分解信息有什么意义，
因为你实际计算时反正需要整个叉积。
但很多人这么做。
所以应众人的要求，
这里给出 @table-surfcross-1 的一个把各成分拆开的版本。
我认为这种拆分其实只对第四、五行有帮助，
因为在 @ch-surfcross 中，我们已经描述了用几何方式记住
圆柱与球面的 $dif S$ 的办法。
（对圆柱，$dif S approx (dif V) / (dif r)$；
对球面，$dif S approx (dif V) / (dif rho)$。）
至于第一、二行，你只要记住第五列就行了。

#figure(
  table(
    columns: 5,
    align: center + horizon,
    table.header([曲面],
      [参数],
      [$bf(n)$（单位向量）],
      [$dif S$],
      [$bf(n) dif S \ = (partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$],
    ),
    [$z = f(x,y)$],
      [$(x,y)$],
      [$frac(
        lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r),
        sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2))$],
      [$sqrt(1 + ((partial f) / (partial x))^2 + ((partial f) / (partial y))^2) \ dif x dif y$],
      [$lr(chevron.l - (partial f) / (partial x), - (partial f) / (partial y), 1 chevron.r) \ dif x dif y$],
    [等值面\ $g(x,y,z) = c$ \ 在 $x y$ 区域上 ],
      [$(x,y)$],
      [$ pm (nabla g) / (|nabla g|) $],
      [$ (|nabla g|) / (|partial g slash partial z|) dif x dif y $],
      [$ (nabla g) / (partial g slash partial z) dif x dif y $],
    [平面 $z = c$],
      [$(x,y)$],
      [$ chevron.l 0,0,1 chevron.r $],
      [$ dif x dif y $],
      [$ chevron.l 0,0,1 chevron.r dif x dif y $],
    [固定 $R$ 的柱坐标 \ $bf(r)(theta, z) = (R cos theta, R sin theta, z)$],
      [$(theta, z)$],
      [$chevron.l cos theta, sin theta, 0 chevron.r$],
      [$R dif theta dif z$],
      [$chevron.l R cos theta, R sin theta, 0 chevron.r \ dif theta dif z$],
    [固定 $R$ 的球坐标 \ $bf(r)(phi, theta) = (R sin phi cos theta, \ quad R sin phi sin theta, R cos phi)$],
      [$(phi, theta)$],
      [$1/R dot bf(r)(phi, theta)$\ （若 $0 <= phi <= pi$）],
      [$R^2 sin phi dif phi dif theta$ \ （若 $0 <= phi <= pi$）],
      [$R sin phi dot bf(r)(phi, theta) \ dif phi dif theta$],
  ),
  caption: [@table-surfcross-1 的一个改写版本，
    用 $bf(n)$ 与 $dif S$ 记号写成。
    我个人认为它不够优雅，你应该直接用原来的
    @table-surfcross-1，
    但两张表是一样的，所以用哪一张都没关系。],
  kind: table
) <table-surfcross-2>

再次强调，当你真的直接动手计算通量时，*你只需要第五列*。
而如果你因为其他原因_确实_需要第三、第四列，
它们反正可以立刻从第五列推出来。
所以第三、四列的用处仅仅在于，它们可能让
圆柱与球面的公式更容易记住或在概念上更直观。
但在实际计算中它们是多余的。

== [RECIPE] 用直接参数化计算通量积分的方法 <sec-recipe-flux-param>

现在我们回到方法的格式。

#recipe(title: [用直接参数化计算通量积分的方法])[
  计算 $bf(F)$ 通过曲面 $cal(S)$ 的通量：

  1. 按下面的清单，为参数化 $bf(r)$ 求出叉积
    $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$。
    - 如果你用 $(x,y)$ 坐标来参数化
      （即 $cal(S)$ 是 $z=f(x,y)$ 或等值面），
      使用 @table-surfcross-2 第 1 行或第 2 行的魔法公式。
    - 对于平面，这很简单（@table-surfcross-2 第 3 行）。
    - 如果 $cal(S)$ 恰好由固定半径的柱坐标/球坐标给出，
      使用 @table-surfcross-2 第 4 行或第 5 行。
    - 否则，手动计算叉积：
      - 选取曲面 $cal(S)$ 的一个参数化 $bf(r)(u,v) : cal(R) -> RR^3$。
        有点像 @sec-flex-param 中那样，你在如何设定参数化上有一些自由度。
      - 计算 $(partial bf(r))/(partial u)$ 与 $(partial bf(r))/(partial v)$
        （每一点处它们都是三维向量）。
      - 像 @ch-cross 中那样计算叉积 $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$。
  2. 看叉积指向哪一边。
    它是否指向你想要的方向？
    如果不是，就在继续之前把整个叉积取负
    （等价地，交换 $u$ 与 $v$ 的次序）。
  3. 计算点积 $ bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)). $
    这给出参数化区域 $cal(R)$ 上每一点处的数值。
  4. 用任何二重积分的方法（如水平/竖直切片、极坐标、换元等）
    把整个式子对 $cal(R)$ 积分。
]

我们为 @table-surfcross-2 的每一行各给一个例子。

#sample[
  考虑由 $z = x^3 + y^3$ 定义的曲面 $cal(S)$，其中
  $0 <= x <= 1$ 且 $0 <= y <= 1$，其法向量向上定向
  （即 $z$ 分量为正）。
  设 $bf(F)(x,y,z) = vec(1 , 1 , z)$。
  计算 $bf(F)$ 通过 $cal(S)$ 的通量。
]
#soln[
  按定义，曲面 $cal(S)$ 的参数化为
  $ bf(r)(x,y) = (x, y, x^3+y^3) $
  其中 $0 <= x <= 1$ 且 $0 <= y <= 1$。
  因此，我们对 $f(x,y) = x^3+y^3$ 使用 @table-surfcross-2 的第一行。
  计算偏导数
  $ (partial f) / (partial x) = 3 x^2, quad (partial f) / (partial y) = 3 y^2. $
  然后利用 @table-surfcross-2 的第一行，我们得到
  每一点处的叉积为
  $ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
    = vec(- 3 x^2 , - 3 y^2 , 1). $

  此时我们必须检查这个叉积是否指向题目指定的方向，
  还是需要把一切取负，改而考虑
  $(partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec(3 x^2 , 3 y^2 , -1)$ 作为替代。
  题目要求法向量向上定向，而由于 $1$ 为正，
  我们原先得到的那个就可以了；我们使用
  $ bf(n) dif S = vec(- 3 x^2 , - 3 y^2, 1) dif x dif y. $

  现在，向量场在每一点 $(x,y)$ 处由下式给出
  $ bf(F)(bf(r)(x,y)) = vec(1 , 1 , x^3 + y^3). $
  于是我们可以计算点积
  $ bf(F) dot ((partial bf(r)) / (partial x) times (partial bf(r)) / (partial y))
    &= (1) (- 3 x^2) + (1) (- 3 y^2) + (x^3 + y^3) (1) \
    &= - 3 x^2 - 3 y^2 + x^3 + y^3. $
  因此所求通量由下式给出
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    = integral_(x=0)^1 integral_(y=0)^1 (- 3 x^2 - 3 y^2 + x^3 + y^3) dif y dif x $
  它很容易求值：
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    &= integral_(x=0)^1 integral_(y=0)^1 (x^3 - 3 x^2 + y^3 - 3 y^2) dif y dif x \
    &= integral_(x=0)^1 (integral_(y=0)^1 (x^3 - 3 x^2) dif x) dif y + integral_(y=0)^1 (integral_(x=0)^1 (y^3 - 3 y^2) dif y) dif x \
    &= integral_(x=0)^1 (x^3 - 3 x^2 dif x) + integral_(y=0)^1 (y^3 - 3 y^2 dif y) \
    &= [x^4 / 4 - x^3]_(x=0)^1 + [y^4 / 4 - y^3]_(y=0)^1 \
    &= - 3/4 - 3/4 = #boxed[$ -3/2 $]. #qedhere $
]

#sample[
  考虑由
  $x^2 + y^2 + z^2 = 25$ 定义的球面的上半球，其单位法向量_向下_朝向 $x y$ 平面定向。
  计算向量场
  $bf(F) = vec(y z , x z , 0)$ 通过该曲面的通量。
]

#soln[
  我们对 $cal(S)$ 的参数化将是
  $ bf(r)(x,y) = chevron.l x, y, sqrt(25-(x^2+y^2)) chevron.r $
  在整个 $x^2 + y^2 <= 25$ 上。
  如果我们想用表 @table-surfcross-2 的第一行，
  就该取 $f(x,y) = sqrt(25 - (x^2+y^2))$。
  然而平方根很烦人，所以我们改用第二行，
  把这个半球看作等值面
  $ g(x,y,z) = x^2+y^2+z^2 $ 在取值 $25$ 处的一块。
  由于 $nabla g = chevron.l 2x, 2y, 2z chevron.r$ 且 $(partial g) / (partial z) = 2z$，我们的表给出
  $ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
    = (nabla g) / ((partial g) / (partial z))
    = (chevron.l 2x, 2y, 2z chevron.r)/(2z)
    = vec( x/z, y/z, 1 ). $
  这里 $z = sqrt(25-(x^2+y^2))$。

  此时我们必须检查这个叉积是否指向题目指定的方向，
  还是需要把一切取负，考虑
  $(partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec( -x/z, -y/z, -1 )$ 作为替代。
  这次题目指定法向量应当_向下_指，
  即朝向 $x y$ 平面。
  所以我们最好用取负的那个：
  $ bf(n) dif S = (partial bf(r)) / (partial y) times (partial bf(r)) / (partial x) = vec( -x/z, -y/z, -1 ) dif x dif y. $

  与此同时，参数化中每一点处的力由下式给出
  $ bf(F)(bf(r))(x,y) = vec(y z, x z, 0). $
  于是点积为
  $ bf(F) dot ((partial bf(r)) / (partial y) times (partial bf(r)) / (partial x)) =
    y z dot (-x/z) + x z dot (-y/z) + 0 dot (-1) = - 2 x y. $
  因此我们要求的通量是
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S = integral.double_(x^2+y^2 <= 25) - 2 x y dif x dif y. $

  但请注意被积函数 $- 2 x y$ 关于 $x$ 与 $y$ 都是奇函数。
  由于区域 $x^2+y^2 <= 25$ 关于两条坐标轴都对称，
  我们甚至不必麻烦地换成极坐标；
  可以直接推出 $ integral.double_(x^2+y^2 <= 25) - 2 x y dif x dif y = #boxed[$ 0 $]. #qedhere $
]

#sample[
  考虑平面 $x = 3$，其法向量沿 $-x$ 方向定向，
  以及向量场 $bf(F) = chevron.l e^x, e^y, e^z chevron.r$。
  计算 $bf(F)$ 通过该平面中 $y^2 + z^2 <= 25$ 部分的通量。
]

#soln[
  令 $cal(S)$ 为上述平面所构成的曲面。
  我们用变量 $y$ 与 $z$ 参数化；
  $ bf(r)(y,z) = (3, y, z) $
  在整个 $y^2 + z^2 <= 25$ 上。

  这个叉积就是 @table-surfcross-2 的第三行（最简单的一行）；你直接得到
  $ (partial bf(r)) / (partial y) times (partial bf(r)) / (partial z) = vec(1, 0, 0). $

  在继续之前，我们同样要检查法向量是否指向正确的一边，
  还是应当取负，改用
  $(partial bf(r)) / (partial z) times (partial bf(r)) / (partial y) = vec(-1, 0, 0)$ 作为替代。
  题目要的是 $-x$ 方向，所以确实，这里我们取取负的那个：
  $ bf(n) dif S = (partial bf(r)) / (partial z) times (partial bf(r)) / (partial y) = vec(-1, 0, 0). $

  与此同时，每一点处的力向量就是
  $ bf(F)(bf(r)(y,z)) = vec(e^3, e^y, e^z). $
  于是点积为
  $ bf(F) dot ((partial bf(r)) / (partial z) times (partial bf(r)) / (partial y))
    = vec(e^3, e^y, e^z) dot vec(-1, 0, 0) = -e^3. $
  因此，我们要求的通量是
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    &= integral.double_(y^2 + z^2 <= 25) -e^3 dif y dif z \
    &= -e^3 dot op("面积")(y^2 + z^2 <= 25) = #boxed[$ -25 pi e^3 $]. #qedhere $
]

#sample[
  设 $cal(S)$ 为柱面 $x^2 + y^2 = 49$ 中 $0 <= z <= 10$ 的部分，
  其法向量向外定向。
  计算 $bf(F) = vec(3x, 5y, e^z)$ 通过 $cal(S)$ 的通量。
]

#soln[
  用柱坐标把它参数化是很自然的做法：
  $ bf(r)(theta, z) = chevron.l 7 cos theta, 7 sin theta, z chevron.r $
  其中 $0 <= theta <= 2pi$ 且 $0 <= z <= 10$。
  由于这是柱面，我们用 @table-surfcross-2 的第四行得到
  $ (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z)
    = vec(7 cos theta, 7 sin theta, 0). $

  和之前一样，我们停下来看看这是否指向正确的一边，还是需要改用
  $(partial bf(r)) / (partial z) times (partial bf(r)) / (partial theta)
    = vec(-7 cos theta, -7 sin theta, 0)$。
  题目指定法向量向外定向，
  所以我们用前者：
  $ bf(n) dif S = (partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z)
    = vec(7 cos theta, 7 sin theta, 0) dif theta dif z. $

  与此同时，每一点处的力由下式给出
  $ bf(F)(bf(r)(theta, z)) = vec(7 dot 3 cos theta, 7 dot 5 sin theta, e^z). $
  于是，点积 $bf(F) dot bf(n)$ 为：
  $ bf(F) dot ((partial bf(r)) / (partial theta) times (partial bf(r)) / (partial z))
    &= vec(7 dot 3 cos theta , 7 dot 5 sin theta , e^z) dot vec(7 cos theta , 7 sin theta , 0) \
    &= 49(3 cos^2 theta + 5 sin^2 theta). $
  因此，我们要求的通量是
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    &=  integral_(theta=0)^(2 pi) integral_(z=0)^(10) (21 cos^2 theta + 35 sin^2 theta) dot 7 dif z dif theta \
    &= integral_(theta=0)^(2 pi) 490 (3 cos^2 theta + 5 sin^2 theta) dif theta \
    &= 490 integral_(theta=0)^(2 pi) (3 cos^2 theta + 5 sin^2 theta) dif theta. $
  回想一下：
  $ integral_(theta=0)^(2 pi) cos^2 theta dif theta = integral_(theta=0)^(2 pi) sin^2 theta dif theta = pi $
  这是利用 $cos^2 theta = (1 + cos(2 theta)) / 2$ 与 $sin^2 theta = (1 - cos(2 theta)) / 2$ 得到的。
  因此，
  $ 490 integral_(theta=0)^(2 pi) (3 cos^2 theta + 5 sin^2 theta) dif theta
    = 490 dot (3 pi + 5 pi) = #boxed[$ 3920 pi $]. #qedhere $
]

对于最后一个例子，我们实际上再次使用同一个半球，
但这次改用球坐标，好让你比较两种方法。
（在我看来，这更丑，但有些人就是偏爱球坐标。）
#sample[
  考虑由
  $x^2 + y^2 + z^2 = 25$ 定义的球面的上半球，其单位法向量_向下_朝向 $x y$ 平面定向。
  计算向量场
  $bf(F) = vec(y z , x z , 0)$ 通过该曲面的通量。
]

#soln[
  我们用球坐标参数化，写成
  $ bf(r)(phi, theta) = (5 sin phi cos theta, 5 sin phi sin theta, 5 cos phi) $
  其中 $0 <= phi <= pi/2$ 且 $0 <= theta <= 2 pi$。
  在那种情况下，根据 @table-surfcross-2，叉积为
  $ ((partial bf(r))/(partial phi)) times ((partial bf(r))/(partial theta))
    = 5 sin phi dot bf(r)(phi, theta). $
  由于 $sin phi >= 0$，它背离球面，所以我们交换次序：
  $ ((partial bf(r))/(partial theta)) times ((partial bf(r))/(partial phi))
    = -5 sin phi dot bf(r)(phi, theta). $
  与此同时，我们有
  $ bf(F)(bf(r)(phi, theta))
    = vec(25 sin phi cos phi sin theta, 25 sin phi cos phi cos theta, 0) $
  如果把整个点积展开，我们现在得到
  $ bf(F) dot (((partial bf(r))/(partial theta)) times ((partial bf(r))/(partial phi)))
      &= (25 sin phi cos phi sin theta) dot (-5 sin phi) dot (5 sin phi cos theta) \
      &quad + (25 sin phi cos phi cos theta) dot (-5 sin phi) dot (5 sin phi sin theta) \
      &= -1250 (sin^3 phi cos phi sin theta cos theta). $
  换言之，我们有
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    &= -1250 integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) sin^3 phi cos phi sin theta cos theta dif phi dif theta \
    &= -1250
      (integral_(theta=0)^(2 pi) sin theta cos theta dif theta)
      (integral_(phi=0)^(pi/2) sin^3 phi cos phi dif phi). $
  后一个积分求值极其烦人，
  但前一个积分为零，因为 $sin theta cos theta = 1/2 sin(2theta)$，
  所以我们完全不必担心那个 $dif phi$ 积分；我们直接得到 $#boxed[$ 0 $]$
  作为答案。
]

== [TEXT] 另一个技巧：当 $bf(F) dot bf(n)$ 为常数时写成曲面积 <sec-flux-to-surf>

我们再给一个避开叉积的技巧，它只在某些情况下有效，
但当它有效时，会让你的日子轻松很多。
设 $cal(S)$ 是由 $bf(r) : cal(R) -> RR^3$ 参数化的一张曲面，
并且一如既往，令 $bf(n)$ 表示
沿 $((partial r)/(partial u) times (partial r)/(partial v))$ 方向的单位向量。

我们用展开写法与简写两种方式来比较通量与曲面积。

- 用展开写法，我们有
  $ op("曲面面积")(cal(S)) &= integral.double_(cal(R)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v \
    "通量" &= integral.double_(cal(R)) bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v
    = integral.double_(cal(R)) (bf(F) dot bf(n)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|)  dif u dif v. $
  （这里要注意类型安全：绝对值是一个数，
  而 $dot$ 是 $RR^3$ 中向量的点积。）
  我们对通量所做的，是把叉积
  $((partial bf(r))/(partial u) times (partial bf(r))/(partial v))$ 分解为 $bf(n)$ 乘以它的模长，
  我们可以这样做（一般而言，_任何_向量 $bf(w)$ 都等于 $|bf(w)|$ 乘以其方向单位向量）。
  这样你就能让通量看起来更像曲面积一点。
- 用简写，这一点更加明显：
  $ "通量" &= integral.double_(cal(S)) (bf(F) dot bf(n)) dif S quad " 与 " quad
    op("曲面面积")(cal(S)) &= integral.double_(cal(S)) dif S. $

然而，这种相似性大多没什么用，_除非_在一种非常特殊的情况下：
恰好 $bf(F) dot bf(n)$ 在曲面上的每一点都恒等于同一个常数 $c$。
如果你真有那么幸运，那么这种相似性就真的可以利用：
$ "通量" = integral.double_(cal(R)) c dot lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v
  = c integral.double_(cal(R)) lr(|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)|) dif u dif v
  = c dot op("曲面面积")(cal(S)). $
那么只要你知道 $cal(S)$ 的曲面积，就_完全_不需要做任何积分。
你只需把曲面积乘以 $c$。

再次强调，这个特定的技巧极其特殊。
只有当 $bf(F)$ 与 $cal(S)$
被精心挑选、使得 $bf(F) dot bf(n)$ 为常数时才会出现，
而且如果你随手写下一个"随机"的向量场 $bf(F)$，
这绝无可能靠运气发生。
然而，尽管这一技巧如此脆弱，
它在某些作业题和考试题中仍然很受欢迎，因为完全不需要计算。
下面给出两个关于球面的例子。

#sample[
  令 $cal(S)$ 表示半径为 $17$ 的球面 $x^2+y^2+z^2=17^2=289$。
  令 $bf(F) = vec(x,y,z)$。
  计算通量 $ integral.double_(cal(S)) bf(F) dot bf(n) dif S. $
  （把 $cal(S)$ 向外定向。）
]
#soln[
  球面上任一点 $(x,y,z)$ 处的法向量 $bf(n)$
  是沿 $chevron.l x,y,z chevron.r$ 方向的单位向量。
  很方便的是，力向量 $bf(F)$ 是同一方向上模长为 $17$ 的向量！
  也就是说，$ bf(F) dot bf(n) = (17 bf(n)) dot (bf(n)) = 17. $
  因此，
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S = 17 op("曲面面积")(cal(S)) = 17 dot (4 dot 289)pi = #boxed[$ 4 dot 17^3 pi $]. $
  （一般而言，我们知道半径为 $R$ 的球面面积为 $4 R^2 pi$。）
]

#sample[
  令 $cal(S)$ 表示半径为 $17$ 的球面 $x^2+y^2+z^2=17^2=289$。
  令 $bf(G)$ 为位于原点的点质量 $m$ 所施加的引力。
  计算通量 $ integral.double_(cal(S)) bf(G) dot bf(n) dif S. $
  （把 $cal(S)$ 向外定向。）
]
#soln[
  这与上一个例子几乎一样，只是施加的引力
  $bf(G)$ 模长为 $(G m) / 17^2$，且指向与 $bf(n)$ _相反_的方向。
  也就是说，$ bf(G) dot bf(n) = (-((G m) / (17^2)) bf(n)) dot (bf(n)) = -(G m) / 289. $
  因此，
  $ integral.double_(cal(S)) bf(G) dot bf(n) dif S = -(G m) / 289 dot op("曲面面积")(cal(S))
    = (-G m)/(17^2) dot (4 dot 17^2 pi) = #boxed[$ -4 pi G m $]. $
  （一般而言，我们知道半径为 $R$ 的球面面积为 $4 R^2 pi$。）
]
注意答案与半径无关！$17$ 被消掉了。

== [EXER] 习题

#exer[
  计算向量场
  $ bf(F)(x,y,z) = lr(chevron.l x/3, y/4, 1/5 chevron.r) $
  通过由
  $ x^3 + y^4 = e^z, quad 0 <= x <= 5, quad 0 <= y <= 5 $
  定义的曲面部分的通量，
  其中法向量向上定向。
] <exer-flux-xy-ez>
