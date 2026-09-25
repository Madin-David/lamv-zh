#import "@local/evan-zh:1.0.0":*

= 二重积分

18.02 中一个你可能在 Foxtrot 部已经注意到的常见主题是：
不像 18.01 里你过度专注于所要优化的函数 $f$，
在 18.02 中，你所处理的_区域_值得大量的关注。
本章的内容也是如此 ---
在你去看被积函数 $f$ 之前，
就应该把大部分注意力放在区域上。

== [RECIPE] 在矩形上积分

如果你想在矩形上积分，这超级简单。
它基本上就像偏导数：你假装某些变量是常数，
一次只有一个变量在变化。
先看一个例子会比先看方法更容易理解。

#warning(title: [警告：有些资料不会帮你把变量写进 $integral$ 里])[
  与其只写 $integral_a^b f(t) dif t$，
  我通常更愿意写成 $integral_(t=a)^b f(t) dif t$，
  这样更容易看出是对哪个变量积分。
  并不是所有资料都会这么体贴，它们实际上会让你
  把 $dif x$ 和 $dif y$ 倒着读；例如，如果你看到
  $ integral_0^6 integral_0^1  x y^2 dif x dif y $
  那么它实际上的意思是
  $ integral_0^6 (integral_0^1  x y^2 dif x) dif y $
  也就是 $0 <= x <= 1$ 且 $0 <= y <= 6$。
  对我来说，这样倒着读实在烦得要命，
  所以我觉得还是写成
  $ integral_(y=0)^6 integral_(x=0)^1  x y^2 dif x dif y $
  容易得多，我建议你改用这种记号。
  好处是你基本上再也不用去看
  最右边那个 $dif x dif y$ 了；
  你需要的信息全都集中在最左边。
]

#sample[
  计算 $integral_(y=0)^6 integral_(x=0)^1  x y^2 dif x dif y. $
]
#soln[
  1. 第一步是计算关于 $x$ 的内层积分，
    把 $y$ 当作常数。

    内层积分是：$ integral_(x=0)^1 x y^2 dif x . $

    由于 $y^2$ 相对于 $x$ 被当作常数，我们可以把它
    提出积分号：$ y^2 integral_(x=0)^1 x dif x . $

    现在计算 $integral_(x=0)^1 x dif x$：
    $ integral_(x=0)^1 x dif x = [x^2 / 2]_0^1 = 1^2 / 2 - 0^2 / 2 = 1 / 2 . $

    因此，内层积分的结果是：
    $ y^2 dot 1 / 2 = y^2 / 2 . $

  2. 现在把内层积分的结果代入外层积分：
    $ integral_(y=0)^6 y^2 / 2 dif y &= 1 / 2 integral_(y=0)^6 y^2 dif y
      = 1/2 [y^3 / 3]_0^6 = 1/2( 6^3 / 3 - 0^3 / 3) = #boxed[$ 36 $]. $
]
很简单，对吧？
一般的做法是一样的。

#recipe(title: [在矩形上积分的方法])[
  要对形如 $integral (integral dif y) dif x$ 的式子积分：
  1. 像在 18.01 中那样求内层积分，把 $x$ 当作常数。
    这应该给你一个只含 $x$、不再有 $y$ 的表达式。
  2. 用上一步的结果替换内层积分，
    得到一个只含 $x$ 的 18.01 积分。再对它积分。
]

再看一个例子。
#sample[
  计算二重积分：
  $ integral_(x=0)^pi integral_(y=0)^1 x cos (x y) dif y dif x . $
]
#soln[
  1. 第一步是计算关于 $y$ 的内层积分，
    把 $x$ 当作常数。
    内层积分是：$ integral_(y=0)^1 x cos (x y) dif y . $

    由于 $x$ 相对于 $y$ 被当作常数，我们可以把
    $x$ 提出积分号：$ x integral_(y=0)^1 cos (x y) dif y . $

    现在计算 $integral_(y=0)^1 cos (x y) dif y$。
    $ integral_(y=0)^1 cos (x y) dif y = [1/x sin (x y)]_0^1 = sin(x) / x. $

    因此，内层积分的结果是：
    $ x dot sin(x) / x = sin (x) . $

  2. 现在把内层积分的结果代入外层
    积分：$ integral_(x=0)^pi sin (x) dif x . $

    我们知道 $integral sin (x) dif x = - cos (x)$。因此：
    $ integral_(x=0)^pi sin (x) dif x = [- cos (x)]_0^pi = - cos (pi) + cos (0) . $

    利用 $cos (pi) = - 1$ 和 $cos (0) = 1$，得到：
    $ - (- 1) + 1 = 1 + 1 = #boxed[$ 2 $] . $
]

== [RECIPE] 在没有矩形的情况下做 $x y$ 积分 <sec-convert-x-y-integration>

一般来说，很多二维区域 $cal(R)$ 仍然可以用 $x y$ 积分来处理，
即使它们不是矩形。
在这种情况下，积分记作
$ integral.double_(cal(R)) f(x,y) dif x dif y := "integral of " f " over " cal(R) $
其中 $f$ 是你要积分的任意函数。
如果区域是由若干不等式给出的，你也可以直接把区域写进去，
即 $integral.double_(x^2+y^2<=1) f(x,y) dif x dif y$ 表示 $f$
在单位圆盘上的积分。

具体做法如下。
#remark[
  很多其他资料可能会把它写成
  $integral.double_(cal(R)) f(x,y) dif A$，这样更短；
  这里默认面积元素 $dif A$ 是 $dif x dif y$ 的简写。

  不过，在你刚上手的时候，我还是会明确写出 $dif x dif y$，
  因为我不想把积分变量藏起来 --- 大概算是辅助轮吧。
  话虽如此，如果你清楚自己在做什么，想用 $dif A$ 省时间，那就用吧！

  那些更奇怪的 $dif$ 符号我们后面再谈。
]

#recipe(title: [转化为 $x y$ 积分的方法])[
  1. 尽你所能画出这个区域的图像。
  2. 把该区域写成一串不等式。#footnote[我觉得
    别的资料不一定都按我的方式写不等式。
    但我认为这会大大帮助你确保积分限的方向是对的。]
  3. 取 $x$ 和 $y$ 中的_一个_，用你的图像描述它所有可能的取值。
  4. 在所有不等式中解出_另一个_变量。
]

#remark(title: [注：这个方法对矩形同样适用！])[
  即使区域是矩形，你也可以用这个方法。
  如果你这么做，这个方法告诉你：对矩形你可以按任意一种次序积分：
  给定由满足 $a <= x <= b$ 和 $c < y <= d$ 的点 $(x,y)$ 组成的矩形，我们有
  $ integral_(x=a)^b integral_(y=c)^d f(x,y) dif y dif x
    = integral_(y=c)^d integral_(x=a)^b f(x,y) dif x dif y. $
  有时这样会更容易。
  一种常见的考题形式是：选取这样的 $f$，使得左边
  直接计算很麻烦而右边很容易算，
  然后要求你求左边。
  所以这是在考查你识别何时换个次序更好的能力。
]

例如，我们来看 Poonen 的例 13.1 中的区域：
#sample[
  展示把函数 $f(x,y)$
  在由 $y-x=2$ 与 $y=x^2$ 所围成的区域上积分时，两种列出积分的方式。
]

#figure(
  image("figures/double-pararegion.svg", width: auto),
  caption: [$y=x^2$ 与 $y-x=2$ 之间的区域。],
) <fig-pararegion>

#soln[
  见 @fig-pararegion。
  有两个交点显然是我们想知道的，
  所以我们可以通过解方程组求出这两个交点，并把它们标到图上：
  $ cases(y-x=2, y=x^2) &==> x+2 = x^2 ==> x = -1 " or " x = 2 \
    &==> (x,y) = (-1,1) " or " (x,y) = (2,4). $
  我还会标出 $(0,0)$，也就是抛物线的底部。

  所以我们要的是平面上位于抛物线 $y=x^2$ _上方_、
  但在直线 $y-x=2$ _下方_的那部分。
  我觉得，如果你把这个区域看成不等式组
  $ y >= x^2 \
    y - x &<= 2. $
  来考虑，会更容易想清楚。

  现在有两种切分方式，取决于你想让 $x$ 和 $y$ 中的哪一个在外层。

  / 如果 $x$ 在外层:
    首先，设想我们让 $x$ 作为外层积分变量。
    那么从图中你可以看出 $-1 <= x <= 2$。
    如果解出 $y$，我们发现它的范围是
    $ x^2 <= y <= x+2. $
    见 @fig-pararegion-vert。

    #figure(
      image("figures/double-para-vert.svg", width: auto),
      caption: [把 @fig-pararegion 竖直剖分，这样很好。
      上边界只有一个盖子（蓝色），下边界只有一条边（紫色），
      于是对每个给定的 $x$，$y$ 的切片（用绿色画出）都容易描述。],
    ) <fig-pararegion-vert>

    于是我们得到二重积分
    $ integral_(x=-1)^2 integral_(y=x^2)^(x+2) f(x,y) dif y dif x. $

  / 如果 $y$ 在外层:
    另一方面，设想我们先用 $y$。
    从图中我们看到 $y$ 的取值范围从 $0$ 一直到 $4$。
    （所以在接下来的记号中我会写上 $y >= 0$，让表达更好看。）

    但 $x$ 很棘手。问题在于，当你解出 $x$ 时会得到_三条_不等式：

    - $y <= x^2$ 解出 $-sqrt(y) <= x <= sqrt(y)$
    - $y - x <= 2$ 解出 $y-2 <= x$.

    见 @fig-pararegion-horiz。

    #figure(
      image("figures/double-para-horiz.svg", width: auto),
      caption: [把 @fig-pararegion 水平剖分，这样就不太好了：要分情况。
      在直线 $y=1$ 上方，左边是一道蓝色的墙，右边是一段弯曲的紫色弧。
      但在 $y=1$ 下方，左边变成抛物线的红色弧，
      右边是抛物线的紫色弧。],
    ) <fig-pararegion-horiz>


    如果你知道 max 函数是怎么工作的，你甚至可以把它写成
    $ max(y-2, -sqrt(y)) <= x <= sqrt(y). $
    主要问题在于 $x$ 的下端点会随情况不同而变化。
    当 $y <= 1$ 时，界 $-sqrt(y)$ 胜过界 $y-2$。
    但当 $y >= 1$ 时，界 $y-2$ 才是更有信息量的不等式。
    所以如果我们想把它写成二重积分，实际上必须拆成两个：
    $ integral_(y=0)^1 integral_(x=-sqrt(y))^(sqrt(y)) f(x,y) dif x dif y
      + integral_(y=1)^4 integral_(x=y-2)^(sqrt(y)) f(x,y) dif x dif y. $
]

== [TEXT] 一个带具体函数 $f$ 的例子

上一个例子中，我们展示了如何把一个任意的函数 $f$
在直线 $y-x=2$ 与抛物线 $y=x^2$ 之间的区域上积分。
再次强调，这一过程只依赖于区域 --- 它与 $f$ 无关。

为了把内容充实起来，我们像 Poonen 那样取一个示例函数 $ f(x,y) = 2x+4y $
并展示如何求出积分。

#sample[
  考虑我们刚才描述的区域 $cal(R)$，
  即介于 $y-x=2$ 与 $y=x^2$ 之间的点集。
  在这个区域上求积分 $integral.double_(cal(R)) (2x+4y) dif x dif y$。
]
#soln[
  正如我们所见，有两种不同的列法。
  我们来做那个好的（之后为了对比再展示更糟的那个），
  也就是让 $x$ 在外层。

  我们要求的是积分
  $ integral_(x = - 1)^2 integral_(y = x^2)^(x + 2) (2 x + 4 y) dif y dif x. $

  1. 第一步是计算关于 $y$ 的内层积分，
    把 $x$ 当作常数。

    内层积分是：
    $ integral_(y = x^2)^(x + 2) (2 x + 4 y) dif y . $

    我们可以把这个积分拆成两部分：
    $ integral_(y = x^2)^(x + 2) 2 x dif y + integral_(y = x^2)^(x + 2) 4 y dif y . $

    - 第一项是：
      $ 2 x integral_(y = x^2)^(x + 2) 1 dif y = 2 x [y]_(y = x^2)^(y = x + 2) = 2 x ((x + 2) - x^2). $

    - 第二项是：
      $ 4 integral_(y = x^2)^(x + 2) y dif y = 4 [y^2 / 2]_(y = x^2)^(y = x + 2) = 4 ((x + 2)^2 / 2 - (x^2)^2 / 2)  = 2(x^2 + 4x + 4 - x^4). $
    因此，内层积分是：
    $ 2 x (x + 2 - x^2) + 2 (x^2 + 4 x + 4 - x^4) = - 2 x^4 - 2 x^3 + 4 x^2 + 12 x + 8 . $

  2. 现在计算外层积分：
    $ & integral_(x = - 1)^2 (- 2 x^4 - 2 x^3 + 4 x^2 + 12 x + 8) dif x \
      &= lr([-2 x^5 / 5 - 2 dot x^4/4 + 4 x^3/3 + 12 dot x^2/2 + 8x])_(x=-1)^2. $
    这里算术很多，抱歉。
    一种做法是逐项计算：
    $
    -2 [x^5 / 5]_(x = - 1)^(x = 2) &= - 2 (32 / 5 - (- 1)^5 / 5) = - 2 dot 33 / 5 = - 66 / 5 \
    -2 [x^4 / 4]_(x = - 1)^(x = 2) &= - 2 (16 / 4 - 1 / 4) = - 2 dot 15 / 4 = - 15 / 2 \
    4 [x^3 / 3]_(x = - 1)^(x = 2) &= 4 (8 / 3 - (- 1)^3 / 3) = 4 dot 9 / 3 = 12 \
    12 [x^2 / 2]_(x = - 1)^(x = 2) &= 12 dot 3 / 2 = 18 \
    8 dot (2 - (- 1)) &= 8 dot 3 = 24.
    $
    把它们加起来得到答案：$ -66/5 -15/2 + 12 + 18 + 24 = #boxed[$ 333/10 $]. $
]

== [SIDENOTE] 用困难的方式积分会是什么样子

在前面的例题中，我们选 $x$ 作为外层积分变量，
这样就不必分情况，也不用处理平方根。
这显然是个好选择。

作为对比，我要给你展示如果改为让 $y$ 在外层积分会怎样 ---
只是为了说明事情可能变得很难看。
（如果你想练习累次积分，可以读下去；
如果你信我，跳过也行。）
再强调一下，我们要直接计算

$ integral_(y=0)^1 integral_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y
  + integral_(y=1)^4 integral_(x=y-2)^(sqrt(y)) (2x+4y) dif x dif y. $

- 我们计算第一块 $ integral_(y=0)^1 integral_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y. $

  1. 第一步是计算关于 $x$ 的内层积分，
    把 $y$ 当作常数。
    内层积分是：
    $ integral_(x = - sqrt(y))^(sqrt(y)) (2 x + 4 y) dif x . $

    我们可以把它拆成两个积分：
    $ integral_(x = - sqrt(y))^(sqrt(y)) 2 x dif x + integral_(x = - sqrt(y))^(sqrt(y)) 4 y dif x . $

    - 第一项是：
    $ 2 integral_(x = - sqrt(y))^(sqrt(y)) x dif x = 2 [x^2 / 2]_(x = - sqrt(y))^(x = sqrt(y)) = 2 dot ((sqrt(y))^2 / 2 - (- sqrt(y))^2 / 2) . $

    - 第二项是：
    $ 4 y integral_(x = - sqrt(y))^(sqrt(y)) 1 dif x = 4 y [x]_(x = - sqrt(y))^(x = sqrt(y)) = 4 y (sqrt(y) - (- sqrt(y))) = 4 y dot 2 sqrt(y) = 8 y^(3 / 2) . $

    因此，内层积分是：$ 0 + 8 y^(3 / 2) = 8 y^(3 / 2) . $

  2. 现在计算外层积分：
    $ integral_(y = 0)^1 8 y^(3 \/ 2) dif y . $
    我们使用幂法则来积分：
    $ integral y^(3 \/ 2) dif y = y^(5 \/ 2) / 5 / 2 = 2 / 5 y^(5 \/ 2) . $

    因此外层积分变为：
    $ 8 integral_(y = 0)^1 y^(3 / 2) dif y = 8 dot 2 / 5 [y^(5 / 2)]_(y = 0)^(y = 1) = 8 dot 2 / 5 dot (1^(5 / 2) - 0^(5 / 2)) = 8 dot 2 / 5 = 16/5 . $

  于是第一块是 $ integral_(y=0)^1 integral_(x=-sqrt(y))^(sqrt(y)) (2x+4y) dif x dif y = 16/5 = 3.2. $

- 我们计算第二块 $ integral_(y=0)^1 integral_(x=y-2)^(sqrt(y)) (2x+4y) dif x dif y. $
  1. 第一步是计算关于 $x$ 的内层积分，
    把 $y$ 当作常数。
    内层积分是：
    $ integral_(x = y - 2)^(sqrt(y)) (2 x + 4 y) dif x . $

    我们可以把它拆成两个积分：
    $ integral_(x = y - 2)^(sqrt(y)) 2 x dif x + integral_(x = y - 2)^(sqrt(y)) 4 y dif x . $

    - 第一项是：
      $ integral_(x = y - 2)^(sqrt(y)) 2 x dif x = 2 [x^2 / 2]_(x = y - 2)^(x = sqrt(y)) = ((sqrt(y))^2 - (y - 2)^2) . $
      化简：
      $ (y - (y^2 - 4 y + 4)) = y - (y^2 - 4 y + 4) = y - y^2 + 4 y - 4 = - y^2 + 5 y - 4 . $

    - 第二项是：
      $ 4 y integral_(x = y - 2)^(sqrt(y)) 1 dif x = 4 y (sqrt(y) - (y - 2)) = 4 y (sqrt(y) - y + 2) = 4 y (sqrt(y) - y + 2) . $
      因此，内层积分是：
      $ (- y^2 + 5 y - 4) + 4 y (sqrt(y) - y + 2) = - y^2 + 5 y - 4 + 4 y sqrt(y) - 4 y^2 + 8 y . $

    化简后我们得到内层积分为 $ - 5 y^2 + 13 y + 4 y sqrt(y) - 4 . $

  2. 现在计算外层积分：
    $ integral_(y = 1)^4 (- 5 y^2 + 13 y + 4 y sqrt(y) - 4) dif y . $

    为了保持条理，我们逐项积分：
    $
    integral_(y = 1)^4 - 5 y^2 dif y &= - 5 [y^3 / 3]_(y = 1)^(y = 4) = - 5 dot (64 / 3 - 1 / 3) = - 5 dot 63 / 3 = - 105 \
    integral_(y = 1)^4 13 y dif y &= 13 [y^2 / 2]_(y = 1)^(y = 4) = 13 dot (16 / 2 - 1 / 2) = 13 dot 15 / 2 = 97.5 \
    integral_(y = 1)^4 4 y sqrt(y) dif y &= 4 integral_(y = 1)^4 y^(3 \/ 2) dif y = 4 dot [2 / 5 y^(5 \/ 2)]_(y = 1)^(y = 4) = 4 dot 2 / 5 (32 - 1) = 248 / 5 = 49.6 \
    integral_(y = 1)^4 - 4 dif y &= - 4 [y]_(y = 1)^(y = 4) = - 4 (4 - 1) = - 12.
    $

    现在把这些积分加起来：$ - 105 + 97.5 + 49.6 - 12 = 30.1 . $

- 最终答案是 $3.2 + 30.1 = 33.3$，与预期相符。

所以我们得到了同样的答案，毫不意外，但付出的功夫多得多。

== [TEXT] 积分的几种物理解释

取决于所选取的函数 $f$，积分可能具有某种物理意义。
这里我们给出几个例子：

=== 面积

如果你取 $f = 1$，得到的就是面积。

#recipe(title: [求面积的方法])[
  要找到一个区域 $cal(R)$ 的面积，用
  $ op("面积")(cal(R)) = integral.double_(cal(R)) 1 dif x dif y. $
]
#digression(title: [题外话：这就是面积的定义])[
  有时有人问我，为什么我们选择对 $1$ 积分，而不是对别的函数积分。
  答案可能有点出人意料：
  你其实可以把上面的积分当作面积的_定义_。
  （如果你仔细回想高中学过的东西，
  可能会意识到其实从来没有人给过你“面积”这个词的精确定义，
  而这是有充分理由的。）
]

#tip[
  你也会（而且应该）反过来用这个方法：
  假设你在做某道题，最后得到 $integral.double_(cal(R)) dif x dif y$，
  其中 $cal(R)$ 是圆 $x^2 + y^2 <= 1$。
  不要费劲去真的计算这个积分：
  它就是半径为 $1$ 的圆的面积，也就是 $pi$！
]

#sample[
  考虑我们刚才描述的区域 $cal(R)$，
  即介于 $y-x=2$ 与 $y=x^2$ 之间的点集。
  计算它的面积。
]
#soln[
  我们把它写成
  $ integral_(x = - 1)^2 integral_(y = x^2)^(x + 2) 1 dif y dif x. $
  内层积分很容易 $integral_(y=x^2)^(x+2) dif y = (x+2)-x^2$。
  所以答案是
  $ integral_(x = - 1)^2 (x+2-x^2) dif x =
    lr([x^2/2 + 2x - x^3/3])_(x=-1)^(x=2)
    = (2+4-8/3) - (1/2-2+1/3) = #boxed[$ 9/2 $]. #qedhere $
]


#sample[
  计算区域 $cal(R)$ 的面积，其中 $0 <= x <= 10$ 且 $0 <= y <= x^2$。
]
#soln[
  写出
  $ integral_(x=0)^(10) integral_(y=0)^(x^2) 1 dif y dif x
  = integral_(x=0)^(10) x^2 dif x = [x^3/3]_(x=0)^(10) = #boxed[$ 1000/3 $]. #qedhere $

]
其实这只是你在 18.01 中学过的“曲线下方的面积”的另一种说法：
当时你会写
$integral_(x=0)^(10) x^2 dif x = [x^3/3]_(x=0)^(10) = 1000/3$
并被告知“这就是曲线 $y=x^2$ 下方的面积”，如 @fig-double-under-curve-area 所示。
但 18.02 的定义更加通用，因为它让我们可以对
$x y$ 平面中_任意_可积区域给出面积的定义，
而不只是形如 $y = f(x)$ 的曲线下方的那些。

#figure(
  image("figures/double-under-curve-area.svg", width: auto),
  caption: [
    用 18.02 的语言写出的面积 $integral_(x=0)^(10) integral_(y=0)^(x^2) 1 dif y dif x$
    与你在 18.01 积分 $integral_(x=0)^(10) x^2 dif x$ 中预期的结果一致。
  ],
) <fig-double-under-curve-area>

=== 质量与质心

如果你把区域 $cal(R)$ 想象成一块某种物质（混凝土、木头、水等等），
那么你也可以想象它在区域中每一点都有一个_密度_
（比如说，以千克每平方米为单位）。
在 18.02 中我们通常用 $rho$ 表示密度，
它是一个函数，把区域 $cal(R)$ 中的每个点 $P$ 映到它的密度。

在这种情况下，$cal(R)$ 的总质量就是密度函数的积分：
$ op("质量")(cal(R)) = integral.double_(cal(R)) rho(x,y) dif x dif y. $
给定一个区域，你还可以考虑它的_质心_。
其想法/定义是：质心的 $x$ 坐标应该是
区域中各点 $x$ 坐标的加权平均，
通常记作 $dash(x)$：
$ dash(x) := "质心的 " x " 坐标" = 1/(op("质量")(cal(R))) integral.double_(cal(R)) x dot rho(x,y) dif x dif y. $
其他坐标同理。
我们把它用方法的形式重述一遍。#footnote[
  我费了相当大的自制力，才没把这个方法命名为 “Mass Tech”。
]

#recipe(title: [求总质量与质心的方法])[
  设 $cal(R)$ 是一个区域，$rho$ 是该区域的密度函数。

  1. 总质量由下式给出：$op("质量")(cal(R)) = integral.double_(cal(R)) rho(x,y) dif x dif y. $
  2. 质心是由下式定义的点 $(dash(x), dash(y))$
  $ (dash(x), dash(y)) := lr(( (integral.double_(cal(R)) x dot rho(x,y) dif x dif y) / (op("质量")(cal(R))),
    (integral.double_(cal(R)) y dot rho(x,y) dif x dif y) / (op("质量")(cal(R))))). $
]

#typesig[
  如果 $cal(R)$ 是 $RR^2$ 中的一个区域，
  - 那么密度函数 $rho : cal(R) -> RR_(>= 0)$
    应当取非负值。
    （对物理学家：在国际单位制中，你可以把它想象成千克每平方米。）
  - 质量是一个非负实数（千克）。
  - 质心也是 $cal(R)$ 内部的一个_点_。（把它画成点，而不是箭头。）
]

#sample[
  计算以 $(5,5)$、$(5,9)$、$(9,9)$ 和 $(9,5)$ 为顶点的正方形的质心，
  假设密度为常数 $rho = 1$。
]
#soln[
  当然，由对称性我们预期答案是 $#boxed[$ (7,7) $]$。
  我们完整地看一下。
  $cal(R)$ 的质量由下式给出
  $ op("质量")(cal(R)) = integral.double_(cal(R)) 1 dif x dif y = integral_(x=5)^9 integral_(y=5)^9 1 dif y dif x
    = (9 - 5) dot (9 - 5) = 16 . $
  质心的 $x$ 坐标是
  $ dash(x) &= 1 / (op("质量")(cal(R))) integral.double_(cal(R)) x dot 1 dif x dif y
    = 1 / 16 integral_(x=5)^9 integral_(y=5)^9 x dif y dif x \
    &= 1 / 16 integral_(y=5)^9 [x dot (9 - 5)] dif x = 1 / 16 dot 4 integral_(x=5)^9 x dif x = 1 / 4 [x^2 / 2]_(x=5)^9
    = 1 / 4 (81 / 2 - 25 / 2) = 7. $
  $dash(y)$ 的计算完全相同，我们如愿得到 $(7,7)$。
]

#remark[
  不出所料，如果 $rho = 1$ 是常数（想象每平方米 1 千克），
  那么区域 $cal(R)$ 的质量就是 $integral.double_(cal(R)) dif x dif y$，即面积。
  （所以一个面积为 $16$ 平方米、且整块物质的密度都是
  每平方米 1 千克的区域，质量应当是 $16$ 千克。）
]

#sample[
  计算以 $(5,5)$、$(5,9)$、$(9,9)$ 和 $(9,5)$ 为顶点的正方形的质心，
  假设密度函数为 $rho(x,y) = x+y$。
]
#soln[
  先计算质量：
  $ op("质量")(cal(R)) &= integral.double_(cal(R)) (x + y) dif x dif y = integral_(x=5)^9 integral_(y=5)^9 (x + y) dif y dif x \
   &= integral_(x=5)^9 [x y + y^2 / 2]_(y=5)^9 dif x
   = integral_(x=5)^9 (x (9 - 5) + 81 / 2 - 25 / 2) dif x
   = integral_(x=5)^9 (4 x + 28) dif x \
   &= 4 [x^2 / 2]_(x=5)^9 + 28 [x]_(x=5)^9 = 2 (81 - 25) + 28 dot 4 = 224. $
  然后质心的 $x$ 坐标是
  $ dash(x) &= 1 / (op("质量")(cal(R))) integral.double_(cal(R)) x (x + y) dif x dif y
    = 1 / 224 integral_(x=5)^9 integral_(y=5)^9 (x^2 + x y) dif y dif x \
    &= 1 / 224 integral_(x=5)^9 [x^2 y + (x y^2) / (2)]_(y=5)^9 dif x
    = 1 / 224 integral_(x=5)^9 (x^2 (9 - 5) + frac(x (81 - 25), 2)) dif x \
    &= 1 / 224 integral_(x=5)^9 (4 x^2 + 28 x) dif x
    = 1 / 224 [(4 x^3) / (3) + 14 x^2]_(x=5)^9 \
    &= 1 / 224 (frac(4 (729) - 4 (125), 3) + 14 (81 - 25)) = 149 / 21. $
  而 $dash(y) = 149/21$，计算方式完全相同。
  因此答案是 $#boxed[$ (149/21, 149/21) approx (7.095, 7.095) $]$。

  （这通过了合理性检查：我们的新正方形在 $(9,9)$ 附近比在 $(5,5)$ 附近密度略大。
  所以我们预期质心会朝那个方向略微移动。
  我们仍然有关于直线 $y=x$ 的对称性。）
]



== [SIDENOTE] 与 18.01 的“曲线下方的面积”有什么类比？

在 18.01 中，你被告知积分 $integral_(x=a)^b f(x) dif x$
表示从 $x = a$ 到 $x = b$ 之间曲线 $y = f(x)$ 下方的面积。

在 18.02 中，如果你有 $integral.double_(cal(R)) f(x,y) dif x dif y$，
并且想类似地解释它，
你会去在 $x y z$ 空间里看曲面 $z = f(x,y)$，
在那里你想象 $x y$ 平面和区域 $cal(R)$ 在底部，而 $z$ 是高度。
那么二重积分类似地计算该曲面下方的体积。

不过，在 18.02 中我们其实不会太多地使用这种解释。
正如我之前所说，在 18.02 中我们通常更愿意画那种
所有坐标轴变量都受到同等对待的图。
（而我刚刚提到的 18.01 那种图把 $x$ 当作输入、$y$ 当作输出；
两根轴扮演的角色并不相同。）
所以用质量或质心之类的东西来想象二重积分，
更符合 18.02 的精神，尽管它没有 18.01 的对应物。

== [RECIPE] 交换积分次序

如果你是教多元微积分的老师，出考题的一个套路是：
取某个既能水平切分又能竖直切分的区域 $cal(R)$，
但其中一种切分方式比另一种容易积分得多。
在题面中，你把积分按“坏”的次序写给学生。
解法是把它_反过来_转化回一个区域 $cal(R)$，
再用这个区域恢复出“好”的次序。
用方法的形式写出来：
#recipe(title: [交换积分次序的方法])[
  如果你拿到的是 $integral_(x=?)^? integral_(y=?)^? f(x,y) dif y dif x$，
  而你想把积分次序反过来换成另一种：

  1. 把积分限反过来转成不等式/区域的格式，
    得到某个区域 $cal(R)$。
  2. 现在改以另一个变量作为外层变量，
    重新套用 @sec-convert-x-y-integration 中的方法。
]

#sample[
  计算二重积分：
  $ integral_(x = 0)^2 integral_(y = x/2)^(1) e^(y^2) dif y dif x . $
]

#soln[
  要计算这个积分，注意直接用 18.01 的标准方法对 $y$ 积分 $e^(y^2)$
  是行不通的。
  因此我们需要交换积分次序。

  首先把它反过来转成区域格式：
  $ cal(R) = cases(0 <= x <= 2, x/2 <= y <= 1). $
  我们看到 $y$ 的范围是 $0 <= y <= 1$。
  被积分的区域画在 @fig-double-rect-swap 中。

  #figure(
    image("figures/double-rect-swap.svg", width: auto),
    caption: [区域 $0 <= x <= 2$ 与 $x/2 <= y <= 1$。
    注意，你所积分的函数（这里是 $e^(y^2)$）与被积分的区域无关！],
  ) <fig-double-rect-swap>

  把 $x$ 用 $y$ 解出来会得到三个条件：
  除了 $0 <= x <= 2$ 之外，我们还需要 $x <= 2y$。
  由于 $y <= 1$，我们可以忽略条件 $x <= 2$，
  于是区域可以改写为
  $ cal(R) = cases(0 <= y <= 1, 0 <= x <= 2 y). $
  把它_反过来_变回二重积分，得到
  $ integral_(y=0)^1 integral_(x=0)^(2y) e^(y^2) dif x dif y. $

  内层积分是关于 $x$ 的，
  但被积函数 $e^(y^2)$ 与 $x$ 无关。
  因此内层积分变为：
  $ integral_(x = 0)^(2 y) e^(y^2) dif x = 2 y dot e^(y^2) . $
  于是剩下要计算的是
  $ integral_(y=0)^1 (2 y dot e^(y^2)) dif y. $

  现在情况不同了：$2 y dot e^(y^2)$ _确实_有合法的原函数。
  如果你用 18.01 的方法，或者哪怕只是擅长猜测，
  你都能求出这个 18.01 不定积分
  $ integral 2 y e^(y^2) dif y = e^(y^2) + C. $
  所以本题的最终答案是
  $ integral_(y=0)^1 2y e^(y^2) dif y = lr([e^(y^2)])_(y=0)^(y=1) = #boxed[$ e-1 $]. #qedhere $
]

#sample[
  令 $ k = root(5, 37/3 pi) approx 2.078. $
  计算二重积分：
  $ integral_(y = 0)^(k^2) integral_(x = sqrt(y))^k y sin (x^5) dif x dif y $
]
#soln[
  对 $sin(x^5)$ 积分是不现实的，所以我们交换积分次序并祈祷。
  被积分的区域是
  $ cal(R) = cases(0 <= y <= k^2, sqrt(y) <= x <= k). $
  $x$ 的取值从 $0$ 一直到 $k$。
  我们在 @fig-double-rect-swap2 中画出该区域。

  #figure(
    image("figures/double-rect-swap2.svg", width: auto),
    caption: [区域 $0 <= y <= k^2$ 与 $sqrt(y) <= x <= k$。],
  ) <fig-double-rect-swap2>

  解出 $y$，我们看到有三个约束，
  $0 <= y$、$y <= x^2$ 和 $y <= k^2$。
  但由于 $x <= k$，条件 $y <= k^2$ 是多余的。
  区域可以简单地改写为
  $ cal(R) = cases(0 <= x <= k, 0 <= y <= x^2). $

  再转回二重积分：
  $ integral_(x = 0)^k integral_(y = 0)^(x^2) y sin (x^5) dif y dif x. $

  现在我们计算关于 $y$ 的内层积分：
  $ integral_(y = 0)^(x^2) y sin (x^5) dif y . $

  由于 $sin (x^5)$ 与 $y$ 无关，我们可以把它提出积分号：
  $ sin (x^5) integral_(y = 0)^(x^2) y dif y = sin (x^5) [y^2 / 2]_(y = 0)^(y = x^2) . $
  代入积分限：
  $ sin (x^5) dot x^4 / 2 . $

  现在把这个结果代入外层积分：
  $ integral_(x = 0)^k x^4 / 2 sin (x^5) dif x . $

  我们来做 18.01 的 $u$ 换元 $u = x^5$，
  于是 $dif u = 5 x^4 dif x$，即 $dif x = (dif u) / (5 x^4)$。
  积分限的变化如下：
  - 当 $x = 0$ 时，$u = 0$。
  - 当 $x = k$ 时，$u = 37/3 pi$。
  因此，已知 $integral sin(u) = -cos(u) + C$，该积分变为：
  $ 1 / 2 integral_(u = 0)^(37/3 pi) sin(u) / 5 dif u
    &= 1 / 10 integral_(u = 0)^(37/3 pi) sin(u) dif u \
    &= 1 / 10 (- cos (37/3 pi) + cos (0)) . $
  利用 $cos (37/3 pi) = 1 / 2$ 和 $cos (0) = 1$，得到：
  $ 1 / 10 (- 1 / 2 + 1) = 1 / 10 dot 1 / 2 = #boxed[$ 1/20 $]. #qedhere $
]

== [EXER] 习题

#exer[
  设 $cal(R)$ 是曲线 $y = sqrt(x)$ 与 $y = x^3$ 之间的区域。
  用水平切分和竖直切分两种方式计算 $integral.double_(cal(R)) x^(100) y^(200) dif x dif y$。
] <exer-slicing-standard>

#exer[
  设 $cal(R)$ 是曲线 $y = sqrt(x)$ 与 $y = x^2$ 之间的区域。
  假设 $cal(R)$ 有恒定密度。
  计算它的质心。
] <exer-slicing-mass>

#exer[
  计算二重积分：
  $ integral_(y=0)^1 integral_(x=y)^(root(5, y)) (x y^2) / (1-x^(12)) dif x dif y. $
] <exer-swapint-fifth>

#exerstar[
  证明 $ integral_(x=0)^(999^5) root(3, root(5,x) + 1) dif x $ 是一个有理数。
] <exer-rat-slice>
