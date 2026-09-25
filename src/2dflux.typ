#import "@local/evan-zh:1.0.0":*

= 二维通量 <ch-2dflux>

== [TEXT] 二维通量的定义

我先很不情愿地定义二维通量，因为我刚讲完格林定理。
说“不情愿”是因为二维通量其实是三维通量的特例，
但为了简单起见，我们一直还在二维里工作。

通量的想法是：你在 $RR^2$ 中有某条闭曲线 $cal(C)$。
做功积分时，我们沿曲线 $cal(C)$ 走，把向量场
与该向量场上的切向量的点积加起来。

对于二维通量，我们改为把向量场与_法向量_作点积，
而不是与切向量。
按图应该画成_$90 degree$ 顺时针旋转 $bf(r)'(t)$_。
说真的，这可不是我编出来的。

#figure(
  image("figures/2dflux-dot.svg", width: auto),
  caption: [二维通量就是把切向量 $bf(r)'(t)$ 换成它旋转后的版本所得到的点积。],
)

无论如何，二维通量的定义如下。
#definition(title: [二维通量的定义])[
  向量场 $bf(F)$ 穿过由 $bf(r)(t)$ 参数化的
  闭路径 $cal(C)$ 的二维通量定义为
  $ integral_(t="起始时刻")^("终止时刻") bf(F)(bf(r)(t)) dot
    (90 degree "顺时针旋转" bf(r)'(t)) dif t. $
]

#typesig[
  二维通量是一个标量。
  它只对 $RR^2$ 中穿过 $RR^2$ 内闭路径的向量场有定义。
]

“$90 degree$ clockwise rotation of $bf(r)'(t)$”这个说法太笨拙了，
所以你可以打赌人们立刻造了个简写把它藏到地毯底下。
我想通常的记号是
$ bf(n) dif s := (90 degree "顺时针旋转" bf(r)'(t)) dif t $
于是上面的东西通常被压缩成
$ integral_(cal(C)) bf(F) dot bf(n) dif s. $
#digression(title: [题外话：为什么简写是 $bf(n) dif s$])[
  我认为使用这个简写的原因是：
  $bf(n)$ 应该表示“单位外法向量”，
  即长度为 $1$、方向由 $bf(r)'(t)$ 旋转 $90 degree$ 得到的向量。
  那么它就需要按模长 $|bf(r)'(t)|$ 缩放，
  于是我们沿用了弧长里那个老的 $dif s$。

  所以这个记号与标量场线积分所用的记号是一致的
  （如果你把标量场取为 $f = bf(F) dot bf(n)$）。
  但我不喜欢提这一点，因为在 18.02 中为了简单起见，
  除了弧长之外，我想避免使用标量场线积分。
]

#warning[
  旋转后的 $bf(r)'(t)$ 有时被称为“外法向量”。
  然而，尽管叫这个名字，只有当我们把 $cal(C)$ 定向为逆时针时它才指向外。
  如果 $cal(C)$ 是顺时针的，它就指向内！
]

== [TEXT] 二维通量的与水有关的解释

从水的角度说，如果把曲线 $cal(C)$ 看作某种可渗透的薄膜，
那么二维通量度量的是水流穿过薄膜的速率。
假设 $cal(C)$ 取逆时针定向，
如果水（净）流出 $cal(C)$，二维通量为正；如果水流入，则为负。

== [TEXT] 二维通量是二维功的旋转

我们不喜欢 $bf(n) dif s$ 这个记号，因为我们不喜欢标量场线积分。
幸运的是，还有另一种用简写写通量的方式，可以避开 $bf(n) dif s$ 记号。
为了看清它从何而来，再一次写出
$ bf(F)(x,y) = vec(p(x,y), q(x,y)). $
与其把 $bf(r)'(t)$ 顺时针旋转 $90 degree$，
不如想象我们把 $bf(F)$ 逆时针旋转 $90 degree$，并使用：
$ (90 degree " counterclockwise rotation of " bf(F) (x,y)) = vec(-q(x,y), p(x,y)). $
思路如下：
#idea[
  $ bf(F) dot (90 degree "顺时针旋转" bf(r)') = (90 degree "逆时针旋转" bf(F)) dot bf(r)'. $
]
所以我们的做法是把旋转这件事挪到向量场上去。
#proof(title: [等式的证明])[
  把它写清楚就是：想象 $bf(r)'(t) = vec( r'_1(t), r'_2(t) )$，
  也就是说它顺时针旋转 $90 degree$ 得到 $vec( r'_2(t), -r'_1(t) )$。
  那么这两个量
  $ bf(F) dot (90 degree "顺时针旋转" bf(r)') &= vec(p,q) dot vec(r'_2, -r'_1) \
    (90 degree "逆时针旋转" bf(F)) dot bf(r)' &= vec(-q, p) dot vec(r'_1, r'_2) $
  二者相等，因为它们都是 $p r'_2 - q r'_1$
  （严格说，
  这个量都应完整地写成 $p(bf(r)(t)) r'_2(t) - q(bf(r)(t)) r'_1(t)$，
  这对每个时刻 $t$ 而言成立）。
]

这样做的结果是，我们其实可以把通量变成功积分：
$ integral_(cal(C)) bf(F) dot bf(n) dif s = integral_(cal(C)) (bf(F) "已旋转" 90 degree "逆时针") dot dif bf(r). $
这看起来好一点了，但我们还是想甩掉那个旋转的说法。
不过这可以做到，因为功有一种只用 $p$ 和 $q$ 的简写。
具体来说，由于 $bf(F) "已旋转" 90 degree "逆时针" = vec(q, -p)$，我们有
$ integral_(cal(C)) (bf(F) "已旋转" 90 degree "逆时针") dot dif bf(r) = integral_(cal(C)) (-q dif x + p dif y). $
总之，我们得到下面这个更易读的简写：

#definition(title: [用功的简写给出的二维通量更好的定义])[
  设 $bf(F)(x,y) = vec(p(x,y), q(x,y))$ 是二维向量场，
  设 $cal(C)$ 是 $RR^2$ 中的一条路径。
  那么 $bf(F)$ 穿过 $cal(C)$ 的通量定义为
  $ integral_(cal(C)) (-q dif x + p dif y). $
]

#tip[
  因为这个缘故，在做具体计算时，我们通常更愿意把 $bf(F)$ 逆时针旋转 $90 degree$
  （而不是把 $bf(r)'$ 顺时针旋转 $90 degree$），
  当然两者给出的结果相同。
  我觉得这样更容易记住，也更自然，
  因为它让事情与功积分更一致。
  在后面的所有例子里我们都会用这个约定。
]

特别地，如果 $cal(C)$ 是环路（既然我们在谈通量，这通常是成立的），
那就意味着我们可以再次应用格林定理；
得到的定理称为_通量形式的格林定理_。
我们得到
$ integral.cont_(cal(C)) (-q dif x + p dif y)
  = integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $
右端是二维散度，所以还能进一步压缩为
$ integral.double_(cal(R)) nabla dot bf(F) dif A. $
同一个表达式现在大概有四个不同版本，
为了稳妥起见，我就把所有东西放到一处：

#memo(title: [记住：通量形式的格林定理])[
  设 $cal(C)$ 是取逆时针定向、围出区域 $cal(R)$ 的闭曲线。
  我们有
  $ underbrace(integral.cont_(cal(C)) (-q dif x + p dif y), = integral.cont_(cal(C)) (bf(F) dot bf(n) dif s))
    = underbrace(integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A,
      = integral.double_(cal(R)) nabla dot bf(F) dif A). $
]

#warning(title: [警告：通量没有 FTC])[
  在 @poster-stokes 中我们的海报上，二维通量明显是缺席的。
  在本章中，我们通过把二维通量翻译成二维功、再引用格林定理，
  得以补全一个类比，从而得到一个斯托克斯结论。
  然而，据我所知，没法用这种方式做出 FTC 的类比。
  所以 $bf(n) dif s$ 这个记号其实有一个好处：
  $dif s$ 的存在很好地提醒了我们不存在 FTC 结论。

  换言之，与二维功相比，二维通量在概念上少了一支红色斯托克斯箭头。
  （我想如果你真的很惦记它，可以试着追问
  $vec(-q,p)$ 是否保守来硬凑一个，但我没见过有人这么做。
  一个可能的原因是二维通量主要用于闭合环路 $cal(C)$，
  而格林定理反正能处理那种情形。）
]

== [SIDENOTE] 一张图解释为什么关于通量的格林定理应该成立（不是正式证明） <sec-2dflux-explain>

我们可以为关于通量的格林定理画一张与前面 @fig-ftcgreen-explain
（出自 @sec-ftcgreen-explain）非常相似的图。
记住，量
$ (partial p) / (partial x) + (partial q) / (partial y) = nabla dot bf(F) $
就是散度，它解释 $bf(F)$ 有多少在离开该点。
所以这一次我们画的不是_旋涡_，而是小小的绿色_爆炸_，
对应 $bf(F)$ 从每个灰色格子中流出的快慢。
图就变成了 @fig-2dflux-explain，而
$ integral.double_(cal(R)) nabla dot bf(F) dif A $
被画成绿色爆炸之和。

和之前一样，内部的一切都正好抵消。
于是剩下的就是对 $bf(F)$ _顶着_紫色墙的度量：
即 @fig-2dflux-explain 中的深绿色箭头。
而这正好对应 $bf(F)$ 顶着紫色墙的二维通量，正如所愿。

#figure(
  image("figures/2dflux-explain.svg", width: auto),
  caption: [关于通量的格林定理想表达的意思的粗略图示：
    把绿色爆炸加起来，剩下的正是 $bf(F)$ 顶墙的力。],
) <fig-2dflux-explain>

== [RECIPE] 计算二维通量 <sec-recipe-2d-flux>

#recipe(title: [计算二维通量的方法])[
  1. 如果 $cal(C)$ 是闭合环路，就用格林定理作捷径：
    $ integral.cont_(cal(C)) (-q dif x + p dif y) = integral.double_(cal(R)) ((partial p)/(partial x) + (partial q)/(partial y)) dif A. $
  2. 否则，做 @sec-work-manual-recipe 中的手工方法，
    但把 $bf(F) = vec(p,q)$ 换成它逆时针旋转 $90 degree$ 得到的 $vec(-q, p)$：
    1. 选取曲线 $cal(C)$ 的*任意*参数化 $bf(r) : RR -> RR^n$，
      包括指明起止时刻。
      如 @sec-flex-param 所述，在如何设定参数化上你有一些自由度。
    2. 计算导数 $bf(r)'(t)$。
    3. 计算点积 $vec(-q, p) dot bf(r)'(t)$。
      （向量场 $vec(-q,p)$ 是 $bf(F)$ 逆时针旋转 $90 degree$ 的结果。）
    4. 把它从起始时刻积分到终止时刻。
]

下面举几个例子作为记录。
对每个例子，我们实际都会展示如何“手工”做
（即计算一个线积分），以及如何用通量形式的格林定理来做。

#sample[
  计算向量场
  $bf(F) (x , y) = vec(x^2 , y^2)$ 穿过由 $x^2 + y^2 = 1$
  定义的圆周 $cal(C)$ 的通量，取逆时针定向。
]

#soln[
  对这个例子，作为对照，我们会同时展示用格林定理和手工两种做法。
  - 用格林定理：
    通量形式的格林定理说：
    $ "通量" = integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A , $
    其中 $cal(R)$ 是 $cal(C)$ 所围的区域。

    散度为
    $ nabla dot bf(F) = (partial p)/(partial x) + (partial q)/(partial y) = (partial)/(partial x)(x^2) + (partial)/(partial y)(y^2) = 2 x + 2 y. $
    因此，
    $ "通量" = integral.double_(cal(R)) (2 x + 2 y) dif A . $

    由于区域 $cal(R)$ 是以原点为中心的单位圆，且
    被积函数 $2 x + 2 y$ 在这个对称区域上是奇函数，
    该积分等于 $#boxed[$ 0 $]$。
    （或者也可以用极坐标来积分。）

  - 使用定义
    $ "通量" = integral.cont_(cal(C)) (p dif y - q dif x) $
    并用下式参数化曲线
    $ bf(r)(t) = vec(cos(t), sin(t)) quad 0 <= t <= 2pi $
    所以
    $ bf(r)'(t) = vec(-sin(t), cos(t)) quad 0 <= t <= 2pi. $
    于是被积函数中的点积为
    $ (bf(F) "已旋转" 90 degree "逆时针") dot bf(r)'(t)
      &= vec(-q, p) dot bf(r)'(t) \
      &= vec(-sin(t)^2, cos(t)^2) dot vec(-sin(t), cos(t)) \
      &= sin^2 t dot sin t + cos^2 t dot cos t = sin^3 t + cos^3 t = cos^3 t + sin^3 t. $
    因此
    $ "通量" = integral_(t = 0)^(t = 2 pi) (cos^3 t + sin^3 t) dif t . $
    从这里又可以观察到积分是对称的；
    也就是说，对 $0 <= t <= pi$ 有 $cos^3(t) + cos^3(t+pi) = 0$，
    并且 $sin^3(t) + sin^3(t+pi) = 0$。
    所以整个积分的贡献同样是 $#boxed[$0$]$。
]

#sample[
  计算向量场
  $bf(F) (x , y) = vec(5x, 7y)$ 穿过正方形
  $cal(C)$ 的通量，其顶点为 $(1 , 1)$、$(-1 , 1)$、$(-1 , -1)$、$(1 , -1)$，取逆时针定向。
]

#soln[
  如果手工做这个线积分，
  我们就得把四条边都参数化。
  这虽然直截了当，但很烦人，所以我们直接跳到
  格林定理这个捷径。

  散度为
  $ nabla dot bf(F) := (partial p)/(partial x) + (partial q)/(partial y)
    = (partial)/(partial x)(5x) + (partial)/(partial y)(7y) = 12. $
  于是由格林定理，
  $ "通量" = integral.double_(cal(R)) 12 dif A = 12 op("面积")(cal(R)) = 12 dot 2^2 = #boxed[$ 48 $]$
  其中 $cal(R)$ 是 $cal(C)$ 所围的区域，即边长为 $2$ 的正方形。
]

#sample[
  设 $a, b > 0$。
  计算向量场
  $bf(F) (x , y) = vec(x , y)$ 穿过由 $x^2 / a^2 + y^2 / b^2 = 1$
  定义的椭圆 $cal(C)$ 的通量，取逆时针定向。
]

#soln[
  我们并不真的想参数化这个椭圆#footnote[尽管
    可以用 $bf(r) = (a cos t, b sin t)$（$0 <= t <= 2pi$）来做。
    所以也没_那么_糟。]
  同样，我们直接跳到格林定理，其中
  $
    nabla dot bf(F)
    = (partial p) / (partial x) + (partial q) / (partial y)
    = (partial) / (partial x) (x) + (partial) / (partial y) (y)
    = 1 + 1 = 2.
  $
  于是由格林定理，
  $ "通量" = integral.double_(cal(R)) 2 dif A = 2 op("面积")(cal(R)). $
  在前面某一节（@sec-ex-ellipse）中我们看到这个椭圆的面积是 $a b pi$；
  如果你不记得了，可以回到换元那里去执行一遍。
  无论如何，这意味着通量为 $2 dot (a b pi) = #boxed[$ 2 a b pi $]$。
]

== [RECAP] 比较

既然二维通量与功的方法看起来如此相似，
把它们并排比较一下也许有帮助。
比较见下表。

#figure(
  table(
    columns: 3,
    align: left,
    table.header([方法],
      [功 $integral_(cal(C)) bf(F) dot dif bf(r)$\（见 @sec-recipe-work）],
      [二维通量 $integral_(cal(C)) bf(F) dot bf(n) dif s$ \（见 @sec-recipe-2d-flux）]),
    table.hline(),
    [$bf(F)$ 保守 \ $==>$ FTC],
      [如果 $bf(F) = nabla f$，\ 输出 $f("终点") - f("起点")$], [_不适用_],
    [$cal(C)$ 是闭合环路 \ $==>$ Green],
      [输出 $integral.double_(cal(R)) underbrace(((partial q)/(partial x) - (partial p)/(partial y)), "2D scalar curl") dif A$],
      [输出 $integral.double_(cal(R)) underbrace((partial p)/(partial x) + (partial q)/(partial y), "Div" = nabla dot bf(F)) dif A$],
    [徒手定义 \ 使用参数化],
      [输出 $integral (p dif x + q dif y)$ \ $= integral_(cal(C)) bf(F) dot bf(r)'(t) dif t$ ],
      [输出 $integral (-q dif x + p dif y)$ \ $= integral_(cal(C)) (bf(F) "rot" 90 degree "ccw") dot bf(r)'(t) dif t$],
  ),
  caption: [
    功与通量两种方法的比较。
    表中越靠上的方法越省力，适用时应优先采用。
  ],
  kind: table
) <tab-work-vs-flux>

如果你想看到这些写出来的例子，见 @ch-lineex。
在那里我完整地做了四个例子，用到了 @tab-work-vs-flux 中每个适用的格子。
因为太长了，我把它拆分成了一个单独的可跳过章节。

== [EXER] 习题

#exer[由 Ting-Wei Chao 提供][
  与 @exer-parabola-1 和 @exer-parabola-2 一样，
  设 $cal(C)$ 是由抛物线 $y = x^2-1$ 从 $(-1, 0)$ 到 $(1, 0)$ 的弧，
  再接上从 $(1, 0)$ 回到 $(-1, 0)$ 的线段所构成的定向闭曲线。
  仍令 $ bf(F)(x,y) = vec(x^2(y+1), (y+1)^2). $
  用直接参数化以及用通量形式的格林定理
  计算 $integral_(cal(C)) bf(F) dot bf(n) dif s$。
] <exer-parabola-3>

#exer[
  三角形 $A B C$ 的顶点为 $A = (-5,0)$、$B = (9,0)$，以及 $y$ 轴正半轴上的 $C$。
  向量场
  $ bf(F) (x , y) = vec(x + 7y^2, x^2 + 7y) $
  穿过 $A B C$ 周界（取逆时针定向）的通量为 $672$。
  计算 $A B C$ 周界的长度。
] <exer-flux-triangle>
