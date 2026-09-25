#import "@local/evan-zh:1.0.0":*

= 所有那些多得数不清的奇怪 $dif$ 简写

== [TEXT] 面积的简写 $dif A := dif x dif y$

到这里为止，我一直很小心地总是写成
$ integral.double_(cal(R)) f(x,y) dif x dif y$
以便清楚地表明积分变量是什么。

然而，你们中的一些人大概已经开始厌倦写
$dif x dif y$ 和 $dif y dif x$ 了。
特别是，我之前建议过你，最好写
$ integral_(x=0)^5 integral_(y=0)^(3) f(x,y) dif y dif x $
而不是更难读的 $integral_0^5 integral_0^3 f(x,y) dif y dif x$。
采纳了我建议的人，可能不想再浪费时间
去记最后到底是 $dif y dif x$ 还是 $dif x dif y$，
因为这对你来说已经不重要了。
出于这个原因，在此我授予你下面这个定义：
#definition(title: [$dif A$ 的定义])[
  我们让 $dif A$ 作为 $dif x dif y$ 或 $dif y dif x$ 的简写，
  哪一个适合当前的语境就用哪一个。
]
所以现在你只要写：
$ integral_(x=0)^5 integral_(y=0)^(3) f(x,y) dif A. $
我猜这省了两个字符。

#tip(title: [提示：变量名也常常被省略])[
  事实上，当你使用简写时，你甚至可以把 $x$ 和 $y$ 从 $f$ 中省略掉，只写
  $ integral_(x=0)^5 integral_(y=0)^(3) f dif A. $
  所以任何时候只要用了简写，
  如果变量名完全不见了，也不要惊讶。
]

小心不要把这个简写用过头了！
例如，如果你在处理_极坐标_，那么事实上
$ dif A = dif x dif y = r dif r dif theta $
正如我们刚看到的。注意多出来的那个 $r$ 因子！
说真的，$dif A != dif r dif theta$！

如果你相信自己不会忘记那个 $r$ 因子，
或者你做的计算中实际变量并不重要，
你也可以在这里使用 $dif A$。
例如，你可以写
$ integral.double_("unit disk") dif A = pi $
来表示单位圆盘的面积积分是 $pi$。
（纯粹数学家也许会欣赏这一点：它不依赖于任何坐标的选择。）

但如果你这么做，就对自己诚实一点，问问自己是否真的信得过自己用这个简写：
#quote[拙劣的工匠才会怪罪自己的工具。]

== [TEXT] ...还有另外六个简写

当我们谈论向量场、甚至只是弧长时，还会出现更多新类型的积分。
而人们有各种各样类似的简写。
如果你读的书足够多，你大概最终会在各种在线书籍中
见到 $dif bf(r)$、$dif A$、$dif V$、$dif s$、$dif S$、$dif bf(S)$
全部这些记号。
我无法想象这对第一次学这门学科的人来说有多烦人。

#figure(
  table(
    columns: 4,
    align: left,
    table.header([符号], [名称], [用于], [所代表的简写]),
    [$dif A$], [面积], [二重/面积积分],
      [$dif x dif y$（在极坐标中立即替换为 $r dif r dif theta$）],
    [$dif s$], [弧长], [标量场线积分 \ （在 @ch-scalint 中）],
      [$|bf(r)'(t)| dif t$ \ 其中 $bf(r)(t)$ 参数化一条路径],
    [$dif bf(r)$], [线元], [向量场线积分 \ （在 @ch-work 中）],
      [$bf(r)'(t) dif t$\ 其中 $bf(r)(t)$ 参数化一条路径],
    [$dif S$], [表面积], [标量场曲面积分 \ （在 @ch-scalint 中）],
      [$|(partial bf(r))/(partial u) times (partial bf(r))/(partial v)| dif u dif v$ \ 其中 $bf(r)(u,v)$ 参数化一个曲面],
    [$bf(n) dif S$ \ 或 $dif bf(S)$], [曲面法向], [向量场曲面积分 \ （在 @ch-flux 中）],
      [$(partial bf(r))/(partial u) times (partial bf(r))/(partial v) dif u dif v$ \ 其中 $bf(r)(u,v)$ 参数化一个曲面],
    [$dif V$], [体积], [三重/体积积分 \ （在 @ch-triple 中）],
      [$dif x dif y dif z$],
    [$bf(n) dif s$], [外法向], [仅二维通量（在 @ch-2dflux 中）],
      [$(90 degree "顺时针旋转" bf(r)'(t)) dif t$]
  ),
  caption: [你以后会见到的一堆简写。
    注意，@poster-triangle 中几乎每种积分都有一个对应的简写。
    到了 India 部，当升级版的挂图 @poster-stokes 被引入时，
    每一种新的积分（那些紫色的图）也都有一个新简写。],
  kind: table
) <table-shorthand>

所以事情是这样的。

- 首先，我要把所有这些简写的含义做成下面这张表。
  结果就是 @table-shorthand。
  你可以随意把它打印出来带在身边。
  注意，这些简写大多你都还没见过，所以目前只有第一行看得懂。
- 其次，在第一次引入某个概念时，我会避免使用简写 ---例如，
  我在 @poster-triangle 以及后来的 @poster-stokes 上
  都刻意没有用任何简写---
  但到后面你练得更多时，我就会开始用它。
- 第三，在每一处简写_可以_首次使用的地方，我都会提一句。
  也就是说，表里每引入新的一行，我都会让你知道。

但再说一次，我认为要记住的要点是：这些每一个都只是简写。
所以如果你不喜欢简写，你随时都可以把它替换成它所代表的东西。

#digression(title: [关于微分形式的题外话])[
  把它们称为简写有点算是善意的谎言，
  因为所有这些 $dif$ 符号其实都是有章可循的。
  它们大多是所谓的_微分形式_或_密度_，
  而你确实可以对它们给出精确的定义。
  但这远远超出了 18.02 的范围，我就不再多费篇幅了。
]
