#import "@local/evan-zh:1.0.0":*

= 功（又名线积分），以及如何徒手计算它们 <ch-work>

本章定义所谓的_线积分_，
它是我们海报 @poster-stokes 中那两幅紫色图的第一幅。
眼下我们只孤立地看这个格子，
所以我们会给出定义，并向你展示如何徒手使用它。

不过，现在值得先说明：*会有捷径*
能绕过参数化这项苦工来计算线积分。
这些捷径由 @poster-stokes 中的_红色箭头_给出。
事实上，接下来的一整章 @ch-ftcgreen 都专门讲这些捷径。

== [TEXT] 功 <sec-work-def>

我们现在来定义海报 @poster-stokes 中最左边的紫色图。
当我们有一个向量场 $bf(F) : RR^n -> RR^n$
以及一条穿过它的路径 $bf(r) : RR -> RR^n$ 时，我们可以定义其上的*功*。

#figure(
  box(image("figures/work-cut.svg", width: auto), stroke: 1pt),
  caption: [从 @poster-stokes 中那张巨型海报里圈出的功积分。],
)

#definition(title: [功的定义])[
  $bf(F) : RR^n -> RR^n$ 在路径 $bf(r) : RR -> RR^n$ 上所做的*功*
  定义为
  $ integral_(t="起始时刻")^("终止时刻") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t. $
]
#typesig[
  注意各个输入的类型；见 @table-types-work。
  功是一个标量
  （被积函数里有一个点积，所以它输出一个数）。
]
#figure(
  table(
    columns: 4,
    align: left,
    table.header([符号], [名称], [输入类型], [输出类型]),
    [$bf(r) : RR -> RR^n$], [路径的参数化], [标量 $t$（时间）], [$RR^n$ 中的点（圆点）],
    [$bf(r)' : RR -> RR^n$], [$bf(r)$ 的速度向量], [标量 $t$（时间）], [$RR^n$ 中的向量（箭头）],
    [$bf(F) : RR^n -> RR^n$], [向量场], [$RR^n$ 中的点（圆点）], [$RR^n$ 中的向量（箭头）],
  ),
  caption: [功积分中各个对象的类型签名。],
  kind: table
) <table-types-work>

这通常有两种简写方式。
- 第一，我们在 @table-shorthand 中加了一行新的简写：
  $ dif bf(r) := bf(r)'(t) dif t. $
- 第二，时间参数化常常从记号中隐去，
  我们改写成 $integral_(cal(C))$，其中 $cal(C)$ 表示 $bf(r)(t)$ 描出的曲线。
  在这种语境下，我们总是认为曲线是*有向的*，
  即其中一个端点是起点，另一个是终点。

这意味着上面的功积分可以简单地改写为
$ integral_(cal(C)) bf(F) dot dif bf(r). $
幸运的是，这个简写里的符号仍然写着一个点积，提醒你：是的，
你在计算它时应该求一个点积。
我无法想象如果这个简写里没有点积会造成多大的混乱。

== [SIDENOTE] 功的水中解释

一如既往地令 $bf(F)$ 表示水流，
沿一条轨迹所做的“功”可以这样理解：
#idea[
  功告诉你水流对一个游泳者在水中
  的运动帮助或阻碍了多少。
]

为了计算它，考虑一条轨迹，一个物体（比如
船或游泳者）沿它穿过水面。任一点处的流场向量场
$bf(F)$ 描述了该处水流的速率和方向。当物体
沿路径 $cal(C)$ 运动时，水流所做的功
取决于水流与物体沿该路径的运动方向的对齐程度。

#figure(
  image("figures/work-posnegzero.svg", width: auto),
  caption: [给定向量场 $bf(F)$ 的功的符号的图示，
    它大致指向东南。
    在最左边的图中，路径直接沿着 $bf(F)$ 运动，
    因此功为正。
    在中间的图中，$bf(F)$ 改为直接逆着 $bf(F)$ 运动，
    因此功为负。
    在最右边的图中，$bf(F)$ 垂直于 $bf(F)$ 运动，
    因此功为零。
  ],
) <fig-work-posnegzero>


1. _当水流与路径一致时_：如果在某一点
  $bf(F)$ 的方向与轨迹的方向
  一致，那么水流对该段路径上的功有正贡献，
  实际上是在助力运动。这感觉就像
  沿行进方向的一个“推力”。
  这些点积是正的，因为在每一点 $P = bf(r)(t)$ 处，
  向量 $bf(F)(P)$ 与 $bf(r)'(t)$ 对齐得很好，
  而功是大量正数之和。

2. _当水流与路径相反时_：如果水流方向
  在任一点与轨迹相反，那么它对功有负贡献，
  实际上是在阻碍运动。在这种情况下，物体必须
  逆着水流用力，感觉就像一股拖慢它前进的“阻力”。
  这些点积是负的，因为在每一点 $P = bf(r)(t)$ 处，
  向量 $bf(F)(P)$ 与 $bf(r)'(t)$ 彼此反向，
  而功是大量负数之和。

3. _当水流垂直于路径时_：如果
  在一点处 $bf(F)$ 垂直于轨迹，那么它
  在行进方向上不做功，因为水流既不助力也不
  阻碍沿路径的运动。这种情况下水流的作用
  主要是造成横向漂移，而不是沿轨迹的向前或
  向后的推力。
  此时这些点积为零：在每一点 $P = bf(r)(t)$ 处，
  向量 $bf(F)(P)$ 与 $bf(r)'(t)$ 互相垂直。

三种情形的图示都显示在 @fig-work-posnegzero 中。

== [TEXT] 通过点积可视化线积分

如果你想把这积分可视化，
你可以想象自己沿着 $bf(r)$ 划出的路径行走。
在每一点，你画出路径的切向量 $bf(r)'(t)$，
同时看看该点处向量场 $bf(F)(bf(r(t)))$ 的箭头。
这两个向量的点积是一个数。
线积分把所有这些数加起来。

#tip(title: [@fig-work-dot 中的浅蓝色与紫色完全无关])[
  在画像 @fig-work-dot 那样的示意图时，
  记住图中有两个部分可能是有用的：

  - 曲线 $cal(C)$ 及其参数化 $bf(r)(t)$（@fig-work-dot 中的紫色）
  - 向量场 $bf(F)(x,y)$（@fig-work-dot 中的浅蓝色箭头）

  记住，*这两个部分彼此毫无关系*。
  也就是说：
  - 当你画 $bf(F)(x,y)$ 的浅蓝色箭头时，
    你只应该看 $bf(F)$，完全忽略 $cal(C)$ 和 $bf(r)$。
  - 同样，在画紫色路径 $cal(C)$ 时，完全忽略 $bf(F)$。
]

#figure(
  image("figures/work-dot.svg", width: auto),
  caption: [功积分把点积加起来的示意图。
  想象把所有点积 $bf(F)(bf(r)(t)) dot bf(r)'(t)$ 加起来。],
) <fig-work-dot>

在实际中，如果你真的想做那个积分计算，
你最终不得不做一次参数化，所以这个简写掩盖了需要花多少功夫。
例如，在下面的练习中，$cal(C)$ 是圆 $x^2+y^2=1$ 的上半部分，
方向从点 $(1,0)$ 到 $(-1,0)$。
（再说一次，对于功积分，我们总是要求指明积分沿 $cal(C)$ 的哪个方向进行，
如果我们选择把参数化 $bf(r)(t)$ 从记号中隐去的话。）

#tip(title: [提示：参数化有灵活性，如 @sec-flex-param 中所述])[
  功积分取决于你沿路径行走的方向
  （如果你把起点和终点对调，它会变号），
  但它不取决于你究竟如何参数化这条路径。

  因此，@sec-flex-param 中的评论在这里也适用：
  比如说，如果你要参数化从
  $(1,0)$ 到 $(-1,0)$ 的半圆（后面 @fig-work-ex1 中的蓝色弧），
  你大概应该用 $ bf(r)(t) = (cos(t), sin(t))$，其中 $0 <= t <= pi. $

  你也可以用 $bf(r)(t) = (cos(pi t), sin(pi t))$，其中 $0 <= t <= 1$。
  或者，如果你想让阅卷人抓狂，
  你甚至可以用 $bf(r)(t) = (cos(pi t^2), sin(pi t^2))$，其中 $0 <= t <= 1$，
  它以不规则的速率描出同一条弧。
  既然这些都给同样的答案，你就应该挑选
  让你算起来最省力的那种参数化。
]

#tip(title: [提示：可以拼接])[
  把路径切成多个部分完全没有问题。
  例如，如果 $cal(C)$ 是一条由沿正方形周长
  行走构成的闭回路，把它切成四条线段就行了。
]

== [RECIPE] 通过参数化徒手计算线积分 <sec-work-manual-recipe>

回到我们的定义，下面是它的方法形式。

#recipe(title: [用徒手参数化计算线积分的方法])[
  为了计算 $bf(F)$ 沿曲线 $cal(C)$ 的线积分：

  1. 选取*任意*一种参数化 $bf(r) : RR -> RR^n$（用于曲线 $cal(C)$），
    包括指明起始时间和终止时间。
    - 正如 @sec-flex-param 中所述，你在如何设定参数化上有一定自由度：
      重要的是你从正确的位置出发和结束，
      并恰好描出曲线 $cal(C)$。
      所以你应该挑选让你计算更省力的那种参数化。
  2. 计算导数 $bf(r)'(t)$。
  3. 计算点积 $bf(F)(bf(r)(t)) dot bf(r)'(t)$。
  4. 把它从起始时间积分到终止时间。
]

我们举几个在实际中如何计算它的例子。

#sample[
  计算向量场
  $bf(F) (x , y) = vec(2 y , 3 x)$ 沿下面两条曲线的线积分：

  - 圆 $x^2 + y^2 = 1$ 的上半部分，逆时针定向
    （@fig-work-ex1 中的蓝色）。
  - 从 $(1,0)$ 到 $(-1,0)$ 的线段
    （@fig-work-ex1 中的棕色）。
]

#figure(
  image("figures/work-ex1.svg", width: auto),
  caption: [向量场 $bf(F)(x,y) = vec(2y, 3x)$ 中两个功积分的例子。
    蓝色路径是 $x^2+y^2=1$ 的上半圆；棕色路径是一条直线。],
) <fig-work-ex1>

#soln[
  两部分我们都做；为了不被下标的海洋淹没，每一部分我们都用 $cal(C)$ 和 $bf(r)$
  表示曲线和参数化。

  在动手计算之前，看看 @fig-work-ex1，对正在发生的事情有个感觉。
  蓝色弧上的符号有正有负：在弧的起点和终点附近，我们相加的那些点积
  是正的，因为那些小箭头与蓝色路径对齐得很好。
  但在靠近顶端处我们是在逆着水流运动。
  由于起点附近的箭头更长，你可能会猜这个功积分是一个很小的
  正数，而你猜对了。

  与此同时，沿棕色线段，所有箭头都垂直于我们的轨迹。
  因此我们应该预期总功为 $0$，确实如此。

  - 我们先做 $cal(C)$ 是那段弧的情形。
    圆 $x^2 + y^2 = 1$ 的上半部分可以参数化为：
    $ bf(r) (t) = vec(cos t , sin t) , quad upright("where ") t upright(" ranges from ") 0 upright(" to ") pi . $
    把参数化代入向量场：
    $ bf(F) (bf(r) (t)) = bf(F) (cos t , sin t) = vec(2 sin t , 3 cos t) . $
    把 $bf(r) (t)$ 对 $t$ 求导：
    $ bf(r)' (t) = vec(- sin t , cos t) . $
    $bf(F)$ 沿 $cal(C)$ 的线积分由下式给出：
    $ integral_(cal(C)) bf(F) dot dif bf(r) &= integral_(t=0)^pi bf(F) (bf(r) (t)) dot bf(r)' (t) dif t \
      &= integral_(t=0)^pi vec(2 sin t , 3 cos t) dot vec(- sin t , cos t) dif t \
      &= integral_(t=0)^pi [-2 sin^2 t + 3 cos^2 t] dif t. $
    为了化简这些三角表达式，我们利用
    $ sin^2 t = (1 - cos 2 t) / (2) , quad cos^2 t = (1 + cos 2 t) / (2) . $
    把这些代入积分：
    $ integral_(t=0)^pi [- 2 dot (1 - cos 2 t) / (2) + 3 dot (1 + cos 2 t) / (2)] dif t
    &= integral_(t=0)^pi [- (1 - cos 2 t) + 3 / 2 (1 + cos 2 t)] dif t \
    &= integral_(t=0)^pi [1 / 2 + 5 / 2 cos 2 t] dif t. $
    由对称性，项 $integral_(t=0)^pi cos(2t) dif t$ 为零，
    所以最终的积分是 $#boxed[$pi slash 2$]$。

  - 现在设 $cal(C)$ 是图中所示的棕色线段。
    把曲线 $cal(C)$ 参数化为 $bf(r) (t) = (1 -  2 t, 0)$，其中 $0 <= t <= 1$。
    （如果你愿意，也可以用 $bf(r)(t) = (1-t, 0)$，其中 $0 <= t <= 2$，
    或者任何其他从 $(1,0)$ 出发、到 $(-1,0)$ 结束的参数化；你会得到同样的答案。）

    把 $bf(r) (t)$ 对 $t$ 求导：
    $ bf(r)' (t) = vec(- 2 , 0) . $
    与此同时，把参数化代入向量场：
    $ bf(F) (bf(r) (t)) = bf(F) (1 - 2t, 0) = vec(0, 3 - 6t). $
    这个点积恒等于零：
    $ vec(-2, 0) dot vec(0, 3-6t) = 0. $
    所以线积分也是 $#boxed[$0$]$。 #qedhere
]

特别地，功积分一般来说取决于你走哪条路径：
上面我们对蓝色路径和棕色路径得到了不同的答案。
只有对所谓的*保守*向量场
（我们马上会更多地谈到它），
功积分才与路径无关。

== [TEXT] 更多简写：$p dif x + q dif y$

记号 $integral_(cal(C)) bf(F) dot dif bf(r)$ _还_可以进一步缩简：
还有另一种简写把 $bf(F)$ 和 $bf(r)$ 一并都藏起来了。
如下：

#definition(title: [定义：线积分的更多简写])[
  在 $RR^2$ 中，设 $bf(F)(x,y) = vec(p(x,y), q(x,y))$。
  那么功积分可以进一步缩写为
  $ integral_(cal(C)) (p dif x + q dif y). $

  类似地，设我们有一个向量场
  $bf(F)(x,y,z) = vec(p(x,y,z), q(x,y,z), r(x,y,z))$，它定义在 $RR^3$ 上。
  那么功积分可以进一步缩写为
  $ integral_(cal(C)) (p dif x + q dif y + r dif z). $
]

#remark[
  下面解释这个简写为什么写成这样。
  为简单起见，假设我们在二维情形，且 $bf(r)(t) = vec(x(t), y(t))$。
  那么
  $vec(p,q) dot bf(r)' = vec(p,q) dot vec(x', y') = p dot x' + q dot y'
    = p dot (dif x) / (dif t) + q dot (dif y) / (dif t). $
  因此，如果我们要对 $integral_(t="起点")^("终点") vec(p,q) dot bf(r)' dif t$ 积分，
  我们可以想象把 $dif t$ “约掉”，
  得到的表达式看起来就像 $p dif x + q dif y$。

  就 18.02 的目的而言，这一切都只是为了助记；
  我们实际上并没有定义那些 $dif$ 符号是什么意思，
  所以我们无法给出比这更精确的陈述。
]

如果 $p$、$q$、$r$ 中有任何一个为零，那一项也可以完全省略。
例如在二维中，如果你看到
$ integral_(cal(C)) y dif x $
你应该把这个简写理解为
$ integral_(cal(C)) y dif x := integral_(cal(C)) (y dif x + 0 dif y) = integral_(cal(C)) vec(y, 0) dot dif bf(r). $

我们来做一道例题，沿一条不同的路径练习这个奇怪的 $dif x$ 和 $dif y$ 简写。
#sample[
  设 $cal(C)$ 表示抛物线 $y = x^2$ 从 $(-1,1)$ 出发、
  向右移动到 $(1,1)$ 的那段弧。
  计算线积分
  $ integral_(cal(C)) y^(2 slash 3) dif x. $
]
#soln[
  首先我们需要展开这个带 $dif x$ 和 $dif y$ 的简写。
  回忆一下，$p dif x + q dif y$ 是“向量场为 $vec(p,q)$”的简写。
  所以在 $y^(2 slash 3) dif x = y^(2 slash 3) dif x + 0 dif y$ 处，我们把这个简写展开为
  $ integral_(cal(C)) y^(2 slash 3) dif x = integral_(cal(C)) vec(y^(2 slash 3), 0) dot dif bf(r)
    = integral_(t="起始时刻")^("终止时刻") bf(F)(bf(r)(t)) dot bf(r)'(t) dif t $
  其中 $bf(F)(x,y) := vec(y^(2 slash 3), 0)$ 指的是
  由 $y^(2 slash 3) dif x$ 这个简写所编码的向量场。

  再说一次，如果你看看 @fig-work-ex1b 中的草图，我们预期功为正：
  所有箭头都指向右方，
  而红色的路径 $cal(C)$ 也在向右移动，
  所以所有的点积都是正的。
  （再说一次，如果你把那些蓝色箭头想象成河流，
  它肯定在帮你游泳，即使它不是完全对齐的，
  因为你并不是笔直向东游。）

  #figure(
    image("figures/work-ex1b.svg", width: auto),
    caption: [向量场 $bf(F)(x,y) = vec(y^(2 slash 3), 0)$（浅蓝色的小水平箭头）
    以及其中一段弧 $cal(C)$，它来自抛物线 $y=x^2$（紫色）。],
  ) <fig-work-ex1b>

  我们要走过的这段抛物线弧需要从 $(-1,1)$ 开始，到 $(1,1)$ 结束。
  为了具体一点，我们预期路径会经过的一些点例如是
  $ (-1,1) --> (-1/2, 1/4) --> (-1/3, 1/9) --> (0,0) --> (1/3, 1/9) --> (1/2, 1/4) --> (1,1). $
  总之，我们选择让时间在 $-1 <= t <= 1$ 范围内变化，取
  $ bf(r)(t) = (t, t^2). $

  现在把一切都代进去，我们有
  $ bf(F)(bf(r)(t)) = bf(F)(t, t^2) = vec(t^(4/3), 0) $
  以及
  $ bf(r)'(t) = vec(1, 2t). $
  于是总的线积分变成
  $
    integral_(t=-1)^1 underbrace(vec(t^(4/3),0), = bf(F)(bf(r)(t))) dot underbrace(vec(1, 2t), =bf(r)'(t)) dif t
    = integral_(t=-1)^1 t^(4/3) dif t
    = [3/7 t^(7/3)]_(t=-1)^1 = 6/7. #qedhere
  $
]

== [EXER] 习题

#exer[Suggested by Ting-Wei Chao][
  设 $cal(C)$ 是由抛物线 $y = x^2-1$ 从 $(-1, 0)$ 到 $(1, 0)$ 的那段弧，
  再接上从 $(1, 0)$ 回到 $(-1, 0)$ 的线段所构成的有向闭曲线。
  令 $ bf(F)(x,y) = vec(x^2(y+1), (y+1)^2). $
  用直接参数化计算 $integral_(cal(C)) bf(F) dot dif bf(r)$。
] <exer-parabola-1>

#exer[
  设 $cal(C)$ 是 $RR^2$ 中从 $(0,0)$ 到 $(2,3)$ 的一条曲线，其弧长为 $7$。
  设 $bf(F)$ 是一个向量场，具有如下性质：对曲线上任意一点 $P$，
  - $bf(F)(P)$ 的模长为 $5$；
  - $bf(F)(P)$ 与切向量成 $45 degree$ 角，此切向量为 $cal(C)$ 在 $P$ 处的切向量
    （该切向量沿着 $cal(C)$ 的方向）。
  计算 $integral_(cal(C)) bf(F) dot dif bf(r)$。
] <exer-work-given-angle>
