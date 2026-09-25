#import "@local/evan-zh:1.0.0":*

= 极坐标

== [TEXT] 极坐标是换元的特殊情形

上一章我们用过的过渡映射之一是
$ bf(T)_"极坐标" (r, theta) = (r cos theta, r sin theta). $
这个特殊的换元如此常见，以至于你其实应该把它的雅可比行列式
和面积缩放因子背下来。
回想上一章我们算过
$ J_(bf(T)) &= mat(
    partial / (partial r) (r cos theta),
    partial / (partial theta) (r cos theta);
    partial / (partial r) (r sin theta),
    partial / (partial theta) (r sin theta))
  = mat(cos theta, -r sin theta; sin theta, r cos theta). \
  |det J_(bf(T))| &=
    detmat(cos theta, - r sin theta; sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
你其实应该直接记住这个计算的最终结果，
这样就不必再算一遍。
通俗地说，它可以写成这样：

#memo(title: [记住：极坐标的雅可比])[
  当从笛卡尔坐标 $(x,y)$ 转换到极坐标 $(r,theta)$ 时，
  你应当把 $dif x dif y$ 替换为 $r dif r dif theta$。
  通俗地说，我们写
  $ dif x dif y = r dif r dif theta. $
]

许多其他资料会把 $dif A$ 作为_两者_的简写：
所以如果你用的是 $(x,y)$ 坐标，那么 $dif A = dif x dif y$，
而如果你用的是极坐标，那么 $dif A = r dif r dif theta$。
（毕竟它们相等。）
再强调一次，日后当你接触到一种叫做_微分形式（differential form）_的新对象时，
这可以变得更精确，
但现在请只把它当作一个极常见换元的助记符，
而不是形式化的陈述。

作为辅助轮，接下来一章我仍然会避免写 $dif A$，
这样当你看到 $dif x dif y$ 或 $dif y dif x$ 时，你就知道_应该_
做一个换元
（而不会不小心写成漏掉因子 $r$ 的 $dif r dif theta$）。

== [TEXT] 极坐标可以看成一个坐标系

在下文中，为了名副其实地称为"极_坐标_"，我将直接写
$ (r, theta)_"pol" := (r cos theta, r sin theta) $
这样就不必到处拖着 $bf(T)_"极坐标"$。
（不过，其他地方会直接到处写 $(r, theta)$，
因为字母变了以后不太可能与 $x y$ 坐标混淆。）

结论是，在实践中：
#idea[
  一旦你记住 $dif x dif y$ 变成 $r dif r dif theta$，
  你就可以直接用极坐标进入问题，
  完全跳过 $x$ 和 $y$。
]

例如，如果你想求单位圆盘的面积，
你知道在极坐标中单位圆盘是 $0 <= r <= 1$ 且 $0 <= theta <= 2pi$，
所以你可以直接通过积分
$ integral_(r=0)^1 integral_(theta=0)^(2 pi) r dif theta dif r $
来思考，甚至不必费心写出 $x y$ 版本 $integral.double_(x^2+y^2<=1) dif x dif y$。
与 @sec-chvar-polar 中的做法相比，这是一回事；
只是思维方式的转变：从
"取一张 $x y$ 的图，再翻译成极坐标"
转变为"取一张图，直接把它写成极坐标"。

== [TEXT] 著名例子：偏心圆 <sec-offset-circle>

有一个特别著名的习题，在讲这部分内容时经常被用到。
我打算把它拆成两部分。

#sample[
  设 $cal(R)$ 表示以 $(1,0)$ 为圆心、半径为 $1$ 的圆盘。
  用极坐标表示区域 $cal(R)$。
]

#figure(
  image("figures/polar-offset.svg", width: auto),
  caption: [$(x-1)^2 + y^2 <= 1$ 的草图。
    人们可能以为把它换成极坐标会很恶心，
    但结果是在 $-pi/2 <= theta <= pi/2$ 时 $r <= 2 cos theta$，比预想的好得多。],
) <fig-polar-offset>


#soln[
  这里有两种做法。

  / 几何方法:
    见 @fig-polar-offset。
    从图中可以清楚看出我们要 $-pi/2 <= theta <= pi/2$。
    令 $O=(0,0)$，$P$ 是圆周上的一点，
    再令 $A = (2,0)$（于是线段 $A O$ 是该圆的一条直径）。
    那么我们实际上得到一个直角三角形 $triangle O P A$，满足
    $ angle P = 90 degree, quad O A = 2, quad "and" angle A O P = theta. $
    因此，我们这条偏心圆的边界由 $r = 2 cos theta$ 给出。
    该圆盘（即边界内部的部分）则是
    $ 0 <= r <= 2 cos theta. $


  / 代数方法:
    一开始我们有的 $(x,y)$ 满足
    $ (x - 1)^2 + y^2 <= 1. $
    展开这个方程得到
    $ x^2 - 2 x + 1 + y^2 <= 1 ==> x^2 + y^2 <= 2 x . $
    在极坐标中，$x = r cos theta$ 且 $y = r sin theta$，代入可得
    $ r^2 <= 2 r cos theta . $
    要使其可行，我们需要 $cos theta >= 0$ 非负，
    于是取 $-pi/2 <= theta <= pi/2$。
    在这种情况下，条件最终变成 $ 0 <= r <= 2 cos theta. $

  总之，答案是：$cal(R)$ 用极坐标表示恰好是
  $ #boxed[$ -pi/2 <= theta <= pi/2 " 与 " r <= 2 cos theta $]. #qedhere $
]

换言之，$r = 2 cos theta$ 的图像其实
就是一个偏心圆。
对第一次见到它的人来说这有点意外，
甚至我现在也觉得有点意外，但几何论证应当说明了原因。

好，这就是我向你保证过的那个著名习题。
#sample[
  设 $cal(R)$ 表示以 $(1,0)$ 为圆心、半径为 $1$ 的圆盘。
  计算 $integral.double_(cal(R)) sqrt(x^2+y^2) dif x dif y$。
]
#soln[
  如果你尝试用 $x y$ 积分，那是一场灾难。
  但我们刚看到 $cal(R)$ 的极坐标表达式出奇地好用。
  所以当然令
  $ x = r cos theta , quad y = r sin theta . $
  在这些坐标下，$sqrt(x^2 + y^2) = r$，于是被积函数变成 $r$。

  正如我们刚看到的，区域 $cal(R)$ 由 $-pi/2 <= theta <= pi/2$ 和 $0 <= r <= 2 cos theta$ 组成，所以
  $ integral.double_(cal(R)) sqrt(x^2 + y^2) dif x dif y
    = integral_(theta = - pi / 2)^(pi / 2) integral_(r = 0)^(2 cos theta) r dot underbrace(r dif r dif theta, = dif x dif y)
    = integral_(theta = - pi / 2)^(pi / 2) integral_(r = 0)^(2 cos theta) r^2 dif r dif theta . $

  首先对 $r$ 积分：
  $ integral_(r = 0)^(2 cos theta) r^2 dif r = [r^3 / 3]_(r = 0)^(2 cos theta) = (2 cos theta)^3 / 3
    = (8 cos^3 theta) / (3) . $
  现在把这个结果代回外层积分：
  $ integral_(theta = - pi / 2)^(pi / 2) (8 cos^3 theta) / (3) dif theta = 8 / 3 integral_(theta = - pi / 2)^(pi / 2) cos^3 theta dif theta . $

  要计算 $integral_(theta = - pi/2)^(pi / 2) cos^3 theta dif theta$，
  我们需要求 $cos^3 theta$ 的一个原函数。
  这需要一点三角变换的花招：想法是利用
  $ cos^3 theta = cos theta (1 - sin^2 theta). $
  然后令 $u = sin theta$，于是 $dif u = cos theta dif theta$：
  $ integral_(theta = -pi/2)^(pi / 2) cos^3 theta dif theta = integral_(u=-1)^1 (1 - u^2) dif u = [u - u^3 / 3]_(-1)^1 = (1-1/3) - (-1+1/3) = 4/3. $

  把这个结果代回积分：
  $ 8 / 3 integral_(theta = -pi/2)^(pi / 2) cos^3 theta dif theta = 8 / 3 dot 4 / 3 = #boxed[$ 32/9 $]. #qedhere $
]

== [TEXT] 例子：到处都是难看的平方根或 $x^2+y^2$

另一种出考题、迫使学生使用极坐标的办法，
就是到处塞一堆平方根，让 $x y$ 积分无法进行，
从而必须改用极坐标。
下面是一个可能出现的样子。

#sample[
  计算二重积分
  $ integral_(y=0)^3 integral_(x=-sqrt(9-y^2))^(x=sqrt(9-y^2)) (x^2+y^2)^(5/2) dif x dif y. $
]
#soln[
  由于出现了 $sqrt(9-y^2)$ 和 $(x^2+y^2)^(5/2)$，
  我们几乎被迫使用极坐标。
  事实上，看待我们所积区域的正确方式是：它由
  $ 0 <= y <= 3 " 与 " x^2 + y^2 <= 9 $
  组成，而这只不过是半径为 $3$ 的圆的上半部分。
  所以使用极坐标显然是正确的做法，
  因为积分的上下限好得惊人：
  - 该区域由 $0 <= r <= 3$ 和 $0 <= theta <= pi$ 定义。
  - 被积函数 $x^2 + y^2 = r^2$，所以 $(x^2 + y^2)^(5 \/ 2) = r^5$。

  因此，用极坐标表示的积分变成：
  $ integral_(theta = 0)^pi integral_(r = 0)^3 r^5 dot underbrace(r dif r dif theta, = dif x dif y)
    = integral_(theta = 0)^pi integral_(r = 0)^3 r^6 dif r dif theta . $

  现在对 $r$ 积分：
  $ integral_(r = 0)^3 r^6 dif r = [r^7 / 7]_(r = 0)^3 = 3^7 / 7 = 2187 / 7 . $

  现在对 $theta$ 积分：
  $ integral_(theta = 0)^pi 2187 / 7 dif theta = 2187 / 7 dot pi = (2187 pi) / (7) . #qedhere $
]

你很容易想象，用另一个以别的方式涉及 $x^2+y^2$ 的人造函数，
也能做出类似的题：
#sample[
  计算二重积分
  $ integral_(y=0)^3 integral_(x=-sqrt(9-y^2))^(x=sqrt(9-y^2)) 1/(x^2+y^2+17) dif x dif y. $
]
#soln[
  区域相同，唯一的变化是如何处理里面的东西：
  $ 1 / (x^2 + y^2 + 17) = 1 / (r^2 + 17). $
  所以整个积分变成
  $ integral_(theta=0)^pi integral_(r=0)^3 1/(r^2+17) dot underbrace(r dif r dif theta, = dif x dif y). $
  现在我们来计算内层积分：
  $ integral_(r = 0)^3 (r) / (r^2 + 17) dif r . $
  要积这个，用代换 $u = r^2 + 17$，于是
  $dif u = 2 r dif r$ 或 $(d u) / (2) = r dif r$。
  当 $r = 0$ 时 $u = 17$；当 $r = 3$ 时 $u = 26$。
  积分变成：
  $ integral_(r = 0)^3 (r) / (r^2 + 17) dif r = integral_(u = 17)^26 1 / u dot (d u) / (2) = 1 / 2 integral_(u = 17)^26 1 / u dif u . $
  对 $u$ 积分：
  $ 1 / 2 integral_(u = 17)^26 1 / u dif u = 1 / 2 [log u]_(u=17)^26 = 1 / 2 (log 26 - log 17) = 1 / 2 log 26 / 17 . $

  现在对 $theta$ 积分：
  $ integral_(theta = 0)^pi 1 / 2 log 26 / 17 dif theta = #boxed[$ pi / 2 log 26 / 17 $]. #qedhere $
]

== [TEXT] 例子：用圆的方式描述的区域

另一种迫使学生使用极坐标的办法，是给出一个
一开始就用圆来描述的区域。
同样地，$x y$ 坐标要么不可行，要么至少很烦人。

#sample[
  以 $(0,0)$ 为圆心的单位圆被 $x$ 轴和 $y$ 轴分成四个四分之一圆。
  计算第一象限中那个四分之一圆的质心，
  假设密度分布均匀。
]
#soln[
  为了求第一象限中四分之一圆的质心，
  我们考虑极坐标中由 $0 <= r <= 1$ 和
  $0 <= theta <= pi / 2$ 围成的区域。由于密度
  均匀，我们可以利用对称性和极坐标求出
  质心的坐标 $(dash(x) , dash(y))$。

  把这个四分之一圆记作 $cal(R)$。
  它的面积是单位圆面积的四分之一：
  $ op("面积")(cal(R)) = 1 / 4 pi . $

  在极坐标中，坐标 $x$ 和 $y$ 由下式给出：
  $ x = r cos theta , quad y = r sin theta . $ 质心
  坐标 $(dash(x) , dash(y))$ 由
  $ dash(x) = 1 / (op("面积")(cal(R))) integral.double_cal(R) x dif x dif y ,
    quad dash(y) = 1 / (op("面积")(cal(R))) integral.double_cal(R) y dif x dif y . $
  给出。

  由于 $dif x dif y = r dif r dif theta$，我们可以把
  $integral.double_cal(R) x dif x dif y$ 和 $integral.double_cal(R) y dif x dif y$ 表示如下：

  对于 $dash(x)$，我们有：
  $ integral.double_cal(R) x dif x dif y = integral_(theta = 0)^(pi / 2) integral_(r = 0)^1 r cos theta dot r dif r dif theta = integral_(theta = 0)^(pi / 2) cos theta integral_(r = 0)^1 r^2 dif r dif theta . $

  首先对 $r$ 积分：
  $ integral_(r = 0)^1 r^2 dif r = [r^3 / 3]_(r = 0)^1 = 1 / 3 . $

  因此，
  $ integral.double_cal(R) x dif x dif y = integral_(theta = 0)^(pi / 2) cos theta dot 1 / 3 dif theta = 1 / 3 integral_(theta = 0)^(pi / 2) cos theta dif theta . $

  现在对 $theta$ 积分：
  $ integral_(theta = 0)^(pi / 2) cos theta dif theta = [sin theta]_(theta=0)^(pi / 2) = sin(pi/2) - sin(0) = 1 . $

  所以 $ integral.double_cal(R) x dif x dif y = 1 / 3 . $

  因此，
  $ dash(x) = 1 / (op("面积")(cal(R))) integral.double_cal(R) x dif x dif y = 1 / (pi / 4) dot 1 / 3 = (4) / (3 pi) . $

  由对称性，$dash(y)$ 的计算完全相同，因为这个
  四分之一圆区域关于直线 $y = x$ 对称：
  $ dash(y) = 1 / (op("面积")(cal(R))) integral.double_cal(R) y dif x dif y = (4) / (3 pi) . $
  因此，最终答案是
  $ (dash(x) , dash(y)) = #boxed[$ ((4) / (3 pi) , (4) / (3 pi)) $]. #qedhere $
]

== [SIDENOTE] $r dif r dif theta = (r dif theta) dif r $ 的图示 <sec-jacobian-picture>

下面给出一点图解说明，解释为什么结果 $(r dif theta) dif r$ 讲得通。
这些内容都不在考试范围内，而且实际上也并不精确。
但它应该有助于让你相信 $r dif r dif theta$ 是正确的，
并且更一般地，雅可比行列式是正确的缩放因子。

人们通常画 $dif x dif y$ 的图的方式是：取平面上某个点 $P = (x,y)$，
想象观察从 $P$ 指向 $(x + dif x, y)$
和 $(x, y + dif y)$ 的箭头，其中 $dif x$ 和 $dif y$ 粗略地说就是"微小的位移"。
于是 $dif A$ 画成所得小矩形的面积。
见 @fig-polar-dx-dy，其中两个小箭头用红色画出，
并得到所示的蓝色阴影区域。

#figure(
  image("figures/polar-dA-dx-dy.svg", width: auto),
  caption: [$dif A = dif x dif y$，用红色小箭头画出的图示。],
) <fig-polar-dx-dy>

在 $x y$ 的图中，点 $P$ 本身几乎不起作用；
无论你选哪个点 $P$，小矩形的面积总是 $dif x dif y$。

然而，当你换到极坐标时，$dif A$ 确实依赖于 $P$：
或者说，它不在乎 $theta$，但在乎 $r$。
如果你把起点写成极坐标 $P = (r, theta)_"pol"$，
并画出两个红色箭头指向 $(r + dif r, theta)_"pol"$ 和 $(r, theta + dif theta)_"pol"$，
那么第一个红箭头的长度仍然总是 $dif r$，
但第二个红箭头的长度实际上是 $r dif theta$ --- 它近似是半径为 $r$
的圆上 $dif theta$ 的弧。
你可以在 @fig-polar-dA-dr-r-dtheta 中对两个点 $P_1 = (r_1, theta_1)_"pol"$
和 $P_2 = (r_2, theta_2)_"pol"$ 看到这一点。
点 $P_1$ 靠近原点，所以两个红箭头都很短。
而较远的点 $P_2$ 有一个更长的红箭头，
因为微小的变化 $dif theta$ 被圆的半径放大了。
（有些学生问我，红箭头应该画成弯曲的还是直的。
答案是我不在乎 --- 因为我们认为所有位移都是"微小"的，
把箭头稍微弯曲与让它保持直的之间的差别可以忽略不计。）

#figure(
  image("figures/polar-dA-dr-r-dtheta.svg", width: auto),
  caption: [$dif A = dif r (r dif theta)$ 的图示。
    注意 $r dif theta$ 那个红箭头离原点越远就越大。
  ],
) <fig-polar-dA-dr-r-dtheta>

这两个箭头几乎垂直，所以这个"矩形"的面积是
$ dif A approx dif r dot (r dif theta) $
这正是我们预期的。

那么雅可比是在哪里出现的呢？
让我们在 @fig-polar-jacobian 中把极坐标下的另一个任意点 $P$ 大幅放大。
这与上一幅图类似，但我们选了一个 $theta > 0$ 的点 $P$，
所以两个红箭头都不平行于 $x$ 轴。
新的特点是，现在两个红箭头都写出了它们的 $x$ 和 $y$ 坐标：

- 从 $P$ 到 $(r + dif r, theta)_"pol"$ 的第一个红箭头，用 $x y$ 分量可写成
  $ bf(v)_1 := vec(cos theta dif r, sin theta dif r). $
- 从 $P$ 到 $(r, theta + dif theta)_"pol"$ 的第二个红箭头，用 $x y$ 分量可写成
  $ bf(v)_2 := vec(-r sin theta dif theta, r cos theta dif theta). $

#figure(
  image("figures/polar-dA-jacobian.svg", width: auto),
  caption: [展示极坐标的雅可比在换元公式中从何而来。
    为了便于看清，这幅图夸大地使用了一个很大的 $dif theta$，
    但实际上你应当想象 $dif theta$ 非常小，
    使得阴影区域基本上就是一个矩形。],
) <fig-polar-jacobian>


现在，如果我们愿意用 $bf(v)_1$ 和 $bf(v)_2$ 张成的平行四边形来近似 $dif A$
--- 当 $dif theta$ 和 $dif r$ 真的很小时我们确实愿意这么做
（与这幅为了看清而把 $dif theta$ 画得相当大的漫画不同）---
那么这个近似就由早在 @sec-det-area-vol 中给出的行列式给出：
$ dif A &approx
  lr(|det mat(cos theta dif r, -r sin theta dif theta; sin theta dif r, r cos theta dif theta)|) \
  &= lr(|det mat(cos theta, -r sin theta; sin theta, r cos theta)|) dif r dif theta $
这就是我们一直在等的雅可比行列式！登场了。

任何换元都可以用与 @fig-polar-jacobian 类似的漫画来画，
以完全相同的推理说明雅可比从何而来。
在二维情形中具体说就是，设
$ bf(T)(u,v) = (p(u,v), q(u,v)) $
是任意一般的过渡映射
（所以我们刚做的例子是 $bf(T)(r, theta) = (r cos theta, r sin theta)$）。
对"小的"变化 $dif u$ 和 $dif v$，画出从 $bf(T)(u, v)$ 到 $bf(T)(u + dif u, v)$
和 $bf(T)(u, v + dif v)$ 的红色箭头。
这些向量将近似对应于两个向量
$ bf(v)_1 = bf(T)(u + dif u, v) - bf(T)(u,v) approx partial / (partial u) bf(T)
  = (partial p)/(partial u) ee_1 + (partial q)/(partial u) ee_2 $
以及
$ bf(v)_2 = bf(T)(u, v + dif v) - bf(T)(u,v) approx partial / (partial v) bf(T)
  = (partial p)/(partial v) ee_1 + (partial q)/(partial v) ee_2. $
它们各自给出雅可比矩阵的一行；
然后行列式给出 $bf(v)_1$ 和 $bf(v)_2$ 张成的平行四边形的面积；
这与（雅可比行列式的绝对值）恰好吻合。

三维（以及一般的 $n$ 维）中的论证相同，
只是平行四边形换成了平行六面体，等等。

== [EXER] 习题

#exer[
  计算
  $ integral_(x=0)^(1) integral_(y=0)^(sqrt(1-x^2)) x y dif y dif x. $
] <exer-polar1>

#exer[
  计算
  $ integral.double_((x-1)^2+y^2 <= 1) 1/sqrt(x^2+y^2) dif x dif y. $
] <exer-polar2>

#exerstar[
  计算 $ integral.double_(x^2+y^2 <= 1) sqrt((x+3/5)^2 + (y+4/5)^2) dif x dif y. $
] <exer-polar3>
