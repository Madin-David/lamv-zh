#import "@local/evan-zh:1.0.0":*

= 功的捷径：保守向量场与格林定理 <ch-ftcgreen>

上一章我们给出了功的定义，以及如何用参数化
徒手计算 $integral_(cal(C)) bf(F) dot dif bf(r)$。
然而，参数化可能非常费力。
所以本章的目的是告诉你，在什么条件下你可以
_不必_做参数化。
这样的情形有两类：

- 如果 $bf(F)$ 是_保守_向量场，那么_微积分基本定理_（FTC）
  就是该用的工具。
- 如果你在二维中工作，且 $cal(C)$ 是闭合环路，那么格林定理就是该用的工具。

下面我们把这两者都介绍给你。

== [TEXT] 线积分的微积分基本定理

现在我们介绍第一个斯托克斯结论。
它对应的是下图所示红色箭头所代表的命题。

#figure(
  box(image("figures/work-cut-ftc.svg", width: auto), stroke: 1pt),
  caption: [线积分的 FTC 就是海报 @poster-stokes 中
    “grad”红色箭头所对应的斯托克斯命题。],
) <fig-work-ftc-red-arrow>

#memo(title: [记住：线积分的 FTC])[
  设 $bf(F) : RR^n -> RR^n$ 是保守向量场，
  由某个势函数 $f : RR^n -> RR$ 表示为 $bf(F) = nabla f$。
  那么对从点 $P$ 到点 $Q$ 的任意曲线 $cal(C)$，我们有
  $ integral_(cal(C)) bf(F) dot dif bf(r) = f(Q)-f(P). $
]

这有几个重要的推论。
如果你知道 $bf(F)$ 是保守的，那么
- 对_任意_环路（即从一点出发又回到该点的曲线），功积分为零。
- 更一般地，所有功积分都_与路径无关_：
  如果 $cal(C)$ 与 $cal(C)'$ 是从 $P$ 到 $Q$ 的两条不同路径，但端点相同，
  那么两个功积分相等。
确实，第一种情形中功积分为 $f(P)-f(P)=0$，
第二种情形中它等于 $f(Q)-f(P)$（$cal(C)$ 和 $cal(C)$' 都是如此）。
不过这两条在哲学上很漂亮，因为它们甚至不要求
你对函数 $f$ 有任何了解。

换言之：
#idea(title: [想法：线积分 FTC 的实际推论])[
  如果你_已经知道_ $bf(F)$ 是保守的，那么
  - 如果你还知道势函数 $f$，
    那么功积分极易计算：
    只需计算 $f("ending point")-f("starting point")$。
  - 如果你不知道势函数 $f$，
    就用 @ch-antigrad 中的方法来求它。
  - 如果起点与终点相同，你甚至不用求 $f$。
    功积分总是 $0$。
]

让我们用一个保守向量场具体看看。
我们取 $ bf(F) (x , y) = vec(2 x + 1, 3 y) $，
如果按照 @ch-antigrad 中的方法，
就能反求出满足 $bf(F) = nabla f$ 的 $f$：
$ f(x,y) = x^2 + x + 3 / 2 y^2. $
于是，既然 $f$ 已知，线积分计算起来就很简单：

#sample[
  计算向量场
  $bf(F) (x , y) = vec(2 x + 1, 3 y)$ 沿下面两条曲线的线积分：

  - 圆周 $x^2 + y^2 = 1$ 的上半部分，取逆时针定向
    （@fig-work-ex2 中的蓝色）。
  - 从 $(1,0)$ 到 $(-1,0)$ 的线段
    （@fig-work-ex2 中的棕色）。
]

#figure(
  image("figures/work-ex2.svg", width: auto),
  caption: [与 @fig-work-ex1 相同的棕色和蓝色路径，
  但这次向量场不同，现在是保守场。],
) <fig-work-ex2>


#soln[
  因为我们知道势函数
  $ f(x,y) = x^2 + x + 3 / 2 y^2 $，
  所以两问的答案相同：
  $ f(-1,0) - f(1,0) = 0 - 2 = #boxed[$ -2 $]. #qedhere $
]

作为对照，我们展示一下：假如你不够聪明、
没有注意到 $bf(F)$ 是保守的，
上面每一条本来该如何“徒手”计算这些线积分。
当然，我们做这件事时已经知道两个答案最好相等（等于 $-2$）。

- 蓝色路径上的功，这里仍是 $bf(r)(t) = (cos t, sin t)$，$0 <= t <= pi$，
  且 $bf(r)'(t) = vec(- sin t, cos t)$。
  新的向量场 $bf(F)$ 沿这条曲线的取值为
  $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = (2 cos t + 1, 3 sin t) $

  因此，被积的点积为
  $ bf(F) (bf(r) (t)) dot bf(r)'(t)
    &= (2 cos t + 1) (- sin t) + (3 sin t) (cos t) \
    &= - 2 cos t sin t - sin t + 3 sin t cos t = cos t sin t - sin t $

  对 $t$ 从 $0$ 到 $pi$ 积分：
  $ integral_(t=0)^(pi) (cos t sin t - sin t) dif t
    = integral_(t=0)^(pi) (sin(2t)/2 - sin t) dif t
    = lr([-cos(2t)/4 + cos(t)])_(t=0)^pi = -2. $

- 棕色线段上的功，
  仍参数化为 $bf(r) (t) = (1 -  2 t, 0)$，其中 $t in [0, 1]$，
  且 $ bf(r)' (t) = vec(- 2 , 0) . $
  把参数化代入新的向量场得到：
  $ bf(F) (bf(r) (t)) = vec(2 (1 - 2 t) + 1 , 3 dot 0) = vec(3 - 4 t , 0) . $

  $bf(F)$ 沿 $cal(C)$ 的线积分由下式给出：
  $ integral_(cal(C)) bf(F) dot dif bf(r) &= integral_(t=0)^1 bf(F) (bf(r) (t)) dot bf(r)' (t) dif t
    = integral_(t=0)^1 -2(3-4t) dif t \
    &= integral_(t=0)^1 (8t-6) dif t = (4t^2-6t)_(t=0)^1 = -2. $

#sample[
  设 $cal(C)$ 是从 $(1,100)$ 到 $(42, 1337)$ 的任意路径。
  计算 $ integral_(cal(C)) 5 dif x. $
]
#soln[
  把简写展开为 $5 dif x = 5 dif x + 0 dif y$，
  我们要积分的向量场就是常向量场 $bf(F)(x,y) = vec(5,0)$。
  （在图示中，每个蓝色箭头都指向正东，且长度同为 $5$。）
  它当然是保守的：势函数
  $ f(x,y) = 5x $
  只要猜一下就能找到，或者用 @ch-antigrad 中的方法。
  确实，$nabla f = vec(5,0)$，正是我们需要的。

  所以既然我们知道 $bf(F)$ 是保守的，
  又找到了势函数 $f$，
  就可以不管 $cal(C)$ 的参数化，直接写出
  $ integral_(cal(C)) 5 dif x = f(42, 1337) - f(1, 100) = 5 dot 42 - 5 dot 1 = 5(42-1)
    = #boxed[$ 205 $]. #qedhere $
]

#remark[
  一般地，对任意常数 $c$，由 $c dif x$ 编码的向量场都是保守的，
  势函数为 $f(x,y) = c x$。
  因此，$integral_(cal(C)) c dif x = c integral_(cal(C)) dif x$
  总是恰好等于 $c$ 乘以 $x$ 的总变化量。
]

== [TEXT] 好吧，但你如何判断 $bf(F)$ 是否保守？

我们看到过，当 $bf(F)$ 保守时，旋度 $nabla times bf(F)$ 为零。
事实证明，如果 $bf(F)$ 处处有定义，那么反过来也成立：
也就是说，我们可以用 $nabla times bf(F)$ 作为检验保守场的判据。

#memo(title: [记住：保守 $<==>$ $nabla times bf(F) = bf(0)$])[
  这里假设向量场连续可微，
  且在 $RR^2$ 或 $RR^3$ 上处处有定义。
  - 由 $bf(F)(x,y) = vec(p(x,y), q(x,y))$
    给出的向量场 $bf(F) : RR^2 -> RR^2$，
    保守当且仅当二维标量旋度处处为零：
    $ (partial q) / (partial x) - (partial p) / (partial y) = 0. $
  - 向量场 $bf(F) : RR^3 -> RR^3$，
    保守当且仅当旋度 $nabla times bf(F)$ 处处为零。
    用符号写就是：如果 $bf(F)(x,y) = vec(p(x,y,z), q(x,y,z), r(x,y,z))$，
    那么我们需要旋度的三个分量都等于 $0$：
    $ (partial r) / (partial y) - (partial q) / (partial z)
      = (partial q) / (partial x) - (partial p) / (partial y)
      = (partial p) / (partial z) - (partial r) / (partial x) = 0. $
]

这看起来应该很熟悉：这就是我在 @sec-when-antigrad 中告诉过你的同一件事。
唯一的变化是，现在我对这些方程有了与水有关的解释：
即我们要求二维或三维旋度为零。
但方程本身是一样的。

#remark[
  如果向量场 $bf(F)$ 只在 $RR^n$ 的一部分上有定义，
  且该区域不是_单连通的_，这个定理也会失效。
  此时它只在一个方向上成立 --- 也就是说，
  如果 $nabla times bf(F) != bf(0)$，那么 $bf(F)$ 一定不保守，
  但有些非保守场也满足 $nabla times bf(F) = bf(0)$。
  // We won't get into this here, because in 18.02 I don't think you will encounter
  // any vector fields that aren't defined on a simply connected region.
  // jk we have gravity smh
]

#sample[
  实数 $c$ 取何值时，向量场
  $ bf(F) = vec(e^(cos x) + x y^5, c x^2 y^4 + log(y^2+1) ) $
  是保守向量场？
]
#soln[
  我们需要 $c$ 使得
  $ (partial)/(partial x)(c x^2 y^4 + log(y^2 + 1)) &= (partial)/(partial y)(e^(cos x) + x y^5) \
    <==> c dot 2 x y^4 &= 5 x y^4 $
  对所有实数 $x$ 和 $y$ 成立。
  这只有当 $#boxed[$ c = 5/2 $]$ 时才发生。
]

#sample[
  实数 $a$、$b$ 取何值时，向量场
  $ bf(F) = vec(y^2 + a x^2 z + e^x, b x y + z cos (y z),  x^3 + y cos (y z)). $
  是保守向量场？
]
#soln[
  令
  $ p &= y^2 + a x^2 z + e^x \
    q &= b x y + z cos (y z) \
    r &= x^3 + y cos (y z). $
  我们需要求 $(a,b)$，使得旋度 $nabla times bf(F)$ 为零，即
  $ (partial r) / (partial y) - (partial q) / (partial z)
    = (partial q) / (partial x) - (partial p) / (partial y)
    = (partial p) / (partial z) - (partial r) / (partial x) = 0. $
  我们依次计算全部六个偏导数。

  - 要使旋度的第一个分量为零，我们需要下面两个偏导数相等：
    $ (partial r) / (partial y) &= (partial) / (partial y) (x^3 + y cos (y z)) = cos (y z) + y (- sin (y z)) z = cos (y z) - y z sin (y z) \
      (partial q) / (partial z) &= (partial) / (partial z) (b x y + z cos (y z)) = cos (y z) + z (- sin (y z)) y = cos (y z) - y z sin (y z). $
    但这总是成立，与 $a$、$b$ 无关。
  - 要使旋度的第二个分量为零，
    我们需要下面两个偏导数相等：
    $ (partial p) / (partial z) &= (partial) / (partial z) (y^2 + a x^2 z + e^x) = a x^2 \
      (partial r) / (partial x) &= (partial) / (partial x) (x^3 + y cos (y z)) = 3 x^2. $
    这当且仅当 $a = 3$ 时成立。
  - 要使旋度的第三个分量为零，
    我们需要下面两个偏导数相等：
    $ (partial q) / (partial x) &= (partial) / (partial x) (b x y + z cos (y z)) = b y \
      (partial p) / (partial y) &= (partial) / (partial y) (y^2 + a x^2 z + e^x) = 2 y. $
    这当且仅当 $b = 2$ 时成立。

  因此 $#boxed[$ (a,b) = (3,2) $]$ 是唯一的答案。
]

#digression[
  特别地，上面两个例子各自都应该有一个势函数。

  在第一个例子中，要_写出_势函数并不容易，
  因为 $e^(cos x)$ 没有容易表达的反导数。
  （不过 $log(y^2+1)$ 有；结果是 $y(log(y^2+1)-2)+2arctan(y)$。）
  所以只要某个势函数_确实存在_，我们就满足了，
  即便它无法用熟悉的函数写出来。

  另一方面，第二个例子相当容易积分，
  只要按照 @ch-antigrad 中的步骤：
  应该得到 $ f(x,y,z) = e^x + cos(y z) + x^3 z + x y^2 + C. $
]


== [TEXT] 格林定理（仅限二维）

我们预期，对于把二维功积分与面积积分连接起来的那支红色箭头，
也应该有一个斯托克斯结论。
#figure(
  box(image("figures/work-cut-greens.svg", width: auto), stroke: 1pt),
  caption: [格林定理是海报 @poster-stokes 中上述红色箭头
    所对应的斯托克斯结论。],
)

它说的是下面这些。
#memo(title: [记住：把功化为旋度的格林定理])[
  设 $cal(C)$ 是由 $bf(r)(t)$ 参数化的闭合环路，
  它逆时针地围出一个区域 $cal(R)$。
  那么对任意向量场 $bf(F) = vec(p(x,y), q(x,y))$，无论保守与否，我们都有
  $ integral.cont_(cal(C)) bf(F) dot dif bf(r) = integral.cont_(cal(C)) (p dif x + q dif y)
    = integral.double_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
]
左边的 $integral.cont_(cal(C))$ 是一个新符号，
但它与 $integral_(cal(C))$ 含义相同。
那个圆圈是为了强调 $cal(C)$ 是闭合环路，
即要求它的起点与终点相同
（不像我们前面例子中看到的其他曲线）。
换言之：
#definition(title: [$integral.cont$ 的定义])[
  $integral.cont_(cal(C))$ 的意思是“$integral_(cal(C))$，但额外加上一个可选的提醒，表示 $cal(C)$ 是一个环路”。
  （这个提醒是可选的，也就是说，即使 $cal(C)$ 是环路，
  你也没有义务加上那个圆圈。）
]

注意这并不要求 $bf(F)$ 是保守的！
（前面所有关于 $bf(F)$ 保守的讨论，
是因为我们当时用的是 @fig-work-ftc-red-arrow 中的红色“grad”箭头。
但我们现在要在海报上转向一支新的红色箭头，
那个关于梯度的假设就不再需要了。）
事实上，当 $bf(F) = nabla f$ _是_保守的时候，
我们知道 $(partial q)/(partial x) - (partial p)/(partial y) = 0$：
保守向量场的二维标量旋度为 $0$。
所以此时格林定理只是说 $integral.cont_(cal(C)) nabla f dif bf(r) = 0$，
这是我们已经知道的。

#tip(title: [提示：永远使用逆时针定向])[
  只要 $cal(C)$ 是 $RR^2$ 中的闭合环路，
  我们基本上总是假定
  我们绕行它的方向是逆时针。
  打破这个约定、让环路取顺时针定向，被认为是很不礼貌的。
]

在环路闭合的情形下，格林定理给了我们一条捷径，
可以省去我们先前必须徒手做的一堆计算。
下面举几个例子。

#sample[
  计算线积分
  $ integral.cont_(cal(C)) (x^3 - y) dif x + (x + y^3) dif y , $
  其中 $cal(C)$ 是取逆时针定向的圆周 $x^2 + y^2 = 4$。
]

#soln[
  设 $cal(R)$ 表示 $cal(C)$ 所围的区域。
  我们对向量场
  $ p (x , y) = x^3 - y , quad q (x , y) = x + y^3 . $
  使用格林定理。
  计算 $q$ 对 $x$ 的偏导数与 $p$ 对 $y$ 的偏导数：
  $ (partial q) / (partial x) = (partial) / (partial x) (x + y^3) &= 1 ,
    (partial p) / (partial y) = (partial) / (partial y) (x^3 - y) &= - 1 . $
  把这些偏导数代入格林定理：
  $ integral.cont_(cal(C)) p dif x + q dif y
    = integral.double_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A = integral.double_(cal(R)) (1 - (- 1)) dif A = integral.double_(cal(R)) 2 dif A . $
  区域 $cal(R)$ 是由 $x^2 + y^2 <= 4$ 定义的圆盘，
  即半径为 $2$ 的圆，因此面积为
  $ op("面积") (cal(R)) = pi r^2 = pi (2)^2 = 4 pi . $
  所以答案是 $2 dot 4 pi = #boxed[$ 8 pi $]. $
]

#sample[
  计算线积分 $ integral.cont_(cal(C)) (y dif x - x dif y) $，
  其中 $cal(C)$ 是顶点为 $(0 , 0)$、$(1 , 0)$ 和
  $(0 , 1)$ 的三角形，取逆时针定向。
]
#soln[
  设 $cal(R)$ 表示三角形的内部。
  由格林定理：
  $ integral.cont_(cal(C)) p dif x + q dif y
    = integral.double_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A , $
  其中 $P (x , y) = y$，$Q (x , y) = - x$。
  计算 $(partial q) / (partial x)$ 与 $(partial p) / (partial y)$：
  $ (partial q) / (partial x) = - 1 , quad (partial p) / (partial y) = 1 . $
  因此
  $ integral.double_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A = integral.double_(cal(R)) (- 1 - 1) dif A = integral.double_(cal(R)) - 2 dif A . $
  三角形 $cal(R)$ 的面积为：
  $ op("面积")(cal(R)) = 1 / 2 dot upright("底") dot upright("高")
    = 1 / 2 dot 1 dot 1 = 1 / 2 . $
  于是：$ integral.double_(cal(R)) - 2 dif A = - 2 dot 1 / 2 = #boxed[$ -1 $]. #qedhere $
]

#sample[
  计算线积分
  $ integral.cont_(cal(C)) (x^2 dif y - y^2 dif x) $
  其中 $C$ 是顶点为
  $(1 , 1)$、$(0, 1)$、$(0, 0)$ 和 $(1 , 0)$ 的正方形的边界，
  取逆时针定向。
]

#soln[
  设 $cal(R)$ 表示正方形的内部。
  由格林定理：
  $ integral.cont_(cal(C)) p dif x + q dif y = integral.double_(cal(R)) ((partial q) / (partial x) - (partial p) / (partial y)) dif A , $
  其中 $p (x , y) = - y^2$，$q (x , y) = x^2$。
  计算 $(partial q) / (partial x)$ 与 $(partial p) / (partial y)$：
  $ (partial q) / (partial x) = 2 x , quad (partial p) / (partial y) = - 2 y . $
  把它们代入格林定理：
  $ integral.double_(cal(R)) (2 x - (- 2 y)) dif A = integral.double_(cal(R)) (2 x + 2 y) dif A . $

  由于 $cal(R)$ 是边长为 $1$、中心在原点的正方形，
  对 $x$ 和 $y$ 从 $0$ 到 $1$ 积分：
  $ integral.double_(cal(R)) (2 x + 2 y) dif A
    = 2 integral_(y = 0)^1 integral_(x = 0)^1 (x + y) dif x dif y . $

  对 $x$ 计算内层积分：
  $ [x^2 / 2 + y x]_(x=0)^1 = y + 1/2. $

  对 $y$ 计算积分：
  $ 2 integral_(y = 0)^1 (y+1/2) dif y = #boxed[$ 2 $]. #qedhere $
]

== [SIDENOTE] 一张图解释为什么关于功的格林定理应该成立（不是正式证明） <sec-ftcgreen-explain>

下面用极不正式的方式说明格林定理在图形上想表达什么。
我们不会把它讲精确，也不会深入细节。

记住，二维向量场 $bf(F)$ 在点 $P$ 处的_二维标量旋度_
是一个数，它描述场 $bf(F)$ 在 $P$ 附近的逆时针旋涡。
所以要画一张图（@fig-ftcgreen-explain）：

- 设 $cal(C)$ 是一个逆时针环路，取逆时针定向。
  为了画图，我们把 $cal(C)$ 画成一个紫色正方形，它围出一个区域 $cal(R)$。
- 然后我们想象把 $cal(R)$ 分割成一堆微小的正方形。
  在每个小正方形内画一个小小的绿色旋涡，它大致对应
  $bf(F)$ 在该小正方形中心处的二维标量旋度。

于是积分
$ integral.double_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A $
可以看作“绿色旋涡之和”（不管那是什么意思）。
#figure(
  image("figures/ftcgreen-explain.svg", width: auto),
  caption: [关于功的格林定理想表达的意思的粗略图示：
    “如果把绿色旋涡加起来，最后剩下的只有沿紫色边界的功”。],
) <fig-ftcgreen-explain>

然而，在 @fig-ftcgreen-explain 中你应该意识到：*内部的所有旋涡都会抵消*。
想象两个灰色格子之间的一道竖直灰色墙：
可以想象 $bf(F)$ 沿这道墙的方向和大小
对相邻两个格子的“旋涡程度”都有贡献，
但它在一边格子上贡献多少正的，就在另一边格子上贡献多少负的。
（再说一次，这完全是图示式的，我不会把它讲精确。）

所以如果把所有绿色的东西加起来，剩下的只有
紧沿紫色曲线的那些绿色东西（上图画得更深）。
例如，左边的深绿色箭头对应 $bf(F)$ 有多少
顶着附近的灰色墙向下指：
这正好符合 $bf(F)$ 沿那道西边墙的功积分的描述。
而当你把四股深绿色水流加起来，
就得到 $bf(F)$ 沿紫色曲线 $cal(C)$ 所做的总功，正如所愿。

== [RECIPE] 评估线积分：现在全都合在一起 <sec-recipe-work>

虽然我们给出了带参数化的线积分定义，
但随后立刻看到有几个捷径，
即在某些情形下的 FTC 和（二维的）格林定理。
于是我们可以给出一个把这些汇总起来的方法。

#recipe(title: [方法：在可能有捷径时计算线积分])[
  设我们想求 $ integral_(cal(C)) bf(F) dot dif bf(r)$。

  1. 首先，检查向量场是否保守，
    也就是看旋度是否为零。
    - 如果是，就不必参数化 $cal(C)$。
      除端点之外，连 $cal(C)$ 都不用看。
      求向量场 $bf(F)$ 的势函数 $f$，
      并用 FTC 作为捷径：输出
      $ f("终点") - f("起点"). $
  2. 其次，如果线积分在 $RR^2$ 中，检查 $cal(C)$ 是否为闭合环路。
    - 如果是，看看格林定理能否给出简单的捷径：
      $ integral.cont_(cal(C)) (p dif x + q dif y) = integral.double_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A. $
  3. 如果这两条都不适用，
    就退回到 @sec-work-manual-recipe 中描述的参数化方法。
    这里再重复一遍：
      1. 选取曲线 $cal(C)$ 的*任意*参数化 $bf(r) : RR -> RR^n$，
        包括指明起止时刻。
        如 @sec-flex-param 所述，在如何设定参数化上你有一些自由度。
      2. 计算导数 $bf(r)'(t)$。
      3. 计算点积 $bf(F)(bf(r)(t)) dot bf(r)'(t)$。
      4. 把它从起始时刻积分到终止时刻。
]

我们会在 @sec-recipe-2d-flux 中再给出几个这样的例子，
在那里把它与另一种线积分“二维通量”作对照。

== [TEXT] 进阶技巧：把区域封起来 <sec-green-seal-region>

格林定理足够强大，即使路径 $cal(C)$ 不是闭合环路，
它也可能派上用场：
思路是补上一段简单的路径，把环路“封住”，
而那段路径上的线积分容易计算。
为了演示这个技巧，我们把 @sec-work-manual-recipe 中的第一个例子重新拿出来，
那要追溯到我们最初介绍如何徒手计算功的时候。

#sample[
  计算向量场
  $bf(F) (x , y) = vec(2 y , 3 x)$ 沿
  圆周 $x^2 + y^2 = 1$ 上半部分的线积分，取逆时针定向。
  见 @fig-ftcgreen-ex1。
]

我们已经看到可以用徒手参数化来计算它。
现在我们展示如何通过补上从 $(-1,0)$ 到 $(1,0)$ 的线段，
把格林定理当作捷径来用。

#figure(
  image("figures/ftcgreen-ex1.svg", width: auto),
  caption: [通过把区域“封住”，即补上连接 $(-1,0)$ 与 $(1,0)$ 的线段，
    来计算 $integral_(cal(C)) bf(F) dot dif bf(r)$。
    沿这条线段的线积分很容易计算（它等于零，
    因为力与它垂直。）
    于是格林定理适用于封住后的区域 $cal(R)$。],
) <fig-ftcgreen-ex1>

#soln[
  设 $cal(C)$ 表示这个半圆。
  因为 $cal(C)$ 不是闭合环路，格林定理不能直接适用。
  为了使用它，我们改为补上一段新的线段 $cal(C)_("盖面")$，
  从 $(-1,0)$ 指向 $(1,0)$。
  那么如果我们把 $cal(C)$ 与新的盖子 $cal(C)_("盖面")$ _两者_都考虑进来，
  它们就围出面积为 $pi/2$ 的半个圆盘 $cal(R)$，如 @fig-ftcgreen-ex1 所示。
  因此，对这条由两部分组成的边界，格林定理说
  $ underbrace(integral_(cal(C)) (2 y dif x + 3 x dif y), "我们要求的")
    + integral_(cal(C)_("盖面")) (2 y dif x + 3 x dif y)
    &= integral.double_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A \
    &= integral.double_(cal(R)) ((partial)/(partial x)(3x) - (partial)/(partial y)(2y)) dif A \
    &= integral.double_(cal(R)) (3-2) dif A = integral.double_(cal(R)) dif A \
    &= op("面积")(cal(R)) = pi/2. $
  另一方面，我断言
  $ integral_(cal(C)_("盖面")) (2 y dif x + 3 x dif y) = 0. $
  这用直接参数化很容易算出：
  例如，若我们用 $bf(r)(t) = (t, 0)$（$-1 <= t <= 1$）参数化盖子，那么
  $ integral_(cal(C)_("盖面")) (2 y dif x + 3 x dif y)
    &= integral_(t=-1)^1 vec(2 dot 0, 3 dot t) dot bf(r)'(t) dif t
    = integral_(t=-1)^1 vec(0, 3t) dot vec(1, 0) dif t
    = integral_(t=-1)^1 0 dif t = 0. $
  其实直接从 @fig-ftcgreen-ex1 也能看出这一点，
  因为在整个盖子上向量场都垂直于 $x$ 轴，
  所以总功为 $0$ 并不令人意外。
  于是，所求的线积分为
  $ underbrace(integral_(cal(C)) (2 y dif x + 3 x dif y), "我们要求的")
    &= integral.double_(cal(R)) ((partial q)/(partial x) - (partial p)/(partial y)) dif A
      - integral_(cal(C)_("盖面")) (2 y dif x + 3 x dif y) \
    &= pi/2 - 0 = #boxed[$ pi/2 $]. #qedhere $
]

== [EXER] 习题

#exer[
  向量场
  $ bf(F)(x,y) = vec(sin(e^x), arctan(y^pi+pi^y)) $
  是保守的吗？
] <exer-consv>

#exer[
  计算线积分
  $ integral.cont_(cal(C)) (x^2 - y) dif x + (y^2 - x) dif y $
  其中 $cal(C)$ 是由圆周 $x^2 + y^2 = 4$ 所围区域的边界，
  取逆时针定向。
] <exer-work-boring>

#exer[由 Ting-Wei Chao 提供][
  与 @exer-parabola-1 一样，
  设 $cal(C)$ 是由抛物线 $y = x^2-1$ 从 $(-1, 0)$ 到 $(1, 0)$ 的弧，
  再接上从 $(1, 0)$ 回到 $(-1, 0)$ 的线段所构成的定向闭曲线。
  仍令 $ bf(F)(x,y) = vec(x^2(y+1), (y+1)^2). $
  这次用格林定理计算 $integral_(cal(C)) bf(F) dot dif bf(r)$。
] <exer-parabola-2>

#exerstar[鞋带公式][
  设整数 $n >= 3$，并设
  $cal(P) = P_1 P_2 ... P_n$ 是 $RR^2$ 中的凸 $n$ 边形，
  其顶点 $P_i = (x_i, y_i)$ 按逆时针标号。
  用格林定理证明 $cal(P)$ 面积的如下公式：
  $ op("面积")(cal(P)) = 1/2 sum_(i=0)^(n-1) (x_i y_(i+1) - x_(i+1) y_i). $
  这里按约定 $x_0 = x_n$、$y_0 = y_n$，
  所以 $i=0$ 那一项是 $x_n y_1 - x_1 y_n$。
] <exer-shoelace>
