#import "@local/evan-zh:1.0.0":*

= 三重积分 <ch-triple>

现在我们要考虑三个变量而非两个变量的积分。
如果你理解了二重积分，那么三重积分就是更多同样的东西：
#idea[
  所有两变量的内容都以显然的方式搬到三变量的情形。
]

== [RECAP] 三重积分回顾

我厚着脸皮把这一节叫做"回顾"，是想强调这里没有什么新东西要学。
下面清单中的每一项都对应你学过的某个二重积分内容，
只不过是把两个变量换成了三个变量。

一个记号上的变化：对于三维立体，
今后我将更愿意用字母 $cal(T)$ 而不是 $cal(R)$ 来表示三维区域。
原因是，很久以后再讨论散度定理时，
我们有时会同时出现二维区域和三维区域，
所以需要用不同的字母。

- 在长方体上，
  我们仍然是 $integral_(x = a_1)^(b_1) integral_(y = a_2)^(b_2) integral_(z = a_3)^(b_3) f(x,y,z) dif z dif y dif x$
  一次对一个变量积分。
- 如果你愿意，可以用 $ dif V := dif x dif y dif z $ 作为简写；
  这是 @table-shorthand 的最后一行。
- 我们不再做 $x y$ 积分，而是做 $x y z$ 积分。
  二重积分时你有两种选择（$x$ 在外、$y$ 在内，或者 $y$ 在外、$x$ 在内），
  而现在做事的次序有 $3! = 6$ 种选择：
  - $x$ 最外层，$y$ 中间，$z$ 最内层
  - $x$ 最外层，$z$ 中间，$y$ 最内层
  - $y$ 最外层，$x$ 中间，$z$ 最内层
  - $y$ 最外层，$z$ 中间，$x$ 最内层
  - $z$ 最外层，$x$ 中间，$y$ 最内层
  - $z$ 最外层，$y$ 中间，$x$ 最内层。
  如果你的区域不是长方体，想法也一样：
  把你的区域写成不等式。
- 换元公式完全相同，只是雅可比现在是一个 $3 times 3$ 矩阵：
  如果 $bf(T) : cal(T)_"new" -> cal(T)$ 是三维区域的过渡映射，把 $(u,v,w)$ 送到 $(x,y,z)$，
  那么雅可比是
  $ J_(bf(T)) = mat(
      (partial x) / (partial u), (partial x) / (partial v), (partial x) / (partial w);
      (partial y) / (partial u), (partial y) / (partial v), (partial y) / (partial w);
      (partial z) / (partial u), (partial z) / (partial v), (partial z) / (partial w);
    ). $
- 体积是 $ op("体积")(cal(T)) := integral.triple_(cal(T)) dif x dif y dif z. $
  在本课程中你可以把它当作体积的_定义_。
- 如果 $delta : cal(T) -> RR$ 是三维空间的密度函数，那么
  $ op("质量")(cal(T)) := integral.triple_(cal(T)) delta(x,y,z) dif x dif y dif z $ 是总质量。
  质心现在由三个坐标给出：
  $ (
    (integral.triple_(cal(T)) x dot delta(x,y,z) dif x dif y dif z) / (op("质量")(cal(T))),
    (integral.triple_(cal(T)) y dot delta(x,y,z) dif x dif y dif z) / (op("质量")(cal(T))),
    (integral.triple_(cal(T)) z dot delta(x,y,z) dif x dif y dif z) / (op("质量")(cal(T)))
  ). $
  （三维中我们通常用 $delta$ 而不是 $rho$，
  因为 $rho$ 要留给球坐标用。）

== [TEXT] 三重积分的例子

#sample[
  计算由 $x^2 + y^2 <= 1$ 和 $x^2 + z^2 <= 1$ 围成的区域的体积。
]

#soln[
  两个不等式必须同时满足。注意对于
  固定的 $x$，$y$ 和 $z$ 都受如下约束：
  $ y^2 <= 1 - x^2 ==> - sqrt(1 - x^2) <= y <= sqrt(1 - x^2) , $
  $ z^2 <= 1 - x^2 ==> - sqrt(1 - x^2) <= z <= sqrt(1 - x^2) . $
  变量 $x$ 的取值范围是 $- 1$ 到 $1$。

  因此，我们把它写成三重积分
  $ op("体积")(cal(T))
    &= integral_(x=-1)^1
      integral_(y=-sqrt(1-x^2))^(sqrt(1-x^2))
      integral_(z=-sqrt(1-x^2))^(sqrt(1-x^2)) 1 dif z dif y dif x \
    &= integral_(x=-1)^1
      integral_(y=-sqrt(1-x^2))^(sqrt(1-x^2))
      2sqrt(1-x^2) dif y dif x \
    &= integral_(x=-1)^1
      2sqrt(1-x^2)
      integral_(y=-sqrt(1-x^2))^(sqrt(1-x^2)) 1 dif y dif x \
    &= integral_(x=-1)^1
      2sqrt(1-x^2) dot 2sqrt(1-x^2) dif x
    = integral_(x=-1)^1 4(1-x^2) dif x \
    &= 4[x - x^3 / 3]_(x=-1)^1 = 4[(1 - 1 / 3) - (-1 + 1/3)] = #boxed[$ 16 /3 $]. #qedhere $
]
#digression(title: [题外话：关于图])[
  如果你把这个区域画出来，
  你会得到这两个圆柱的交集，
  它形成的东西显然叫做_斯坦梅茨立体（Steinmetz solid）_。

  令人意外的是，在这个例子上你其实_不_想用极坐标（或柱坐标）。
  如果你试着那样做，我想你实际上会卡住。
  直接用 $x y z$ 积分反而可行，原因是
  你会得到两个奇迹般相互抵消的平方根，这出乎意料地方便。
]

#sample[
  计算由曲面 $z = 3(x^2+y^2)$ 和 $z = 72 - 5(x^2+y^2)$ 围成的区域的体积。
]

#soln[
  所给的曲面都是抛物面：

  1. $z = 3 (x^2 + y^2)$ 是开口向上的抛物面。
  2. $z = 72 - 5 (x^2 + y^2)$ 是开口向下的抛物面。

  在动手之前，我们先弄清这两者在哪里相交。
  令它们相等可得
  $ 3 (x^2 + y^2) = 72 - 5 (x^2 + y^2) ==> x^2 + y^2 = 9. $

  考虑到这一点，我们可以把区域 $cal(T)$ 转成不等式的形式：我们写
  $ 3(x^2+y^2) <= z <= 72-5(x^2+y^2) $
  作为对 $z$ 的约束，然后写
  $ x^2+y^2 <= 9 $
  作为对 $x$ 和 $y$ 的约束。

  因此，体积可以写成
  $
    op("体积")(cal(T))
    = integral.triple_(x^2 + y^2 <= 9 \ 3(x^2+y^2) <= z <= 72-5(x^2+y^2)) dif x dif y dif z.
  $
  我们将把这个积分拆成先对圆 $x^2 + y^2 <= 9$ 的积分，
  再对由此得到的 $z$ 做一个单重积分：
  $
    op("体积")(cal(T))
    &= integral.double_(x^2 + y^2 <= 9) (integral_(z=3(x^2+y^2))^(72-5(x^2+y^2)) dif z) dif x dif y \
    &= integral.double_(x^2 + y^2 <= 9) (72 - 8(x^2+y^2)) dif x dif y.
  $
  到_这个_时候我们才使用极坐标：
  照例写 $x = r cos theta$、$y = r sin theta$，我们有
  $
    op("体积")(cal(T))
    &= integral.double_(x^2 + y^2 <= 9) (72 - 8(x^2+y^2)) dif x dif y \
    &= integral_(theta=0)^(2 pi) integral_(r=0)^3 (72 - 8 r^2) dot (r dif r dif theta) \
    &= (integral_(theta=0)^(2 pi) 1 dif theta)(integral_(r=0)^3 (72 r - 8 r^3) dif r) \
    &= 2 pi dot [36r^2 - 2r^4]_(r=0)^3 = #boxed[$ 324 pi $]. #qedhere
  $
]

上一个例子说明，由于问题设置的方式，
很自然地把对 $z$ 的积分单独做，
而用极坐标处理 $x$ 和 $y$。
这个技巧称为_柱坐标（cylindrical coordinates）_，
这个名字其实没必要存在，因为它不过是把 $z$ 附加上去的极坐标。

（其实我觉得最令人意外的，是前面那个斯坦梅茨立体的例子
_不_适合用柱坐标来做，尽管表面上看起来适合。）

== [TEXT] 柱坐标（即附加上 $z$ 的极坐标）

这里其实没有什么新东西 ---
它不过是把 $z$ 附加上的极坐标。#footnote[
  严格来说，我们也许应该给新的 $z$ 用另一个字母，
  但既然它们相等，两处就用同一个字母。
  另外，原则上我也可以引入记号 $(r, theta, z)_"cyl"$，
  与 $(r, theta)_"pol"$ 类似，
  但我觉得没有这个必要。
]
如果前面那个关于
$z = 3(x^2+y^2)$ 和 $z = 72-5(x^2+y^2)$ 的例子，你在没看解答的情况下自己做出来了，
那么你完全可以跳过整节！

过渡映射 $(r, theta, z) |-> (x, y, z)$（见 @fig-triple-cylinder 的图示）由下式给出
$
  x &= r cos theta \
  y &= r sin theta \
  z &= z.
$
#figure(
  image("figures/triple-cylinder.svg", width: auto),
  caption: [柱坐标的图示。
    $x y$ 平面（现在画成"平的"）就是极坐标，
    正如蓝色圆圈所示。
    然后我们再附加上一个高度 $z$。],
) <fig-triple-cylinder>

体积缩放因子不出所料与二维极坐标的相同，
你也许在以前的某次作业中已经默认用过它了：
#memo(title: [记住：柱坐标的缩放因子])[
  $ dif V := dif x dif y dif z = r dif r dif theta dif z. $
]
如果你想把它完全明确地看出来，可以计算雅可比
$
  det J_("极坐标") &=
  detmat(
    (partial x) / (partial r), (partial x) / (partial theta), (partial x) / (partial z);
    (partial y) / (partial r), (partial y) / (partial theta), (partial y) / (partial z);
    (partial z) / (partial r), (partial z) / (partial theta), (partial z) / (partial z);
  ) \
  &= detmat(
    cos theta, - r sin theta, 0;
    sin theta, r cos theta, 0;
    0, 0, 1
  )
  = detmat(cos theta, - r sin theta; sin theta, r cos theta) \
  &= r.
$

好，我们来跑这个例子。
注意，正如我说过的，我们本可以在这一节_之前_就给出这个例子。

#sample[
  计算由 $9(x^2 + y^2) <= z^2$ 和 $0 <= z <= 5$ 定义的圆锥的
  体积和质心，
  假设密度分布均匀 $delta = 1$。
]
#soln[
  所给的不等式描述了一个以原点为顶点、
  向上延伸到 $z = 5$ 的单个圆锥。
  为了同时求出体积和质心，
  我们利用圆锥的对称性，采用柱坐标。
  照例，$cal(T)$ 表示该区域（圆锥）。

  会出现的 $z$ 值是 $z = 0$ 到 $5$，
  在这些值之内，我们只要求
  $ 9(x^2+y^2) <= z^2 ==> sqrt(x^2+y^2) <= z/3. $
  换言之，我们可以写
  $ op("体积")(cal(T))
    = integral_(z=0)^5 integral.double_(sqrt(x^2+y^2) <= z/3) 1 dif x dif y dif z. $
  不过，我们当然应该马上换到柱坐标：
  $ op("体积")(cal(T))
    &= integral_(z=0)^5 integral_(r=0)^(z/3) integral_(theta=0)^(2pi) r dif theta dif r dif z \
    &= 2 pi integral_(z=0)^5 integral_(r=0)^(z/3) r dif r dif z \
    &= 2 pi integral_(z=0)^5 [r^2/2]_(r=0)^(z/3) dif z \
    &= 2 pi integral_(z=0)^5 z^2/18 dif z = pi/9 integral_(z=0)^5 z^2 dif z = pi/9 [z^3/3]_(z=0)^5
    = #boxed[$ (125 pi) / 27 $]. $
  这就给出了圆锥的体积。
  又因为密度是常数，我们还有
  $op("质量")(cal(T)) = op("体积")(cal(T)) = (125 pi) / 27$。


  至于质心，名义上有三个积分，
  但同样地，我们可以注意到由对称性，质心
  $(dash(x), dash(y), dash(z))$ 应位于 $z$ 轴上，即 $dash(x)=dash(y)=0$，从而简化计算。
  因此我们只需处理
  $ dash(z)
    &= 1/(op("质量")(cal(T))) integral_(z=0)^5 integral.double_(sqrt(x^2+y^2) <= z/3) z dif x dif y dif z \
    &= 1/(op("质量")(cal(T))) integral_(z=0)^5 integral_(r=0)^(z/3) integral_(theta=0)^(2pi) r z dif theta dif r dif z \
    &= 1/(op("质量")(cal(T))) integral_(z=0)^5 z integral_(r=0)^(z/3) integral_(theta=0)^(2pi) r dif theta dif r dif z \
    &= (2 pi)/(op("质量")(cal(T))) integral_(z=0)^5 z dot z^2/18 dif z quad "（重复前面）" \
    &= (2 pi)/(op("质量")(cal(T))) [z^4/72]_(z=0)^5
    = (5^4 dot pi / 36)/(op("质量")(cal(T))) = (5^4 dot pi / 36)/(5^3 dot pi / 27) = 15/4. $
  因此质心是 $#boxed[$ (0, 0, 15/4) $]$。
]

== [TEXT] 引力

#typesig[
  引力是一个向量。
]

设一个质量为 $m$ 的质点位于原点 $O = (0,0,0)$。
一般地，给定位于点 $O$ 的质量 $m$ 与位于点 $P$ 的质量 $M$，
牛顿定律说 $P$ 对 $O$ 施加的引力为
$ bf(F)_("引力") = (G dot m dot M)
  / (|O P|^2) dot underbrace(arrow(O P) / (|O P|), "从 " O " 指向 " P " 的单位向量") $
其中 $G approx 6.67430 dot 10^(-11) dot upright("N") dot upright("m")^2 dot "kg"^(-2)$ 是引力常数。

但在现实中，我们通常希望质量 $M$ 占据整个区域 $cal(T)$，
并带有某种密度 $delta$。
（现实中不存在质点，除非你把黑洞也算进去。）
所以设我们有一块占据区域 $cal(T)$ 的固体质量。
在这种情况下，$cal(T)$ 中每个单独的点 $P=(x,y,z)$ 都可以看成一个_向量_
$ "由 " (x,y,z) " 施加于 " (0,0,0) " 的引力" = (G m dot (delta(x,y,z) dif V))/(x^2+y^2+z^2) dot
  underbrace((chevron.l x,y,z chevron.r) / (sqrt(x^2+y^2+z^2)), "从 " O " 指向 " P " 的单位向量"). $
总的引力则是它在这个整体质量 $cal(T)$ 上的积分。
#figure(
  image("figures/triple-gravity.svg", width: auto),
  caption: [
    像太阳这样的大质量 $cal(T)$ 对质量为 $m$ 的质点施加的引力。
    区域 $cal(T)$ 中像 $P$ 或 $Q$ 这样的每个点都对质量为 $m$ 的质点施加一个微小的力。
    总的引力是对整个区域 $cal(T)$ 求和（积分）。
  ],
)

所以总的引力名义上是
#eqn[
  $ bf(G) = integral_(cal(T)) (G m dot (delta(x,y,z) dif V))/(x^2+y^2+z^2) dot (chevron.l x,y,z chevron.r) / (sqrt(x^2+y^2+z^2)). $
  <eqn-gravity>
]

现在，如果你一直听从我的建议，始终审查类型安全，
那么你应当在这里叫停我。
这是整本讲义中第一次出现被积函数是_向量_
而不是数的积分。
这是怎么回事？

一般的答案是，你只要按分量做就可以了。
但为了让课程保持简单，我永远不会以那种形式使用 @eqn-gravity，
这样我们的被积函数总是具有类型 number 而不是类型 vector。
为此，我把 @eqn-gravity 改写如下：
#memo(title: [记住：区域对原点的引力])[
  设 $cal(T)$ 是一个带有密度函数 $delta$ 的区域。
  作用在原点上的引力向量 $bf(G) = chevron.l G_1, G_2, G_3 chevron.r$
  定义为
  $
    G_1 &:= G m integral.triple_(cal(T)) (x delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    G_2 &:= G m integral.triple_(cal(T)) (y delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z \
    G_3 &:= G m integral.triple_(cal(T)) (z delta(x,y,z))/((x^2+y^2+z^2)^(3/2)) dif x dif y dif z.
  $
  也就是说，$bf(G) = G_1 ee_1 + G_2 ee_2 + G_3 ee_3$。
]
现在 $G_1$、$G_2$、$G_3$ 又是数的积分了，所以没问题。

由于 $(x^2+y^2+z^2)^(3/2)$ 用起来如此别扭，
你常常会做一个叫做_球坐标（spherical coordinates）_的换元。
所以我们把所有的例子都推给下一章 @ch-sph。

== [EXER] 习题

#exer[餐巾环问题][
  设给定实数 $R > a > 0$，并令 $h := 2sqrt(R^2-a^2)$。
  在半径为 $R$ 的木球中心
  钻一个半径为 $a$ 的圆柱形孔，得到一个高为 $h$ 的珠子，
  如 @fig-triple-napkin-ring 所示。
  计算所得珠子的体积，表示为 $h$ 的函数。
] <exer-napkin-ring>

#figure(
  image("figures/triple-napkin-ring.svg", width: auto),
  caption: [餐巾环问题。
    图中蓝色的珠子是从半径为 $R$ 的球中钻出来的，其高度为
    $h = 2sqrt(R^2-a^2)$。
    要求用 $h$ 表示该珠子的体积。
  ],
) <fig-triple-napkin-ring>
