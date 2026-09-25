#import "@local/evan-zh:1.0.0":*

= 点积 <ch-dot>

点积是你在本课程中会遇到的第一个令人惊讶的结果，
因为它有*两*个看起来毫不相像的定义，
一个是代数的、一个是几何的。
正因如此，我们才能从它身上获得巨大的收益。

这将是贯穿全课的一个普遍主题：
我们定义的几乎每一个新概念都会有某种“代数”的一面
（比如向量加法的坐标）
和某种“几何”的一面（@fig-parallelogram 中的平行四边形）。
这是我们要在本课中研究一个概念所必须跨过的门槛：
要想让我们认为一个概念值得在 18.02 中关注，
它必须既有代数解释又有几何解释。

== [TEXT] 点积的两个不同定义 <sec-dot>

我答应过你有两个定义，对吧？它们就在这里。

#definition[
  设 $bf(v) = vec(a_1, dots.v, a_n)$ 与 $bf(w) = vec(b_1, dots.v, b_n)$ 是 $RR^n$ 中的两个向量。

  *代数定义*是取逐分量乘积之和：
  $
    vec(a_1, dots.v, a_n)
    dot
    vec(b_1, dots.v, b_n)
    :=  a_1 b_1 + ... + a_n b_n.
  $

  *几何定义*是：若 $theta$ 是把两向量画成具有共同起点的箭头时
  它们之间的夹角，则
  $ bf(v) dot bf(w) := |bf(v)| |bf(w)| cos theta. $
  也就是说，点积等于两模长之积
  乘以夹角的余弦。
]

这两个定义相同这一点完全不显然！
我知道两个合理的证明，都已录入附录：

- 标准证明用到余弦定理；记载于 @appendix-dotpf-alg。
  它很短，但显得有些神奇。
- 我自己想出了一个不用三角学的几何证明；记载于 @appendix-dotpf-geo。
  它更长，但更容易想出来。

为了让这些讲义继续推进，我不会在这个证明上过多停留。

#typesig[
  记住，点积以两个*维数相同*的向量为输入，
  输出一个*标量*（即一个实数）。
  *它不输出向量！*
  这是每一位微积分或线性代数教师在开课头几周
  都害怕见到的错误。

  再说一遍：点积的输出类型是*数*！不是向量！
]

#warning(title: [警告：点还真不少，是吧？])[
  容易混淆的是，乘法符号 $dot$ 也用于普通的乘法
  （正如我们在 @exer-tsafe 中看到的）。
  这就是为什么你需要始终注意对象的类型，
  才能知道发生的是哪一种 $dot$。
  具体说明如下：

  - 若 $a$ 与 $b$ 是两个数，$a dot b = a b$ 是*小学乘法*，
    例如 $3 dot 5 = 15$。
  - 若 $a$ 是一个数而 $bf(v)$ 是一个向量，$a dot bf(v)$ 是*数乘*，
    例如 $3 dot vec(5,7) = vec(15, 21)$。
  - 若 $bf(v)$ 与 $bf(w)$ 是向量，则 $bf(v) dot bf(w)$ 是*点积*，
    例如 $vec(5,7) dot vec(9,11) = 5(9)+7(11) = 122$。
]

#example[
  我们用两种方式计算 $bf(v) = vec(-5, 5 sqrt(3))$
  与 $bf(w) = vec(7sqrt(3), -7)$ 的点积。

  - 代数定义很简单：
    $ bf(v) dot bf(w) = - 5 dot 7 sqrt(3) + 5 sqrt(3) dot (-7) = -70 sqrt(3). $

  - 几何定义要麻烦一些，见 @fig-dot-ex1。
    在这幅图中，你可以看到坐标轴之间有两个 $30 degree$ 角，
    而且两个向量的模长是 $10$ 和 $14$。
    因此它们之间的夹角 $theta$ 为 $theta = 90 degree + (30 degree + 30 degree) = 150 degree$。
    于是几何定义给出
    $ bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta = 10 dot 14 dot cos(150 degree)
      = 140 dot - sqrt(3)/2 = -70sqrt(3). $
]

#figure(
  image("figures/dot-ex1.svg", width: auto),
  caption: [$bf(v) = vec(-5, 5 sqrt(3))$
  与 $bf(w) = vec(7sqrt(3), -7)$ 的点积是 $-70sqrt(3)$。]
) <fig-dot-ex1>


#tip[
  从这个例子可以看出，计算
  两个给定坐标的向量的点积，
  用代数定义来做要容易得多。
  这在整门课中普遍成立：

  - 当你需要做实际计算时，用代数定义。
  - 当你需要以某种方式解释结果时，用几何定义。
]

#example[
  我们用两种方式计算 $bf(v) = vec(1, 2)$ 与 $bf(w) = vec(-6, 3)$ 的点积。
  见 @fig-dot-ex2。

  - 代数定义很简单：
    $ bf(v) dot bf(w) = 1 dot (-6) + 2 dot (3) = 0. $

  - 在这个情形中，两个向量 $bf(v)$ 与 $bf(w)$ 之间的夹角是 $90 degree$。
    你在高中就应该知道这一点，因为 @fig-dot-ex2 中的两条蓝色射线
    的斜率分别是 $2$ 与 $-1/2$。
    所以夹角的余弦是 $0$，整个点积也就是 $0$。
    （模长分别是 $|bf(v)| = sqrt(5)$ 与 $|bf(w)| = 3sqrt(5)$，
    但没有必要真的去算它们。）
]

#figure(
  image("figures/dot-ex2.svg", width: auto),
  caption: [两个垂直的点积],
) <fig-dot-ex2>

这个例子展示了一件新事情：
#memo[两个非零向量的方向垂直，
  当且仅当它们的点积为 $0$。]

在二维中这也许显得很愚蠢，
因为它做的事你用斜率早就知道怎么做了。
但在 $RR^3$ 中没有斜率的概念，
所以如果你想判断 $RR^3$ 中两个向量是否垂直，
就得用点积。

#sample[
  求实数 $t$，使得 $vec(1,2,3)$ 与 $vec(4,5,t)$ 垂直。
]
#soln[
  我们需要 $1 dot 4 + 2 dot 5 + 3 dot t = 0$，所以 $#boxed[$ t = -14/3 $]$。
]

#example(title: [例：$bf(v) dot bf(v) = |bf(v)|^2$])[
  把一个向量 $bf(v) = vec(x_1, dots.v, x_n)$ 与自身作点积，
  得到的是*模长的平方*。
  - 从代数定义看，注意
    $bf(v) dot bf(v) = x_1^2 + ... + x_n^2 = |bf(v)|^2$。
  - 从几何定义看，注意
    $bf(v) dot bf(v) = |bf(v)| |bf(v)| cos(0) = |bf(v)|^2$。
]

== [TEXT] 点积的性质

如果你看看代数定义，应该很容易看出：
- $bf(v) dot bf(w) = bf(w) dot bf(v)$，即点积是可交换的。
- $bf(v) dot (bf(w)_1 + bf(w)_2) = bf(v) dot bf(w)_1 + bf(v) dot bf(w)_2$，
  即点积满足分配律。

我简要指出这一点是为了记录在案，
但在你实际计算点积的过程中得到更多练习后，
你多半也会自动把它内化。

== [TEXT] 投影

设 $bf(v)$ 与 $bf(w)$ 是 $RR^n$ 中的两个非零向量。
令 $theta$ 表示它们之间的夹角。
设想把向量 $bf(v)$ 投影到过 $bf(w)$ 的直线上，
得到 @fig-dot-project1 中所示的紫色向量。
这个紫色向量通常写作 $op("proj")_(bf(w))(bf(v))$。

#typesig[
  向量投影 $op("proj")_(bf(w))(bf(v))$
  是一个与 $bf(w)$ 同向或反向的向量。
]

我们做个例子，看看点积如何让我们计算它。
#sample[
  设 $bf(v) = vec(2,3)$，$bf(w) = vec(4,1)$，如 @fig-dot-project1 所示。
  求向量 $op("proj")_(bf(w))(bf(v))$。
]

见 @fig-dot-project1 中的紫色向量。

#figure(
  image("figures/dot-proj1.svg", width: auto),
  caption: [$bf(v) = vec(2,3)$ 沿 $bf(w) = vec(4,1)$ 的投影。],
) <fig-dot-project1>


#soln[
  首先，我们来确定紫色向量的*长度*。
  由于三角学上的原因，我们知道紫色向量的*长度*是
  $ "紫色向量的长度" = |bf(v)| cos theta. $
  然而，我们并不真想费力气去求出 $theta$ 是多少。

  这正是点积发挥作用的地方。
  点积很容易计算：
  $ 11 = 2 dot 4 + 3 dot 1 = bf(v) dot bf(w) = |bf(v)| |bf(w)| cos theta. $
  这几乎就是我们要的东西，只是多了一个不需要的 $|bf(w)|$，我们想把它去掉。
  我们知道 $|bf(w)| = sqrt(4^2+1^2) = sqrt(17)$，于是得到
  $ "紫色向量的长度" = (bf(v) dot bf(w)) / (|bf(w)|) = 11 / sqrt(17). $

  那么怎么得到紫色向量本身呢？
  沿 $bf(w)$ 的方向是单位向量
  $ bf(w) / (|bf(w)|) = vec(4/sqrt(17), 1/sqrt(17)) $
  因此乘以长度就得到想要的结果：
  $ op("proj")_(bf(w))(bf(v)) = ("紫色向量的长度") (bf(w)) / (|bf(w)|)
    = 11/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(44/17, 11/17). #qedhere $
]

#remark[
  投影只依赖于 $bf(w)$ 的方向。
  所以如果把上面那道题改成用 $bf(w) = vec(200, 300)$
  而不是 $vec(2,3)$ 重做一遍，答案会是一样的。
]

== [RECIPE] 投影 <sec-recipe-proj>

上一节的这套流程对任意向量、任意维数都普遍适用。
唯一需要注意的是，我们必须留意 $theta < 90 degree$
与 $theta > 90 degree$ 的表现略有不同。
@fig-dot-project2 中展示了一个这种情形的例子。

#figure(
  image("figures/dot-proj2.svg", width: auto),
  caption: [$bf(v) = vec(-3,3)$ 沿 $bf(w) = vec(4,1)$ 的投影。],
) <fig-dot-project2>

这里，紫色向量*背离* $bf(w)$ 的方向。

在上一个例子中我们用了“长度”这个词，这没问题。
而在新图 @fig-dot-project2 中，我们最后会得到负的长度。
这也能用，但很烦人；
于是我们引入一个新词，它在 $theta < 90 degree$
与 $theta > 90 degree$ *两种*情形下都适用：

#definition(title: [标量分量的定义])[
  $bf(v)$ 在 $bf(w)$ 方向上的*标量分量*（scalar component）是由下式定义的那个数
  $  op("comp")_(bf(w))(bf(v)) := |bf(v)| cos theta = (bf(v) dot bf(w)) / (|bf(w)|). $
]
这就是之前那个紫色长度的类比，
但现在我们允许它为正、为负或为零，分别对应于 $theta < 90 degree$、
$theta > 90 degree$ 和 $theta = 90 degree$。
但关键在于，余弦可以自动处理这件事，
而由于余弦已经融入点积之中，日子就好过了：
*我们根本不必去考虑符号问题*。
也就是说，用新记号写出的公式
$ op("proj")_(bf(w))(bf(v))
  = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|) $
总是成立。

#typesig[
  标量分量是一个数，可以为正、为负或为零。
]

#recipe(title: [把一个向量沿另一个向量投影的方法])[
  设 $bf(v)$ 与 $bf(w)$ 是 $RR^n$ 中给定的向量。

  1. 要计算*标量分量*，用公式
    $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|). $
  2. 要计算*向量投影*，用公式
    $ op("proj")_(bf(w))(bf(v))
      = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|). $
]
#typesig[
  执行这套方法时要注意类型安全，
  以免搬起石头砸自己的脚：
  - 在公式 $(bf(v) dot bf(w)) / (|bf(w)|)$ 中，
    分子是一个数（它是一个点积），
    分母是一个数（它是一个长度），我们是在做两个数相除。
  - 公式 $(bf(v) dot bf(w))/(|bf(w)|^2) bf(w)$ 更复杂一些。
    先只看前面的那个分数：
    分子是一个数（它是一个点积），
    分母是一个数（它是一个长度的平方），
    所以整个分数是一个数。
    这个分数随后与向量 $bf(w)$ 相乘，因此输出类型
    是向量（实际上是 $bf(w)$ 的一个倍数）。
]
#warning[
  投影公式还可以写成其他等价形式，例如
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = ( (bf(v) dot bf(w)) / (|bf(w)|) ) (bf(w)) / (|bf(w)|)
    = (bf(v) dot bf(w))/(|bf(w)|^2) bf(w)
    = (bf(v) dot bf(w))/(bf(w) dot bf(w)) bf(w). $
  我不太喜欢最后几个，因为我认为它们让人更难看出
  公式的来源，但如果你清楚自己在做什么，尽可以随意使用。
]

为了向你展示这套方法并没有做任何你没见过的事，
我们用新记号重做前面的例子。
你应该注意到我们得到了和以前一样的数。
#sample[
  设 $bf(v) = vec(2,3)$，$bf(w) = vec(4,1)$，如 @fig-dot-project1 所示。
  计算 $op("proj")_(bf(w))(bf(v))$。
]
#soln[
  首先，计算
  $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|)
    = (2 dot 4 + 3 dot 1) / (sqrt(4^2+1^2)) = 11/sqrt(17). $
  然后，
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = 11/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(44/17, 11/17). #qedhere $
]

我们再做一下 @fig-dot-project2 中的例子。
#sample[
  设 $bf(v) = vec(-3,3)$，$bf(w) = vec(4,1)$，如 @fig-dot-project1 所示。
  计算 $op("proj")_(bf(w))(bf(v))$。
]
#soln[
  首先，计算
  $ op("comp")_(bf(w))(bf(v)) = (bf(v) dot bf(w)) / (|bf(w)|)
    = (-3 dot 4 + 3 dot 1) / (sqrt(4^2+1^2)) = (-9)/sqrt(17). $
  然后，
  $ op("proj")_(bf(w))(bf(v))
    = op("comp")_(bf(w))(bf(v)) (bf(w)) / (|bf(w)|)
    = (-9)/sqrt(17) vec(4/sqrt(17), 1/sqrt(17)) = vec(-36/17, -9/17). #qedhere $
]

== [EXER] 习题

#exer[
  在四维空间 $RR^4$ 中，向量 $chevron.l 1,2,3,4 chevron.r$
  与 $chevron.l 5,6,7,t chevron.r$ 垂直。求 $t$。
] <exer-dot-perp4d>

#exer[
  - 计算 $chevron.l 123,456,789 chevron.r$ 在 $ee_1$ 方向上的向量投影。
  - 计算 $bf(v) = chevron.l 1,2,3 chevron.r$
    沿 $bf(w) = chevron.l -3000, -4000, 0 chevron.r$ 方向的标量分量与向量投影。
] <exer-dot-proj>

#exer[
  令 $bf(w) = chevron.l 3,4 chevron.r$。
  求 $RR^2$ 中所有满足 $bf(v) dot bf(w) = 3$ 的单位向量 $bf(v)$。
] <exer-dot-reverse>

#exerstar[
  求 $a x + b y + c z$ 所有可能的值，
  其中实数 $a$、$b$、$c$、$x$、$y$、$z$
  满足 $a^2 + b^2 + c^2 = 2$ 且 $x^2 + y^2 + z^2 = 5$。
] <exer-cauchy>
