#import "@local/evan-zh:1.0.0":*

= 复数 <ch-complex>

== [TEXT] $CC$ 中的乘法具有几何意义，这真是个奇迹

用 $CC$ 表示复数集（正如 $RR$ 表示实数集）。
重要的是要意识到，*在我们引入复数乘法之前，
$CC$ 只不过是对 $RR^2$ 的一场精心装扮的 cosplay*。

#figure(
  table(
    columns: 3,
    align: left,
    table.header([概念], [对 $RR^2$], [对 $CC$]),
    [记号], [$bf(v)$], [$z$],
    [分量], [$vec(x, y)$], [$x + y i$],
    [长度], [长度 $|bf(v)|$], [绝对值 $|z|$],
    [方向], [(斜率，也许？)], [辐角 $theta$],
    [长度为 $1$], [单位向量], [$e^(i theta) = cos theta + i sin theta$],
    [乘法], [_无_], [✨ $z_1 z_2$ ✨]
  ),
  kind: table
)

在课程开始时，我向你警告过类型安全的问题，并且
我反复向你强调：*你无法把 $RR^n$ 中的两个向量相乘而得到另一个向量*。
（你有一个"点积"，但它吐出来的是一个数。
老实说，你不该把点积当成一种"积"；这个名字很糟糕。）

当然，经典的新手错误（你最好别在期中考试上犯这个错）
是逐分量地在向量上定义一种乘积：
为什么 $vec(a_1, dots.v, a_n)$ 与 $vec(b_1, dots.v, b_n)$ 不能有"乘积"
$vec(a_1 b_1, dots.v, a_n b_n)$ 呢？
嗯，在 18.02 中，每个向量的定义都需要有相应的几何图像，
我们才会认为它值得关注。
而这个定义没有几何意义。

然而，对于 $CC$ 有一个巨大的奇迹。
对于复数，你可以这样定义乘法
$ (a+b i)(c+d i) = (a c - b d) + (a d + b c) i $
而且它有_一个惊人的几何解释_。

遗憾的是，据我所知，英语里没有一个词表示
"绝对值为 1 的复数"，不像"单位向量"那样有专门的词。
在 18.02 中，我们改用
$ e^(i theta) := cos theta + i sin theta $
作为那个"词"；每当你看到 $e^(i theta)$，就把它画成单位向量 $cos theta + i sin theta$。

#digression(title: [复数指数到底是什么意思？])[
  值得指出的是，按照你在学校学到的东西，
  记号 $e^(i theta)$ 应当让你觉得是一个类型错误。
  把一个数提升到虚数次幂是什么意思？
  $i^i$ 有意义吗？$cos(i)$ 有意义吗？
  如果你想知道，请查看附录中的 @appendix-i-to-the-i。
]

但在 18.02 中，刚开始的时候，
我其实会把记号 $e^(i theta)$ 当成一个_助记符_，
也就是记住下面这个结果的一种方式：
#eqn[
  $ underbrace((cos theta_1 + i sin theta_1), = e^(i theta_1))
    dot underbrace((cos theta_2 + i sin theta_2), = e^(i theta_2))
    = underbrace(cos (theta_1 + theta_2) + i sin (theta_1 + theta_2), = e^(i (theta_1 + theta_2))). $
  <eqn-miracle>
]
在我看来，这是整个微积分预备知识中最大的奇迹。
真的，我想强调：@eqn-miracle 应当是_令人震惊_的。
我在本章结束时想要达到的目标，是让你相信
@eqn-miracle 中正在发生某种非常强大的事情，
使你能够做到你绝对不该期望自己能做的事。

更一般地，你需要知道的结果是：
#memo(title: [记忆：复数乘法])[
  设 $z_1$ 与 $z_2$ 是复数。
  要描述 $z_1 z_2$：

  - $z_1 z_2$ 的模是 $z_1$ 与 $z_2$ 的模的_乘积_。
    也就是说，
    #eqn[
      $ |z_1 z_2| = |z_1| |z_2| $
      <eqn-magnitudes>
    ]
  - $z_1 z_2$ 的辐角是 $z_1$ 与 $z_2$ 的辐角之_和_。
    这正是 @eqn-miracle。
]

这里有一个简单的例子。
#example[
  我们来考虑这些复数：
  $ z_1 = 20 + 21 i quad "and" quad z_2 = 5 + 12 i. $
  按照你在高中学的，乘积 $z_1 dot z_2$ 的计算如下：
  $ z_1 dot z_2 &= (20 + 21 i) (5 + 12 i)
    = 20 dot 5 + 20 dot 12 i + 21 i dot 5 + 21 i dot 12 i \
    &= 100 + 240 i + 105 i + 252 i^2 \
    &= 100 + 345 i + 252 (- 1) quad ("因为 " i^2 = - 1) \
    &= 100 + 345 i - 252 = (100 - 252) + 345 i = - 152 + 345 i. $
  上述定理承诺：如果我们使用极坐标形式，
  _角度_将相加，而_模长_将相乘。
  我们来验证它确实成立。

  对于模长，你可以手算：
  我们有 $|z_1| = sqrt(20^2 + 21^2) = 29$ 与 $|z_2| = sqrt(5^2 + 12^2) = 13$，
  并且确实有神奇的
  $|z_1 z_2| = sqrt(152^2 + 345^2) = 377. $

  这里的角度大概需要计算器才能验证。
  对于角度，由 $arctan(21/20) approx 46.04 degree$
  和 $arctan(12/5) approx 67.38 degree$，我们有
  $ z_1 &approx 29 (cos 46.04 degree + i sin 46.04 degree) \
    z_2 &approx 13 (cos 67.38 degree + i sin 67.38 degree) \ $
  因此我们预期
  $ z_1 z_2 approx 377 (cos 113 degree + i sin 113 degree) $
  而确实有 $arctan(-345/152) approx 113 degree$，正如所需！
]

下面是一个更有分量的例子，它展示了如何用 @eqn-miracle
来计算那些用直角坐标形式手算根本不可行的问题。

#sample[
  计算 $(1+i)^(10)$。
]
#soln[
  思路是先把 $1+i$ 写成极坐标形式：
  $ 1 + i = sqrt(2) (cos pi / 4 + i sin pi / 4). $
  之后求幂就很容易了，这要归功于 @eqn-miracle。
  具体写出来就是：
  $ (1 + i)^2 &= (sqrt(2))^2 (cos (2 dot pi / 4) + i sin (2 dot pi / 4)) \
    (1 + i)^3 &= (sqrt(2))^3 (cos (3 dot pi / 4) + i sin (3 dot pi / 4)) \
    (1 + i)^4 &= (sqrt(2))^4 (cos (4 dot pi / 4) + i sin (4 dot pi / 4)) \
    (1 + i)^5 &= (sqrt(2))^5 (cos (5 dot pi / 4) + i sin (5 dot pi / 4)) \
    &dots.v \
    (1 + i)^(10) &= (sqrt(2))^(10) (cos (10 dot pi / 4) + i sin (10 dot pi / 4)). $
  现在我们可以化简它：我们知道
  $ (1 + i)^(10) = 2^5 (cos (5 dot pi / 2) + i sin (5 dot pi / 2)) = 32 (0 + i)
    = #boxed[$ 32 i $]. #qedhere $
]
对比一下，如果我们要用乘法做 $10$ 次会有多烦人：
用反复平方最快的做法大概是这样的
$ (1 + i)^2 &= (1)^2 + 2 dot 1 dot i + i^2 = 1 + 2 i + (- 1) = 2 i \
  (1 + i)^4 &= ((1 + i)^2)^2 = (2 i)^2 = 4 i^2 = 4 dot (- 1) = - 4 \
  (1 + i)^8 &= ((1 + i)^4)^2 = (- 4)^2 = 16  \
  (1 + i)^(10) &= (1 + i)^8 dot (1 + i)^2 = 16 dot 2 i = 32 i. $
但你可以很容易地想象把 $10$ 换成 $100$（我们马上就会做）甚至 $1000000$。
这样的方法很快就会变得不可行；而极坐标
让我们避免了所有这些工作。

== [SIDENOTE] 提取三角恒等式以及婆罗摩笈多–斐波那契恒等式

在这个可选章节里，我想让你相信 @eqn-magnitudes 与 @eqn-miracle
施展了大量的魔法。
为此，我会向你展示这两条方程的两个推论，
它们都是你料想不到会成立的。

=== 应用 1：@eqn-magnitudes 给出婆罗摩笈多–斐波那契恒等式

我们从_模_说起。
如果你不信任你的老师（有时这是个好直觉 😉）
你可能不会_相信_我说的模会相乘。
因为设 $z_1 = a + b i$、$z_2 = c + d i$。
那么
$ z_1 z_2 = (a + b i)(c + d i) = (a c - b d) + (a d + b c) i $
看起来毫无关联。
如果 @eqn-magnitudes 确实成立，那它就意味着
$ sqrt(a^2+b^2) dot sqrt(c^2+d^2) = sqrt((a c - b d)^2 + (a d + b c)^2). $
换言之，方程
#eqn[
  $ (a^2+b^2)(c^2+d^2) = (a c - b d)^2 + (a d + b c)^2 $
  <eqn-br-fib>
]
应当对_所有_实数 $a$、$b$、$c$、$d$ 成立。

但这怎么可能呢？@eqn-br-fib 甚至_看起来_就不像真的，
如果我毫无上下文地这样告诉你，你不会相信。
直到你暴力地把 @eqn-br-fib 展开，
你才可能相信我：
$ (a^2+b^2)(c^2+d^2) &= a^2 c^2 + b^2 c^2 + a^2 d^2 + b^2 d^2 \
  (a c - b d)^2 + (a d + b c)^2 &= (a^2 c^2 - 2 a b c d + b^2 d^2) + (a^2 d^2 + 2 a b c d + b^2 c^2) \
  &= a^2 c^2 + b^2 d^2 + a^2 d^2 + b^2 c^2. $
它们确实相等！$2 a b c d$ 显然神奇地消掉了。
（这个意想不到的恒等式叫做
#link("https://w.wiki/CLMJ")[婆罗摩笈多–斐波那契恒等式]，
如果你想要个名字的话，但后面我们不会再使用这个名字。）

=== 应用 2：@eqn-miracle 给出三角加法公式与倍角公式

假设你仍然不信任你的老师（再说一次，这很好！），
即使你已不情愿地承认 @eqn-magnitudes 成立，
你也不相信另一条方程 @eqn-miracle。
因为如果 @eqn-miracle 成立，那么再一次暴力展开可得
$ cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)
  &= (cos theta_1 + i sin theta_1)(cos theta_2 + i sin theta_2) \
  &= (cos theta_1 cos theta_2 - sin theta_1 sin theta_2)
  + i (sin theta_1 cos theta_2 + sin theta_2 cos theta_1). $
所以要使 @eqn-miracle 成立，你需要对_任意_角 $theta_1$ 与 $theta_2$ 都有
$ cos(theta_1 + theta_2) &= cos theta_1 cos theta_2 - sin theta_1 sin theta_2 \
  sin(theta_1 + theta_2) &= sin theta_1 cos theta_2 + cos theta_1 sin theta_2. $
但这_确实_成立：它就是三角加法公式！

换一种说法：如果你记不住三角加法公式（像我一样），
那么 @eqn-miracle 向你展示了如何把它推导出来。
@eqn-miracle 很好记，而只要你做一下展开，
神秘的三角加法公式就会自己掉出来。

倍角公式也是一个特例：由
$ cos(2 theta) + i sin(2 theta) = (cos theta + i sin theta)^2
  = (cos^2 theta - sin^2 theta) + i dot 2 sin theta cos theta $
我们可以读出 $cos(2 theta) = cos^2 theta - sin^2 theta$
以及 $sin(2 theta) = 2 sin theta cos theta$。

== [RECIPE] 复数的 $n$ 次幂 <sec-recipe-complex-nth-power>

前面我展示了如何用极坐标形式快速计算 $(1+i)^(10)$。
你也可以一般地这样做：关键在于
#eqn[
  $ (r (cos theta  + i sin theta))^n = r^n (cos n theta + i sin n theta). $
  <eqn-de-moivre>
]
@eqn-de-moivre 有时被称为_棣莫弗定理_，但它是 @eqn-miracle
与 @eqn-magnitudes 如此简单的推论，我觉得它并不真的需要一个自己的名字。
尽管如此，如果你在其他地方看到这个名字，它指的就是 @eqn-de-moivre。

#recipe(title: [把复数提升到 $n$ 次幂的方法])[
  给定复数 $z$，要计算 $z^n$：

  1. 如果 $z = r(cos theta + i sin theta)$ 还不是极坐标形式，先把它化成极坐标形式。
  2. 使用 $z^n = r^n (cos n theta + i sin n theta)$。
  3. 化简 $cos n theta + i sin n theta$，输出答案。
]


这里再次给出 $(1+i)^(10)$ 的例子，
只是把 $10$ 换成 $100$ 以示强调。

#sample[
  计算 $(1+i)^(100)$。
]

#soln[
  $1 + i$ 的极坐标形式是：
  $ 1 + i = sqrt(2) (cos pi / 4 + i sin pi / 4). $
  提高到 $100$ 次幂得到
  $ (1 + i)^(100) &= (sqrt(2))^(100) (cos (100 dot pi / 4) + i sin (100 dot pi / 4))\
  &= 2^(50) (cos(25 pi) + i sin(25 pi)) \
  &= 2^(50) (cos(pi) + i sin(pi)) = #boxed[$ -2^(50) $]. #qedhere $
]

#sample[
  计算 $(1 - sqrt(3) i)^(20)$。
]
#soln[
  首先把 $1 - sqrt(3) i$ 化为极坐标形式：
  $ 1 - sqrt(3) i = 2 (cos (5 pi) / (3) + i sin (5 pi) / (3)). $
  然后，当我们把它提高到 $20$ 次幂时，得到
  $ (1 - sqrt(3) i)^20 = 2^20 (cos ((100 pi) / (3)) + i sin ((100 pi) / (3))). $
  余弦和正弦每 $2 pi$ 循环一次，所以我们写
  $ (100 pi) / (3) = (4 pi) / (3) + 2 pi dot 16. $
  我们只关心"余数" $4 pi / 3$；我们有
  $ cos ((100 pi) / (3)) = cos (240 degree) = - 1 / 2 $
  $ sin ((100 pi) / (3)) = sin (240 degree) = - sqrt(3) / 2. $
  代回：
  $ (1 - sqrt(3) i)^20 &= 2^20 (- 1 / 2 - i sqrt(3) / 2) \
    &= 2^(20) times (- frac(1 + sqrt(3) i, 2)) = #boxed[$ - 2^(19) (1 + sqrt(3) i) $]. $
  （如果你在意的话，$2^(19) = 524288$，所以也可以写成 $-524288 - 524288 sqrt(3) i$。）
]

== [TEXT] 复数 $n$ 次根的一个例子：解 $z^5 = 243i$

本节专门讨论 $z^n$，并且属于考试大纲范围。
具体来说，你应当能够解像
$ z^5 = 243 i$ 这样的方程。
本节会告诉你如何做到。

在本节中，你总是应当优先用极坐标形式计算。
所以如果你拿到的输入是直角坐标形式，应当先化成极坐标形式。
反过来，如果要求的答案是直角坐标形式，
你也仍然应当用极坐标形式计算，
只在最后才转换回直角坐标形式的输出。

如果你会求 $n$ 次幂，那么把方法"倒着"运行，
你也应当会求 $n$ 次根。
首先，我来告诉你答案长什么样：

#memo(title: [记忆：$n$ 次根答案的形状])[
  考虑解方程 $z^n = w$，求 $z$，
  其中 $w$ 是给定的非零复数。
  那么你总是应当恰好输出 $n$ 个答案。
  这 $n$ 个答案的模都是 $|w|^(1/n)$，
  而辐角彼此间隔 $(360 degree) / n$。
]

我觉得一开始先给你看 $ z^5 = 243 i $ 的
五个答案最有启发性。
同样，首先我们要把所有东西都化成极坐标：
$ z^5 = 243 i = 243 (cos 90 degree + i sin 90 degree). $
此时我们知道，如果 $|z^5| = 243$，那么 $|z| = 3$；
所有答案的绝对值都应当是 $3$。
所以思路就是找出各个角度。
下面是这五个答案：

$
z_1 = 3 (cos 18 degree + i sin 18 degree) ==> (z_1)^5 &= 243 (cos 90 degree + i sin 90 degree) \
z_2 = 3 (cos 90 degree + i sin 90 degree) ==> (z_2)^5 &= 243 (cos 450 degree + i sin 450 degree) \
z_3 = 3 (cos 162 degree + i sin 162 degree) ==> (z_3)^5 &= 243 (cos 810 degree + i sin 810 degree) \
z_4 = 3 (cos 234 degree + i sin 234 degree) ==> (z_4)^5 &= 243 (cos 1170 degree + i sin 1170 degree) \
z_5 = 3 (cos 306 degree + i sin 306 degree) ==> (z_5)^5 &= 243 (cos 1530 degree + i sin 1530 degree).
$

下面是这五个数的图像：

#figure(
  image("figures/complex-circle.svg", width: auto),
  caption: [方程 $z^5 = 243 i$ 的五个答案，每个的长度都是 $3$。],
)

在右列中，所有数都相等。
注意右侧出现的有趣现象。
数 $cos 90 degree + i sin 90 degree$
与 $cos 450 degree + i sin 450 degree$ 等等其实是同一个数；
如果你把它们画在平面上，它们指向同一个东西。
然而，它们在左边给出五个_不同_的答案。
但如果你再往后延续一步，
就开始出现循环
$ z_6 = 3 (cos 378 degree + i sin 378 degree) ==>
  (z_6)^5 &= 243 (cos 1890 degree + i sin 1890 degree). $
这不会给你新的答案，因为 $z_6 = z_1$。

== [RECIPE] 求复数的 $n$ 次根 <sec-recipe-complex-nth-root>

一般来说，如果 $w$ 的辐角是 $theta$，
那么满足 $z^n = w$ 的 $z$ 的辐角
从 $theta / n$ 开始，然后以 $(360 degree) / n$ 为步长递增。
（例如，$z^5 = 243 i$ 的答案
从 $(90 degree) / 5 = 18 degree$ 开始。）
所以一般方法可以描述为：

#recipe(title: [求复数 $n$ 次根的方法])[
  1. 把 $w$ 化为极坐标形式；设其角度为 $theta$。
  2. $n$ 个答案中的一个是 $|w|^(1/n) (cos theta / n + i sin theta / n)$。
  3. 其余 $n-1$ 个答案通过把角度以 $(360 degree) / n$ 为步长递增得到。
]

#sample[对 $z in CC$ 解 $z^5 = 243 i$。]
#soln[
  我们首先化为极坐标形式
  $ 243 i = 243 (cos 90 degree + i sin 90 degree) $
  并看出 $243^(1/5) = 3$，且 $theta = 90 degree$。
  第一个角度是 $theta / 5 = 18 degree$。
  所以五个答案是
  $
  z_1 &= 3 (cos 18 degree + i sin 18 degree) \
  z_2 &= 3 (cos 90 degree + i sin 90 degree) \
  z_3 &= 3 (cos 162 degree + i sin 162 degree) \
  z_4 &= 3 (cos 234 degree + i sin 234 degree) \
  z_5 &= 3 (cos 306 degree + i sin 306 degree).
  $
  （恰好 $z_2 = 3i$，容易手算验证它确实成立。）
]
#sample[对 $z in CC$ 解 $z^4 = 8 + 8 sqrt(3) i$。]
#soln[
  我们首先化为极坐标形式
  $ 8 + 8 sqrt(3) i = 16 (cos 60 degree + i sin 60 degree) $
  并看出 $16^(1/4) = 2$，且 $theta = 60 degree$。
  第一个角度是 $theta / 4 = 15 degree$。
  所以四个答案是
  $
  z_1 &= 2 (cos 15 degree + i sin 15 degree) \
  z_2 &= 2 (cos 105 degree + i sin 105 degree) \
  z_3 &= 2 (cos 195 degree + i sin 195 degree) \
  z_4 &= 2 (cos 285 degree + i sin 285 degree). #qedhere
  $
]
#sample[对 $z in CC$ 解 $z^3 = -1000$。]
#soln[
  我们首先化为极坐标形式
  $ -1000 = 1000 (cos 180 degree + i sin 180 degree) $
  并看出 $1000^(1/3) = 10$，且 $theta = 180 degree$。
  第一个角度是 $theta / 3 = 60 degree$。
  所以三个答案是
  $
  z_1 &= 10 (cos 60 degree + i sin 60 degree) \
  z_2 &= 10 (cos 180 degree + i sin 180 degree) \
  z_3 &= 10 (cos 300 degree + i sin 300 degree).
  $
  （恰好 $z_2 = -10$，正如预期，因为 $(-10)^3 = -1000$。）
]

== [RECAP] 直角坐标形式与极坐标形式

每个复数都可以写成
_直角坐标形式_（$a+b i$，其中 $a,b in RR$）或_极坐标形式_（$r e^(i theta)$）。
我们看到，如果你要做大量乘法，极坐标形式
（由于 @eqn-miracle 与 @eqn-magnitudes）非常好用。
总结起来，@tab-complex 给出了处理复数的经验法则。

#figure(
  table(
    columns: 3,
    align: left,
    table.header([运算], [直角坐标形式], [极坐标形式]),
    [$z_1 pm z_2$],
      [✅ 像在 $RR^2$ 中那样逐分量进行],
      [❌ 除非 $z_1$ 是 $z_2$ 的实数倍],
    [$z_1 z_2$], [✅ 展开], [✅ 借助 @eqn-miracle + @eqn-magnitudes],
    [$z_1 slash z_2$], [✅ 写成 $1/(c+d i) = (c - d i) / (c^2+d^2)$ 再相乘], [✅ 借助 @eqn-miracle + @eqn-magnitudes],
    [$z^n$], [❌ 可行但太耗时], [✅ 见 @sec-recipe-complex-nth-power],
    [$z$ 的 $n$#super[th] 次根], [❌ $n > 1$ 时不推荐], [✅ 见 @sec-recipe-complex-nth-root],
  ),
  kind: table
) <tab-complex>

== [EXER] 习题

#exerstar[
  不使用计算器，给出一个满足下式的整数有序对 $(a,b)$ 的例子
  $ a^2 + b^2 = 101 dot 401 dot 901. $
] <exer-complex-101-401-901>

#exer[
  计算
  $ arctan 1/1 + arctan 1/2 + arctan 1/3. $
] <exer-arctan-123>
