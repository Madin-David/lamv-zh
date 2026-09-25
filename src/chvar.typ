#import "@local/evan-zh:1.0.0":*

= 换元 <ch-chvar>

眼下我们只讨论两个变量；
三维的情形完全相同，我们稍后再讲。

== [TEXT] 区间记号

如果你以前没见过，这里先快速说明一个记号问题：

#definition(title: [定义：区间记号])[
  设 $[a,b]$ 与 $[c,d]$ 是 $RR$ 中的闭区间（即 $a <= b$ 且 $c <= d$）。
  我们用 $[a,b] times [c,d]$ 表示由满足
  $a <= x <= b$ 且 $c <= y <= d$ 的点 $(x,y)$ 构成的矩形。
  （因此矩形的四个角点分别是 $(a,c)$, $(a,d)$, $(b,c)$, $(b,d)$。）
]
#example[
  例如 $[0,1] times [0,1]$ 是一个单位正方形，
  其西南角位于原点。
  类似地，$[0,5] times [0,3]$ 是一个宽为 $5$、高为 $3$ 的矩形。
]
#figure(
  image("figures/chvar-rect.svg", width: auto),
  caption: [$[0,5] times [0,3]$ 的图示。它正是 $x$ 属于区间 $[0,5]$、
  而 $y$ 属于闭区间 $[0,3]$ 的点集。],
)

== [TEXT] 过渡映射 <sec-chvar-transition>

事实证明，$x y$ 积分（在三维中则是 $x y z$ 积分）并不总是好算的，
即使你把横向切分和纵向切分都试过也一样。

通常给出的标准例子大致是这样的：
设你想对由四条直线
$ x y = 16/9, #h(1em) x y = 16/25, #h(1em) x = 4 y, #h(1em) y = 4 x. $
所围成的区域积分。
这个区域画在 @fig-chvar-ex 中。
正如我向你保证过的，我认为把这些写成不等式更有助于你思考：
#eqn[
  $ 16/25 <= x y <= 16 / 9 \
  1/4 <= y / x <= 4. $
]
#figure(
  image("figures/chvar-region.svg", width: auto),
  caption: [一个被四条曲线围成的糟糕区域。
  无论沿哪个方向做 $x y$ 积分都会极其烦人。],
) <fig-chvar-ex>

本章介绍一种称为"换元（change of variables）"的技巧，它
让我们在不想做 $x y$ 积分时能够处理这个看起来很烦人的黄色区域。
其想法是用一个不同的坐标系为黄色区域制作一张新的地图。
为此，我需要告诉你一个新术语：

#definition(title: [过渡映射的定义])[
  设 $cal(R)$ 是一个区域。
  令 $cal(R)_"new"$ 是另一个区域，通常是一个矩形。
  $cal(R)$ 的*过渡映射（transition map）*是一个函数 $bf(T) : cal(R)_"new" -> cal(R)$，它把 $cal(R)_"new"$ 变换到 $cal(R)$。

  在 18.02 中，我们总要求除 $cal(R)_"new"$ 的边界之外的所有点
  都映到 $cal(R)$ 中不同的点。
  因此，写它的逆 $bf(T)^(-1)$ 通常也是有意义的。
]

如果 $cal(R)_"new"$ 是一个矩形 --- 再强调一次，这非常常见 ---
那么 $bf(T)$ 有时也被称为一个胞腔（cell）
（例如我的 Napkin 在讨论微分形式时就是这么做的）。

#remark(title: [注：与世界地图的类比])[
  制图学或地理学的爱好者会发现，"映射"这个词给他们带来了正确的直觉。
  如果你把一幅世界地图印在 $8.5 times 11$ 或 A4 大小的纸上，
  它就为你提供了用经度和纬度表示的世界坐标系。
  因此 $cal(R)$ 可以看成地球的表面，
  而 $cal(R)_"new"$ 则是那张矩形纸片。
  （我在这里说了点小谎，因为地球存在于三维空间而不是二维空间，但请先容忍我这么说。）

  地图在某些地方总是会失真，因为地球是弯曲的：
  例如南北两极往往会被拉伸得极其厉害。
  但这没关系 --- *只要每个经度和纬度都给出地球上不同的点，我们就满意了*。
  严格说来，南北极点处有例外，但它们位于边界上，我们就放过不管了。

  这对应于这样一个想法：一个胞腔可以用两个坐标刻画一块复杂的区域。
  见 @fig-xkcd-charts。
]

#figure(
  box(image("media/xkcd-977.png", width: 60%), stroke: 1pt),
  caption: [来自 #link("https://xkcd.com/977/")[XKCD 977] 的其中一种地图投影，
  一幅标题为 _What your favorite map projection says about you_ 的图表。
  如果你好奇的话，里面还有好几种。],
) <fig-xkcd-charts>

那么过渡映射如何帮助我们呢？
好吧，首先让我们展示如何对刚才看到的区域做制图，
然后再来操心积分的事。

关键的想法是，我们需要把过渡函数设计成
$ u = y / x, #h(2em) v = x y $
使得我们之前看到的两个不等式恰好就是
$  1/4 <= u <= 4, #h(2em)  16/25 <= v <= 16/9. $
这样我们就能把黄色区域描绘成一张纸片。
见 @fig-chvar-trans，它对我们非常重要！

#figure(
  image("figures/chvar-trans.svg", width: auto),
  caption: [我们用 $(u,v)$ 构成的矩形作为新区域 $cal(R)_"new"$。
  过渡映射让我们能对区域 $cal(R)$ 做制图。],
) <fig-chvar-trans>

我们究竟要如何写出 $bf(T)$ 的过渡映射呢？
其实写它的_逆_更容易；
在这个语境下，写
$ bf(T)^(-1)(x,y) = (y/x, x y). $
其实更自然。
如果你确实需要 $bf(T)$ 本身，
就要用 $x$ 和 $y$ 解出 $u$ 和 $v$，得到
$ x &= sqrt(v / u) \
  y &= sqrt(u v) $
从而我们的过渡映射恰好由
$ bf(T)(u,v) = (sqrt(v/u), sqrt(u v)). $
给出。
不过，实际上就积分而言（我们会在下一节看到），
你完全可以只用 $bf(T)^(-1)$ 的公式。

== [TEXT] 有了过渡映射之后如何积分

如果你还记得 18.01 中的换元，
那么 18.02 的版本是它的成人版，其中改用过渡映射。

#definition(title: [定义：雅可比行列式])[
  设 $bf(T)$ 是从 $RR^n$ 中一个区域到 $RR^n$ 的过渡映射。
  *雅可比矩阵（Jacobian matrix）*是这样的矩阵：
  它的每一行是各分量写成行向量后的梯度；
  *雅可比行列式*就是它的行列式。
  在本讲义中，我们用 $J_(bf(T))$ 表示该矩阵
  （并用 $det J_(bf(T))$ 表示其行列式）。
]

例如在 $2 times 2$ 的情形下，如果过渡映射 $bf(T)(u,v)$
写成 $bf(T)(u,v) = (p(u,v), q(u,v))$，那么
$ J_(bf(T)) = mat(
  (partial p)/(partial u), (partial p)/(partial v);
  (partial q)/(partial u), (partial q)/(partial v)
). $

#example[
  我们来考虑之前看到的过渡映射 $bf(T)(u,v)$，即
  $ bf(T)(u,v) = (sqrt(v/u), sqrt(u v)). $
  我们通过求两个偏导数来计算 $(u,v) |-> sqrt(v/u)$ 的梯度：
  $ partial / (partial u) sqrt(v/u) &= -1/2 u^(-3/2) v^(1/2) \
    partial / (partial v) sqrt(v/u) &= 1/2 u^(-1/2) v^(-1/2). $
  另一个分量 $(u,v) |-> sqrt(u v)$ 的梯度如下：
  $ partial / (partial u) sqrt(u v) &= 1/2 u^(-1/2) v^(1/2) \
    partial / (partial v) sqrt(u v) &= 1/2 u^(1/2) v^(-1/2). $
  所以 $bf(T)$ 的雅可比矩阵是
  $ J_(bf(T)) = mat(-1/2 u^(-3/2) v^(1/2), 1/2 u^(-1/2) v^(-1/2);
     1/2 u^(-1/2) v^(1/2), 1/2 u^(1/2) v^(-1/2)). $
]
#example[
  我们也可以求_逆_映射的雅可比矩阵，
  也就是过渡映射 $bf(T)^(-1) : cal(R) -> cal(R)_"new"$，它由
  $ bf(T)^(-1)(x,y) = (y/x, x y). $
  定义。
  换言之，这是把 $(x,y)$ 变换成 $(u,v)$ 的映射。
  这其实没那么痛苦，因为你不必到处处理平方根。
  $ partial / (partial x) (y/x) &= -y/x^2, &#h(2em) partial / (partial y) (y/x) &= 1/x \
    partial / (partial x) (x y) &= y, &#h(2em) partial / (partial y) (x y) &= x. $
  所以 $bf(T)^(-1)$ 的雅可比矩阵是
  $ J_(bf(T)^(-1)) = mat(-y/x^2, 1/x; y, x). $
]

好了，现在来看结果。
我们会把这个定理的论证推迟到 @sec-jacobian-picture，
因为我想先做几个具体的例子，再画出正确的图。

#memo(title: [记住：换元])[
  设你需要积分 $integral.double_(cal(R)) f(x,y) dif x dif y$，
  并且有一个过渡映射 $bf(T)(u,v) : cal(R)_"new" -> cal(R)$。
  那么这个过渡映射让你可以如下改变这个积分：
  $ integral.double_(cal(R)) f(x,y) dif x dif y = integral.double_(cal(R)_"new") f(x,y) lr(|det J_(bf(T))|) dif u dif v $
  或者，如果计算 $J_(bf(T)^(-1))$ 更容易，下面的公式同样可用：
  $ integral.double_(cal(R)) f(x,y) dif x dif y = integral.double_(cal(R)_"new") f(x,y) / (lr(|det J_(bf(T)^(-1))|)) dif u dif v $
  不过在后一种情形下，你的雅可比行列式中会含有 $x$ 和 $y$，
  你需要把它们换回 $u$ 和 $v$。
]
这里 $|det J_(bf(T))|$ 被称为*面积缩放因子（area scaling factor）*：
它是雅可比矩阵行列式的绝对值。
确实有 $ det J_(bf(T)^(-1)) = 1 / det(J_(bf(T))) $，
这意味着如果你的过渡映射的逆比原映射更漂亮，
你可能更愿意改用那个。

#typesig[
  面积缩放因子总是一个_非负_实数。
]

#tip[
  如果你写成
  $ dif u dif v = |det J_(bf(T)^(-1))| dif x dif y $
  可能会更容易记住这两个公式，
  因为这样它看起来更像 18.01 中的 $dif u = (partial u) / (partial x) dif x$。
  （实际上 18.01 的公式正是 $1 times 1$ 矩阵的特殊情形！）
]

#digression(title: [题外话：$dif u dif v$ 的含义])[
  在 18.02 中，等式 $dif u dif v = |det J_(bf(T)^(-1))| dif x dif y$
  目前更像是一个助记符，而不是一个真正的等式；
  这是因为在 18.02 中我们不给出 $dif x$ 或 $dif y$ 含义的定义。
  借助所谓的_微分形式（differential form）_，它可以变成精确的陈述。
  这超出了 18.02 的范围，其不幸的后果是
  我无法为换元公式为何成立给出形式化的解释。
  即便如此，稍后见 @sec-jacobian-picture，那里有一个非正式的说明。
]

这相当于 18.01 中你做从 $x$ 到 $u$ 的换元时的情形
（有时称为 $u$ 代换），那时你把 $dif x$ 换成 $(dif x)/(dif u) dif u$。
在 18.02 中，18.01 里的导数被巨大的雅可比行列式所取代。

下面看一个如何执行这个积分的例子。

#sample[
  计算第一象限中由曲线
  $ x y = 16/9, #h(1em) x y = 16/25, #h(1em) x = 4 y, #h(1em) y = 4 x. $
  所围成的区域 $cal(R)$ 的面积。
]
#soln[
  在前面几节中，我们引入了变量 $u = y/x$ 和 $v = x y$，
  并考虑了区域 $ cal(R)_"new" = [1/4, 4] times [16/25, 16/9] $，
  也就是我们之前描述的那个矩形中的点对 $(u,v)$。
  我们构造了一个过渡映射 $bf(T) : cal(R)_"new" -> cal(R)$，它可写成
  $ bf(T)(u,v) &= (sqrt(v/u), sqrt(u v)) \
    bf(T)^(-1)(x,y) &= (y/x, x y). $
  我们不喜欢平方根，所以我们将使用 $bf(T)^(-1)$ 的雅可比矩阵的行列式，它是
  $ det (J_(bf(T)^(-1))) = detmat(-y/x^2, 1/x; y, x)
    = (- y / x^2) dot x - 1 / x dot y = - y / x - y / x = - (2 y) / (x) . $
  由于我们用的是公式的倒置版本，我们需要
  通过已给的公式把它换回 $u$ 和 $v$。
  这里由于 $u = y / x$，你只要看一眼就能做到：
  $ det (J_(bf(T)^(-1))) = - 2 u. $
  $
    op("面积")(cal(R))
    &= integral_(u = 1 / 4)^4 integral_(v = 16 / 25)^(16 / 9) 1/lr(|det (J_(bf(T)^(-1)))|) dif v dif u \
    &= integral_(u = 1 / 4)^4 integral_(v = 16 / 25)^(16 / 9) 1/(2u) dif v dif u \
    &= integral_(u = 1 / 4)^4 1/(2u) dot (16/9-16/25) dif u \
    &= 128/225 integral_(u = 1 / 4)^4 1/(u) dif u \
    &= 128/225 (log 4 - log (1/4)) = #boxed[$ (512 log 2) / 225 $]. #qedhere
  $
]

== [TEXT] 另一个例子：单位圆盘的面积 <sec-chvar-polar>

#sample[
  证明单位圆盘（unit disk）$x^2 + y^2 <= 1$ 的面积是 $pi$。
]

#soln[
  出于很快就能明白的原因，
  这个问题中我们使用字母 $r$ 和 $theta$ 而不是 $u$ 和 $v$。
  这一次，我们制图师所用的过渡映射由
  $ bf(T) : [0,1] times [0, 2pi] &-> RR^2 \
    bf(T)(r, theta) &:= (r cos theta, r sin theta). $
  给出。
  你可能认出这就是极坐标。
  这给了我们一种把单位圆盘画成矩形地图的方法；见图。
  #figure(
    image("figures/chvar-polar.svg", width: auto),
    caption: [映射 $bf(T) : [0,1] times [0,2pi] -> RR^2$，它的像是单位圆盘。],
  ) <fig-chvar-polar>

  （细心的同学可能会注意到，从 $(0,0)$ 到 $(1,0)$ 的线段上的点
  在过渡映射下被重复映了不止一次；
  再次强调，在 18.02 中我们允许边界上出现这种重复。）

  我们计算 $bf(T)$ 的雅可比：
  $ J_(bf(T)) = mat(
      partial / (partial r) (r cos theta),
      partial / (partial theta) (r cos theta);
      partial / (partial r) (r sin theta),
      partial / (partial theta) (r sin theta))
    = mat(cos theta, - r sin theta; sin theta, r cos theta). $
  于是面积缩放因子是
  $ |det J_(bf(T))| =
    detmat(cos theta, - r sin theta; sin theta, r cos theta)
    = r cos^2 theta - (-r sin^2 theta) = r(cos^2 theta + sin^2 theta) = r. $
  因此，这个过渡映射给出如下换元：
  $ integral.double_(x^2+y^2=1) 1 dif x dif y
    = integral_(r=0)^1 integral_(theta=0)^(2 pi) r dif theta dif r. $
  这个积分很容易算：
  $
    integral_(r=0)^1 ( integral_(theta=0)^(2 pi) r dif theta) dif r
    &= integral_(r=0)^1 ( 2 pi r ) dif r \
    &= 2 pi integral_(r=0)^1 ( r ) dif r \
    &= 2 pi [r^2/2]_(r=0)^(r=1) = #boxed[$ pi $]. #qedhere
  $
]

#tip(title: [提示：记住正向与反向])[
  如果你分不清哪个方向是"正向"
  （即使用 $|det J|$）哪个方向是"反向"
  （即使用 $1/(|det J|)$），不妨
  看看 @table-chvar-side-by-side，把它们并排对照。
  只要记住：_极坐标_那个是正向，所以我们得到 $dif x dif y = r dif r dif theta$。
]
#figure(
  table(
    columns: 3,
    align: (left, center, center),
    table.header([例子], [正向], [反向]),
    [例子的设定],
      [$ x = r cos theta \ y = r sin theta $],
      [$ u = y slash x \ v = x y $],
    [例子的雅可比矩阵],
      [$ mat(cos theta, -r sin theta; sin theta, r cos theta) $],
      [$ mat(-y slash x^2, 1 slash x; y, x) $],
    [例子的雅可比行列式],
      [$ r $],
      [$ -2 y slash x = -2u $],
    [例子的换元],
      [$ dif x dif y = r dif r dif theta $],
      [$ dif u dif v = 2u dif x dif y \ dif x dif y = 1/(2u) dif u dif v $],
  ),
  caption: [
    对我们刚做的两个例子，并排比较正向与反向的换元。
  ],
  kind: table
) <table-chvar-side-by-side>


== [TEXT] 例子：椭圆的面积 <sec-ex-ellipse>

一旦知道了圆的面积，我们也可以通过_化归_为圆的面积来计算椭圆的面积，
方法如下。

#sample[
  设 $a,b > 0$ 是正实数。
  计算椭圆
  $ x^2/a^2 + y^2/b^2 = 1. $
  内部的面积。
]
#soln[
  设 $cal(R)$ 是椭圆的内部。
  考虑由
  $ x = a u \ y = b v. $
  定义的变换 $bf(T)$。
  也就是说 $bf(T)(u,v) = (a u, b v)$。
  这个矩阵的雅可比很容易计算：
  $ J_(bf(T)) = mat(
    partial/(partial u) (a u), partial/(partial v) (a u);
    partial/(partial u) (b v), partial/(partial v) (b v))
    = mat(a, 0; 0, b) $
  其行列式为 $a b$。

  这个变换给出了区域之间的一个映射
  $ bf(T) : {u^2 + v^2 <= 1} -> cal(R) = {x^2/a^2 + y^2/b^2 <= 1}. $

  因此，通过换元，$cal(R)$ 的面积满足
  $ op("面积")(cal(R)) &= integral.double_(cal(R)) 1 dif x dif y \
    &= integral.double_(u^2+v^2 <= 1) det J_(bf(T)) dif u dif v \
    &= a b  integral.double_(u^2+v^2 <= 1) dif u dif v. \
    &= a b  op("面积")({u^2+v^2<=1}) = a b pi. #qedhere $
]

为了把这个例子画成图，
其想法是我们用换元把椭圆映成一个_圆_，
其中雅可比行列式是常值函数 $a b$。
该行列式可以提出来，于是我们得到上面的结果。

== [SIDENOTE] 提示：分解矩形上的积分

尤其是在极坐标中，你常常会发现积分具有如下形状
$ integral_(u="数")^("数") integral_(v="数")^("数")
  f(u) g(v) dif v dif u $
也就是说，被积部分干净地分解为含 $u$ 的部分
与含 $v$ 的部分的乘积。
在这种情况下，如果你想象真正去做这个积分，
你会发现它其实就等于
$ (integral_(u="数")^("数") f(u) dif u)
  ( integral_(v="数")^("数") g(v) dif v). $

例如，考虑下面这个简单的问题及解答。
#sample[
  计算 $ integral_(x=0)^1 integral_(y=0)^pi e^x sin(y) dif y dif x. $
]
#soln[
  该积分可以写成：
  $ integral_(x = 0)^1 e^x (integral_(y = 0)^pi sin (y) dif y) dif x . $
  内层积分是
  $ integral_(y = 0)^pi sin (y) dif y = [- cos (y)]_(y = 0)^pi = (- cos (pi)) - (- cos (0)) = (- (- 1)) - (- 1) = 1 + 1 = 2 . $
  把结果代回积分：
  $ integral_(x = 0)^1 e^x dot 2 dif x = 2 integral_(x = 0)^1 e^x dif x
    = 2 [e^x]_(x = 0)^1 = 2(e^1 - e^0) = #boxed[$ 2e-2 $]. #qedhere $
]
如果你留意上面的解答，
就会注意到 $integral_(y=0)^pi sin(y) dif y = 2$ 其实只是一个数，
它被立刻提到了积分号外。
所以实际上，我们其实有
$ integral_(x=0)^1 integral_(y=0)^pi e^x sin(y) dif y dif x
  = (integral_(x=0)^1 e^x dif x) (integral_(y=0)^pi sin(y) dif y). $
这算是一个便利之处，也许能省下一点脑力。
这是个很小的优化，但值得指出。
#tip[
  注意寻找这个常见模式
  $ integral_(u="数")^("数") integral_(v="数")^("数")
    f(u) g(v) dif v dif u
    = (integral_(u="数")^("数") f(u) dif u)
      ( integral_(v="数")^("数") g(v) dif v). $
]
记住，如果被积函数无法分解，
或者积分的上下限不是常数
（即 $v$ 的上下限依赖于 $u$），这招就不管用。

作为另一个用例，在我们刚做的极坐标积分中，我们有
$ integral_(r=0)^1 integral_(theta=0)^(2 pi) r dif theta dif r
  = (integral_(r=0)^1 r dif r)(integral_(theta=0)^(2 pi) dif theta)
  = [r^2/2]_(r=0)^(r=1) dot (2 pi) = pi. $
（下一章要讲的极坐标经常出现这种模式。
你要积的东西往往完全不依赖于 $theta$。）

== [EXER] 习题

#exer[
  设 $cal(R)$ 是以 $(0,0)$, $(1,2)$ 和 $(2,1)$ 为顶点的三角形
  上及其内部的全部点。
  计算 $ integral.double_(cal(R)) (x+y)^2/(x y) dif x dif y. $
  （推荐做法：用 $u = x + y$ 和 $v = x / y$ 做换元。）
] <exer-chvar-triangle>
