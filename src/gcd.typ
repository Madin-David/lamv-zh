#import "@local/evan-zh:1.0.0":*

= 梯度、旋度与散度 <ch-gcd>

本章的目标是_定义_海报中每一个单独的红色箭头。
对每一个红色箭头，我们都会向你展示

- 如何计算它，以及
- 如何在水中情境下把它可视化。

本章不涉及积分，所以实际上相当直截了当。

#figure(
  table(
    columns: 6,
    align: left,
    table.header([红色箭头], [符号], [输入类型], [每一点的 \ 输出], [输入示例], [输出示例]),
    [梯度], [$nabla f$], [标量场], [向量], [到瀑布顶端的距离的度量], [指向较低海拔的瀑布水流],
    [旋度], [$nabla times f$], [三维向量场], [三维向量], [漩涡水流], [与旋转轴对齐的箭头，模长即旋转速率],
    [散度], [$nabla dot f$], [三维向量场], [标量], [水流], [抽水/排水速率],
    [二维旋度], [$(partial g) / (partial x) - (partial f) / (partial y)$ \ 其中 \ $bf(F) = (f,g)$], [二维向量场], [标量], [漩涡水流], [角速度],
    [二维散度], [$nabla dot bf(F)$], [二维向量场], [标量], [水流], [抽水/排水速率],
  ),
  caption: [这些红色箭头，外加一个二维散度，它是二维旋度的一个改版。],
  kind: table
)

== [SIDENOTE] 水中情境不太可能提高你的考试分数

顺便说一句，关于水中情境，我简单说几句。
对其中每一个量，我都试图告诉你如何在现实生活中理解它。
这可能有助于你内化并记住这些结果。
然而，在真正的 18.02 考试中，你会发现你要对其求旋度或散度的
大多数函数都是相当人为构造出来的函数。
所以你的水中直觉对实际做计算来说基本上派不上用场。

这有点像在 18.01 中，你被告知导数衡量的是变化率。
但到了微积分期末考试，题目却会问你诸如
"求 $f(x) = sin(e^x)^2$ 的导数" 之类的东西。
知道 $f'(x)$ 是 $f$ 的变化率大概帮不上什么忙，
因为函数 $f$ 完全是人为构造的，永远不会在现实生活中出现。
那道题真正考查的是你能否套用一种方法，
用链式法则算出 $f'(x) = 2e^x sin(e^x) cos(e^x)$。

本章也是如此。
关于梯度、旋度、散度的考题往往使用人为构造的函数。
所以水中直觉不会直接有什么帮助，
你只需要擅长照着方法做。

出于这个原因，在这些讲义里，我甚至懒得去解释
旋度和散度的公式是从哪里来的。
许多人尝试过，许多人都失败了。
如果你想看成年人们怎么讨论这件事，
见 #url("https://mathoverflow.net/q/21881/70654")，
其中最高票的评论是 "我的建议：在这个层次上，_严格_照着教科书来"。
（我知道，这有点居高临下。）

== [TEXT] 梯度

你在 @ch-grad 中已经知道怎么做了。
函数 $f$ 给 $RR^n$ 中每个点指定某个数，
然后 $nabla f$ 指向 $f$ 增长最快的方向。
在我们的水中例子中，你可以想象你有一个瀑布，
$f$ 衡量到瀑布顶端的距离，
而 $nabla f$ 就笔直指向下方。

== [TEXT] 旋度

下面是三维空间中旋度的定义。

#definition(title: [旋度的定义])[
  设
  $ bf(F)(x,y,z) = vec(p(x,y,z),q(x,y,z),r(x,y,z)) $
  是一个三维向量场。
  那么 $bf(F)$ 的*旋度*是由下式定义的向量场
  $ op("旋度") bf(F) := nabla times bf(F)
    := vec(
      (partial r)/(partial y) - (partial q)/(partial z),
      (partial p)/(partial z) - (partial r)/(partial x),
      (partial q)/(partial x) - (partial p)/(partial y) ). $
]

#typesig[
  旋度只接受一个三维向量场作为输入。
  每一点的旋度是一个三维向量
  （也就是说，三维向量场的旋度本身仍是一个三维向量场）。
]

#tip(title: [提示：如何记住旋度])[
  在实际中，所有人都用下面这个助记法来记这个公式：
  $ nabla times bf(F) = detmat(ee_1, ee_2, ee_3;
    (partial)/(partial x), (partial)/(partial y), (partial)/(partial z);
    p, q, r). $
  这个等式通不过类型安全检查，因为这里的“矩阵”的各个元素
  是函数、向量和偏导数算子的某种混合体，
  所以它绝对讲不通。
  尽管如此，如果你无视所有类型安全的警告
  并试着“展开”这个表达式，
  你会发现它基本上就给出上面旋度的公式。（试试看。）

  这就是为什么记号选成 $nabla times bf(F)$。
  你几乎可以想象
  $ nabla = vec((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $
  在这种情况下，上面的行列式就是叉积的那个老助记法。
  再说一次，这在数学上绝对零意义。
  它只是一种方便的记公式方式，
  但它效果非常好，因为你只需要记住 "$nabla times bf(F)$"。
]

#sample[
  计算向量场
  $ bf(F) (x , y , z) = vec(x y, y z, z x). $
  的旋度。
]
#soln[
  令 $p(x,y,z) = x y$，$q(x,y,z) = y z$，$r(x,y,z) = z x$。
  我们可以通过计算下式来求出旋度的第一个分量
  $ (partial r) / (partial y) &= (partial) / (partial y) (z x) = 0 \
    (partial q) / (partial z) &= (partial) / (partial z) (y z) = y. $
  因此：
  $ (partial r) / (partial y) - (partial q) / (partial z) = (0 - y) = - y $
  就是旋度的第一个分量。

  第二个和第三个分量用同样的方法来做。
  第二个分量是
  $ ((partial p) / (partial z) - (partial r) / (partial x)) = (0 - z) = - z $
  而第三个分量是
  $ ((partial q) / (partial x) - (partial p) / (partial y)) = (0 - x) = - x. $
  因此
  $ nabla times bf(F) = #boxed[$ vec(-y, -z, -x) $]. #qedhere $
]

现在我们来谈谈水中直觉。
像我们对大多数例子那样，
设向量场 $bf(F)$ 表示海洋或其他水体中水的流动。
我们把旋度理解为刻划水在每一点的局部旋转
或打旋运动。

你可以这样想象旋度：

1. #strong[在你想测量旋度的位置放一个小桨轮]（或者想象一个能旋转的小物体，
  比如一根两端插着小旗的棍子）到水中。

2. #strong[观察轮子如何因水流而转动]。如果
  水沿直线均匀流动，轮子不会
  转动。在这种情况下，该点的旋度为零，因为流动中
  没有局部旋转。

3. #strong[如果轮子旋转]；这表明水中存在局部
  旋转运动。
  该点的旋度是一个三维向量，所以有两条信息：

  - 轮子旋转的 #strong[方向] 与旋度的方向有如下对应关系。
    轮子的 #strong[旋转轴] 会指向该点旋度向量的方向。
    例如，如果水使轮子从上方看去逆时针旋转，
    那么旋度向量指向上方。
    如果轮子顺时针旋转，那么旋度向量指向下方。

  - 旋度的 #strong[模长] 与轮子旋转的快慢有关。
    旋转越快意味着旋度越强，表明
    水流中的局部旋转运动越剧烈。

旋度大与旋度小的例子：

- 在水以漩涡状模式环流的区域，
  旋度很大，因为水在绕一个
  中心点快速旋转。

- 在平静、沿直线运动的水流中，旋度很小或为零，
  因为水没有表现出任何明显的旋转。

简而言之，在我们水流的情境中，向量场 $bf(F)$ 的旋度
衡量的是水绕每一点旋转的倾向，
而不只是沿直线运动。
用小桨轮把它可视化有助于传达局部
旋转运动这一想法，其中旋度向量指明了
该旋转的方向和强度。

现在，我早些时候向你承诺过，任意两个红色箭头组合在一起都给出 $0$。
所以现在我们证明下面这件事。
#memo(title: [记住：保守场的旋度为零])[
  设 $f : RR^3 -> RR$ 是一个函数（也叫标量场），
  并令 $nabla f$ 为对应的保守向量场。
  那么（假设 $nabla f$ 连续可微），
  $nabla f$ 的旋度在每一点都是 $bf(0)$，即
  $ op("旋度")(nabla f) = nabla times (nabla f) = bf(0). $
]
#figure(
  box(image("figures/gcd-cut-gc.svg", width: auto), stroke: 1pt),
  caption: [从海报 @poster-stokes 中剪出的两个红色箭头，它们链式组合后给出零。],
)


其实你可以很容易地按定义验证这个定理：
#proof[
  由于
  $ nabla f = vec( (partial f)/(partial x), (partial f)/(partial y), (partial f)/(partial z)) $
  我们得到
  $ op("旋度")(nabla f) = vec(
      f_(z y) - f_(y z),
      f_(x z) - f_(z x),
      f_(y x) - f_(x y)) = vec(0,0,0) $
  因为我们在 @sec-when-antigrad 中看到 $f_(z y) = f_(y z) = 0$，等等。
]

然而，更重要的是从直观上理解它为什么成立。
记住，在水流的情境中，
梯度的旋度为零这一事实意味着：如果流动完全由梯度驱动
（例如水因压强差或高度差而流动），
那么水中不会有任何旋转运动。
例如，如果你有一个瀑布，
水会直接向下或向上流，没有任何打转或旋转。

下面是一个说明这一点的例子：
#sample[
  计算向量场
  $ bf(F)(x,y,z) = vec(y^2-sin(x), 2 x y + 4 y z, e^z+2y^2). $
  的旋度。
]
偷偷说一句，我们恰好知道右端
是函数 $f(x,y,z) = y^2 x + cos x + 2y^2 z + e^z + C$ 的梯度；
这是 @sec-antideriv 中的最后一个例子。
所以凭借这条内部消息，我们预期答案应该是 $bf(0)$。
确实如此：
#soln[
  令 $p(x,y,z) = y^2-sin(x)$，$q(x,y,z) = 2 x y + 4 y z$，$r(x,y,z) = e^z+2y^2$。
  先计算 $(partial r) / (partial y)$ 和 $(partial q) / (partial z)$：
  $ (partial r) / (partial y) &= (partial) / (partial y) (e^z + 2 y^2) = 4 y $
  $ (partial q) / (partial z) &= (partial) / (partial z) (2 x y + 4 y z) = 4 y. $
  计算第一个分量：
  $ ((partial r) / (partial y) - (partial q) / (partial z)) = 4 y - 4 y = 0. $

  对第二个分量，计算 $(partial p) / (partial z)$ 和 $(partial r) / (partial x)$：
  $ (partial p) / (partial z) &= (partial) / (partial z) (y^2 - sin x) = 0 \
    (partial r) / (partial x) &= (partial) / (partial x) (e^z + 2 y^2) = 0. $
  因此
  $ ((partial p) / (partial z) - (partial r) / (partial x)) = 0 - 0 = 0. $

  最后，计算 $(partial q) / (partial x)$ 和 $(partial p) / (partial y)$：
  $ (partial q) / (partial x) &= (partial) / (partial x) (2 x y + 4 y z) = 2 y \
    (partial p) / (partial y) &= (partial) / (partial y) (y^2 - sin x) = 2 y. $
  计算第三个分量：
  $ ((partial q) / (partial x) - (partial p) / (partial y)) = 2 y - 2 y = 0. $

  所以向量场 $bf(F) (x , y , z)$ 的旋度
  是 $vec(0,0,0) = #boxed[$ bf(0) $] $。
]
因此这是一个_保守_向量场的例子，我们稍后会更多地谈到它。

== [TEXT] 散度

#definition(title: [散度的定义])[
  设
  $ bf(F)(x,y,z) = vec(p(x,y,z),q(x,y,z),r(x,y,z)) $
  是一个三维向量场。
  那么 $bf(F)$ 的*散度*是由下式定义的标量场
  $ op("div")(bf(F)) := nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y) + (partial r)/(partial z). $
]

#typesig[
  散度以向量场作为输入。
  每一点的散度是一个_数_（也就是一个标量场）。
]


#tip(title: [提示：如何记住散度])[
  记号 $nabla dot bf(F)$ 也应该是为了助记。
  如果你延续这样的类比
  $ nabla = vec((partial)/(partial x), (partial)/(partial y), (partial)/(partial z)) $
  那么 $nabla dot bf(F)$ 看起来就像一个点积，而且它做的事恰好是对的。
  再说一次，这只是为了记忆；在数学上这完全是一派胡言。
]

#sample[
  计算向量场
  $ bf(F) (x , y , z) = vec(x y, y z, z x). $
  的散度。
]
#soln[
  令 $p(x,y,z) = x y$，$q(x,y,z) = y z$，$r(x,y,z) = z x$。
  那么
  $ (partial p) / (partial x) &= (partial) / (partial x) (x y) = y \
    (partial q) / (partial y) &= (partial) / (partial y) (y z) = z \
    (partial r) / (partial z) &= (partial) / (partial z) (z x) = x. $
  把各个偏导数加起来就得到散度：
  $ nabla dot bf(F) & = (partial F_1) / (partial x) + (partial F_2) / (partial y) + (partial F_3) / (partial z)\
    & = y + z + x = #boxed[$ x + y + z $]. #qedhere $
]

现在我们来谈谈水中情境。
再次设 $bf(F)$ 表示
海洋或其他水体中水的流动。
为了把向量场 $bf(F)$ 的散度可视化，
要把散度想成是在衡量水在每一点 #strong[向外扩散] 或
#strong[向内汇聚] 的程度。

你可以这样想象它：

1. #strong[在水中流动的某一点放一个小标记]（比如一个漂浮的物体）。
  目的是观察水在该点周围如何流动。

2. #strong[如果水看起来是向外流的]；就好像水从该点被发射出来，
  那么该处的散度是 #strong[正的]。这表明离开该点的水比流向它的水多，
  说明这里有一个局部的水源。

3. #strong[如果水看起来是向内流的]；就好像水被吸进该点，
  那么散度是 #strong[负的]；。
  这表明水在该点汇聚，说明这里有一个局部的汇
  或水的耗竭。

4. #strong[如果向内或向外的净流动都不明显]（水在动，
  但既不扩散也不汇聚），那么散度为零。
  这表明流入和流出该点的水量净变化为零。

散度大与散度小的例子：

- 在水从某个源被抽送向外的区域，
  散度很大且为正，表明水
  从该点向外扩散。

- 在水被吸入某个排水口的区域，散度为负，
  表明水向该点汇聚。

- 在水均匀流动、既无源也无汇的区域，
  散度为零，因为流入或流出
  任何一点的净流量都为零。

总之，在水流的情境中，向量场 $bf(F)$ 的散度
衡量的是水在每一点向外扩散
（正散度）或向内汇聚（负散度）的速率。
如果既不扩散也不汇聚，散度就是零。

#digression(title: [题外话：关于旋度的散度])[
  我跟你说过，海报 @poster-stokes 中任意两个红色箭头组合起来都能给你零。
  所以严格来说有一个定理说旋度的散度为 0：也就是
  $ op("div")(op("旋度")(bf(F))) = nabla dot (nabla times bf(F)) = 0 $
  假设 $bf(F)$ 有二阶连续偏导数。
  不过，我认为我们在 18.02 中从来没用过它。
  问题在于，我们对散度的描述假设所讨论的向量场
  被想成一股水流，
  但 $op("旋度")(bf(F))$ 是描述某物旋转快慢的向量场，
  而那些箭头断然_不是_一股水流（也不是任何类似水流的东西）。
]

== [TEXT] 二维标量旋度

二维标量旋度稍微不那么自然。
物理解释是一样的，
但如果你有一片二维的水体，旋转只有两种方式：
要么顺时针，要么逆时针。
（相比之下，如果你把一个桨轮放进海洋里，它可以旋转的方式有_很多_种。）

所以，二维标量旋度名副其实，在每个点只*输出一个数*，
你可以把它想成旋转的桨轮的角速度。
与通常的三维旋度不同，这里不再需要指定一整个向量
才能谈论旋转方向。
我们反而采用这样的约定：

- 正数表示逆时针旋转，
- 负数表示顺时针旋转。

#definition(title: [二维标量旋度的定义])[
  设
  $ bf(F)(x,y) = vec(p(x,y),q(x,y)) $
  是一个二维向量场。
  那么 $bf(F)$ 的*二维标量旋度*是由下式定义的标量场
  $ op("旋度") bf(F) := (partial q) / (partial x) - (partial p) / (partial y). $
]

#tip(title: [提示：二维标量旋度是三维标量旋度的特例])[
  助记法 $nabla times bf(F)$ 其实仍然有效，只要你假装 $bf(F)$
  是一个 $z$ 坐标恒为零的三维向量场。
  也就是说，给定 $bf(F) = vec(p(x,y), q(x,y))$，考虑助记式
  $ nabla times vec(p(x,y), q(x,y), 0). $
  如果你一路推下去，你会发现你得到
  $ detmat(ee_1, ee_2, ee_3;
      partial / (partial x), partial / (partial y), partial / (partial z);
      p(x,y), q(x,y), 0). $
  所有涉及 $partial / (partial z)$ 的项都消失了，因为任何地方都没有 $z$。
  于是只有 $ee_3$ 前面的项存活下来，你得到
  $ detmat(partial / (partial x), partial / (partial y); p(x,y), q(x,y)) ee_3
      = ((partial q) / (partial x) - (partial p) / (partial y)) ee_3. $
  这就是二维标量旋度，即 $ee_3$ 的系数。
]

#sample[
  计算
  $ bf(F)(x,y) = vec(x cos y , e^x + sin y). $
  的二维标量旋度。
]
#soln[
  二维标量旋度由下式给出
  $ op("旋度") F = (partial q) / (partial x) - (partial p) / (partial y). $
  给定 $q(x,y) = e^x + sin y$，我们有
  $ (partial q) / (partial x) = (partial) / (partial x) (e^x + sin y) = e^x + 0 = e^x. $
  给定 $p(x,y) = x cos y$，我们有
  $ (partial p) / (partial y) = (partial) / (partial y) (x cos y) = x (- sin y) = - x sin y. $
  因此
  $ op("旋度") bf(F)(x,y) = #boxed[$ e^x + x sin y $]. #qedhere $
]
下面这一点仍然成立（而且实际上可由三维版本推出）：
#memo[
  保守二维向量场的二维标量旋度在每一点都为零。
]
#figure(
  box(image("figures/gcd-cut-gc2.svg", width: auto), stroke: 1pt),
  caption: [海报 @poster-stokes 中这两个红色箭头链式组合后也给出零。],
)

我们来看一个这样的例子。
#sample[
  计算
  $ bf(F) (x , y) = vec(3 x^2 + 4 x y + y^2 , 2 x^2 + 2 x y - 3 y^2). $
  的二维标量旋度。
]
偷偷说一句，我们恰好知道右端
是函数 $f(x,y) = x^3 + 2x^2 y+x y^2-y^3$ 的梯度，
因为我们在 @sec-antideriv 中做过这个例子。
所以二维标量旋度应该是 $0$，确实如此。
#soln[
  给定 $q(x,y) = 2 x^2 + 2 x y - 3 y^2$：
  $ (partial q) / (partial x) & = (partial) / (partial x) (2 x^2 + 2 x y - 3 y^2)\
    & = 4 x + 2 y $
  给定 $p(x,y) = 3 x^2 + 4 x y + y^2$：
  $ (partial p) / (partial y) & = (partial) / (partial y) (3 x^2 + 4 x y + y^2)\
    & = 4 x + 2 y. $
  因此
  $ op("旋度") bf(F)(x,y) & = (partial q) / (partial x) - (partial p) / (partial y)\
     & = (4 x + 2 y) - (4 x + 2 y) = #boxed[$ 0 $]. #qedhere $
]

== [TEXT] 二维散度

这_不是_图中的红色箭头。
但它出现在格林定理的某个版本中，而且它其实与三维情形完全一样。
所以我只简要提一下。

#definition(title: [散度的定义])[
  设
  $ bf(F)(x,y) = vec(p(x,y),q(x,y)) $
  是一个二维向量场。
  那么 $bf(F)$ 的*散度*是由下式定义的标量场
  $ op("div") bf(F) := nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y). $
]

水中的解释也是一样的，只不过是在二维水体中。

#sample[
  计算
  $ bf(F) (x , y) = vec(x cos y , e^x + sin y). $
  的散度。
]
#soln[
  在二维中，散度由下式给出
  $ nabla dot bf(F) = (partial p) / (partial x) + (partial q) / (partial y). $
  给定 $p(x,y) = x cos y$：
  $ (partial p) / (partial x) = (partial) / (partial x) (x cos y) = cos y. $
  给定 $q(x,y) = e^x + sin y$：
  $ (partial q) / (partial y) = (partial) / (partial y) (e^x + sin y) = cos y. $
  因此
  $ nabla dot bf(F)(x,y) & = (partial p) / (partial x) + (partial q) / (partial y)\
     & = cos y + cos y= #boxed[$ 2 cos y $]. #qedhere $
   ]

#sample[
  计算
  $ bf(F) (x , y) = vec(3 x^2 + 4 x y + y^2 , 2 x^2 + 2 x y - 3 y^2). $
  的散度。
]
#soln[
  给定 $p(x,y) = 3 x^2 + 4 x y + y^2$：
  $ (partial p) / (partial x) = (partial) / (partial x) (3 x^2 + 4 x y + y^2) = 6 x + 4 y $
  给定 $q(x,y) = 2 x^2 + 2 x y - 3 y^2$：
  $ (partial q) / (partial y) = (partial) / (partial y) (2 x^2 + 2 x y - 3 y^2) = 2 x - 6 y. $
  因此
  $ nabla dot bf(F)(x,y) & = (partial p) / (partial x) + (partial q) / (partial y)\
    &= (6 x + 4 y) + (2 x - 6 y)  = #boxed[$ 8 x - 2 y $]. #qedhere $
]

== [EXER] 习题

#exer[
  考虑重力 $bf(G)$，它由质量为 $m$、位于点 $O$ 的质点施加。
  证明 $ nabla dot bf(G) = 0 $ 对除 $O$ 之外的每一点都成立。
] <exer-gravity-div1>
