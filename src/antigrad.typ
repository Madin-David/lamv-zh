#import "@local/evan-zh:1.0.0":*

= 反梯度 <ch-antigrad>

本章其实通常要到 18.02 的后面、也就是 India 部才会讲到。
不过，我打算把它插在这里，
趁你的大脑还没有被积分占据的时候，因为它是一个独立的问题。
不过，如果你更想严格地按 18.02 的顺序来，
你可以先跳过这一章，等一两个月后
真正需要知道怎么做时再回来。

本章的目标是把 $nabla$ 反过来做：
#goal[
  如果你知道 $nabla f$，你能反推回去求出 $f$ 吗？
]

== [TEXT] 到处都是 $+C$

我先说明一下，你仍然要面对 18.01 中的那个 $+C$。
详细地说，你可能还记得在 18.01 中
$integral x^2 dif x = x^3/3 + C$ 对任意常数 $C$ 成立，
而我们通常就直接忽略这个 $+C$，因为它不起任何作用。

在 18.02 中我们也做同样的事。
例如，如果 $f_1(x,y) = x^2+y^2$ 而 $f_2(x,y) = x^2+y^2+17$，那么它们有相同的梯度：
$ nabla f_1 = nabla f_2 = vec(2x, 2y). $
不过，我们只是约定不管这个常数；
如果题目要求找一个势函数，而 $f$ 是任意一个可接受的答案，那么 $f + 100$ 也是。
但除了 $f+C$（$C$ 取不同值）之外，不会有别的答案。

== [TEXT] 猜也猜得挺好

有时你也许直接就能猜出 $f$，如果是这样，那很好。
看看你能不能猜出下面这些题的答案：

$ nabla f &= vec(x,y) \
  nabla f &= vec(y e^(x y), x e^(x y)) \
  nabla f &= vec(y z, z x, x y). $

== [TEXT] 反导数法，前提是题目保证存在 <sec-antideriv>

#recipe(title: [方法：如何求二元函数的反梯度])[
  1. 用 $f$ 表示那个梯度函数。
  2. 把给定的 $(partial f) / (partial x)$ 对 $x$ 积分，得到形如
    $f(x,y) = "expression"  + C_1(y)$ 的式子，其中 $C_1(y)$ 是某个函数。
  3. 把给定的 $(partial f) / (partial y)$ 对 $y$ 积分，得到形如
    $f(x,y) = "expression"  + C_2(x)$ 的式子，其中 $C_2(x)$ 是某个函数。
  4. 把它们拼接起来，输出一个函数 $f$。
]

对于三个变量，情况类似，但工作量更大。

#recipe(title: [方法：如何求三元函数的反梯度])[
  1. 用 $f$ 表示那个梯度函数。
  2. 把给定的 $(partial f) / (partial x)$ 对 $x$ 积分，得到形如
    $f(x,y,z) = "expression"  + C_1(y,z)$ 的式子，其中 $C_1(y,z)$ 是某个函数。
  3. 把给定的 $(partial f) / (partial y)$ 对 $y$ 积分，得到形如
    $f(x,y,z) = "expression"  + C_2(x,z)$ 的式子，其中 $C_2(x,z)$ 是某个函数。
  4. 把给定的 $(partial f) / (partial z)$ 对 $z$ 积分，得到形如
    $f(x,y,z) = "expression"  + C_3(x,y)$ 的式子，其中 $C_3(x,y)$ 是某个函数。
  5. 把所有东西拼接起来，输出 $f$。
]

我们先做一个二元变量的例子。
#sample[
  已知某函数 $f (x , y)$ 的梯度：
  $ nabla f (x , y) = vec(x + cos y , - x sin y) $
  求 $f$。
]
#soln[
  这意味着：
  $ (partial f) / (partial x) = x + cos y quad upright("and") quad (partial f) / (partial y) = - x sin y. $

  把 $(partial f) / (partial x)$ 和 $(partial f) / (partial y)$ 分别对 $x$ 和 $y$ 积分：
  $ f (x , y) & = integral (partial f) / (partial x) dif x = integral x + cos y dif x  = x^2/2 + x cos y + C_1 (y). \
    f (x , y) & = integral (partial f) / (partial y) dif y = integral - x sin y dif y  = x cos y + C_2(x). $
  把它们拼接起来，得到 $f (x , y)$ 的最终表达式：
  $ f (x , y) = #boxed($ x^2/2 + x cos y + C $) $
  其中 $C$ 是任意常数。
]


#sample[
  已知某函数 $f (x , y)$ 的梯度：
  $ nabla f (x , y) = vec(3x^2 + 4 x y + y^2, 2x^2 + 2 x y - 3y^2) $
  求 $f$。
]
#soln[
  这意味着：
  $ (partial f) / (partial x) = 3 x^2 + 4 x y + y^2 quad upright("and") quad (partial f) / (partial y) = 2 x^2 + 2 x y - 3 y^2. $

  把 $(partial f) / (partial x)$ 和 $(partial f) / (partial y)$ 分别对 $x$ 和 $y$ 积分：
  $ f (x , y) & = integral (partial f) / (partial x) dif x = integral (3 x^2 + 4 x y + y^2) dif x  = x^3 + 2 x^2 y + x y^2 + C_1(y) \
    f (x , y) & = integral (partial f) / (partial y) dif y = integral (2 x^2 + 2 x y - 3 y^2) dif y = 2 x^2 y + x y^2 - y^3 + C_2(x). $
  把它们拼接起来得到
  $ f (x , y) = #boxed($ x^3 + 2 x^2 y + x y^2 - y^3 + C $). #qedhere $
]

下面是一个三变量的版本。
#sample[
  已知某函数 $f(x,y,z)$ 的梯度：
  $ nabla f(x,y,z) = vec(y^2-sin(x), 2 x y + 4 y z, e^z+2y^2). $
  求 $f$。
]
#soln[
  同样，对三个分量分别积分：
  $ f (x , y , z) & = integral (y^2 - sin x) dif x = y^2 x + cos x + C_1 (y , z) \
    f (x , y , z) & = integral (2 x y + 4 y z) dif y = x y^2 + 2 z y^2 + C_2(x, z) \
    f (x , y , z) & = integral (e^z + 2 y^2) dif y = e^z + 2 y^2 z + C_3(x, y). $
  这里 $C_1(y,z)$ 又是只依赖于 $y$ 和 $z$ 的某个函数；
  $C_2$ 和 $C_3$ 类似。
  现在把所有东西拼接起来：
  $ f (x , y , z) = #boxed($ y^2 x + cos x + 2 y^2 z + e^z + C $). #qedhere $
]

== [TEXT] 实际上大多数时候势函数 $f$ 并不存在

到目前为止，这也许感觉像是把 18.01 的积分加强到多个变量。
但有些事情其实不同。
到目前为止，我挑选的梯度都是有答案的。

但大多数时候并非如此：
*18.02 中不同的地方在于，
对于随意写出来的题目，这个任务_真的_不可能完成*。
这确实是一个重大的区别。

#digression(title: [题外话：“答案不好写”与“这样的函数不存在”
  之间有天壤之别])[
  18.01 中不也有不可能积分的题吗？
  嗯，这取决于你说的“不可能”是什么意思。
  例如，18.01 中你不会见到的一道题是
  $ integral cos(x^2) dif x $
  它可以翻译成“求一个函数 $f$ 使得 $f'(x) = cos(x^2)$”。
  18.01 中不问你这道题的原因是，
  虽然这样的函数 $f$ _确实存在_，但它无法用
  对 18.01 学生有意义的方式表达出来。

  但我的意思是，你总可以作弊写成
  $ f(t) = integral_0^t cos(x^2) dif x. $
  右端对每个 $t$ 确实都求出一个数，
  例如如果你做数值分析，$f(1) approx 0.904524$，$f(2) approx 0.461461$，等等。
  所以确实存在某个函数 $f$ 其导数是 $cos(x^2)$。
  只是它没有好的写法。
  这意味着，如果你试图用 18.01 的方法解这道题，
  你最终只会用尽所有可用的方法和想法。

  在 18.02 的版本中，我们即将看到，即使是类似的简单题目
  答案也可能是“这样的函数不存在”。
  所以当你试图解一道不可能的反梯度题时，
  会发生一些真正不同的事：
  你不是用尽方法和想法，
  而是可以按通常的方法做下去，然后_得到一个矛盾_。
]

#question[
  判断是否存在可微函数 $f(x,y)$ 使得
  $ nabla f = vec(2 y, x). $
]
#soln[
  我们可以想象按之前相同的方法做下去。
  积分给出
  $ f(x,y) &= integral 2 y dif x = 2 x y + C_1(y) \
    f(x,y) &= integral x dif y = x y + C_2(x). $
  要使它们相等，我们需要 $2 x y + C_1(y) = x y + C_2(x)$，
  即 $x y + C_1(y) = C_2(x)$，这是不可能的！
  到底发生了什么？

  （人们很容易写成 $C_1(y) = C$ 和 $C_2(x) = x y + C$，但那是类型错误。
  这些新函数 $C_1$ 和 $C_2$ 只能依赖于它们各自的参数。
  确实，仔细看看我们之前写的所有 $C_i$：
  例如，每当我们写 $C_1(y)$ 或 $C_1(y,z)$ 时，我们从不允许它依赖于 $x$。）

  数学中有一个概念叫_反证法_：
  如果你从一个假设出发，
  然后做一些逻辑推理，得到一个不可能的结论，
  那么起始的假设就是错的。
  这里，起始的假设是：存在_某个_函数 $f$ 使得 $nabla f = vec(2y, x)$。
  从这个假设出发，我们发现存在函数
  $C_1(y)$ 和 $C_2(x)$ 使得 $C_2(x) - C_1(y) = x y$ 对所有实数 $x$ 和 $y$ 成立。
  所以我们的假设是错的：不可能有这样的函数 $f$。
  不像 18.01 中“$f$ 存在但很难写下来”；
  这个函数 $f$ 根本就不可能存在。
]

== [TEXT] 排除不可能题目的捷径

好，我猜你现在都在想：“我怎么判断一道题是不是不可能的？”

嗯，一个策略就是*把上面给你看的方法跑一遍，看它是否行得通*。

- 如果你找到了一个可行的函数 $f$，很好。
- 如果你遇到了矛盾，那好，现在你就知道它是不可能的。

但那样做工作量太大。我们想要一个捷径，而确实有一个。

想法是：对于（偏导数连续的）函数，
_偏导数_是可以交换的。
也就是说，若 $f(x,y)$ 是二元函数，那么下面成立：
#memo(title: [记住：偏导数可交换])[
  如果 $f_x$ 和 $f_y$ 都连续可微，那么
  $ f_(x y) = f_(y x). $
]
如果你更喜欢 $partial$ 记号，这也可以写成
$ (partial)/(partial y) (partial f) / (partial x)
  = (partial)/(partial x) (partial f) / (partial y). $
换言之，如果你先对 $x$ 求导、再对 $y$ 求导，
得到的结果与先 $y$ 后 $x$ 相同。
有时人们把它写成
$ (partial^2 f)/(partial x partial y) = (partial^2 f) / (partial y partial x). $

这个结果至少有点令人惊讶，
我其实不指望你没看例子就相信我。
所以让我们看几个例子：
#example(title: [说明求导顺序无关的例子])[
  设 $f(x,y) = x^7 y^3$。
  - 如果我们先对 $x$ 求导再对 $y$ 求导，得到
    $f_x = 7 x^6 y^3 ==>
      (partial / (partial y)) f_x = 21 x^6 y^2$.
  - 换另一种顺序：
    $f_y = 3 x^7 y^2 ==>
      (partial / (partial x)) f_y = 21 x^6 y^2$.
  - 两种方式我们都得到相同的结果
    $ f_(x y) = f_(y x) = 21 x^6 y^2. $
]
#example(title: [另一个说明求导顺序无关的例子])[
  设 $f(x,y) = cos(x+y) y^8$。
  - 对 $f$ 先关于 $x$ 求导再关于 $y$ 求导：
    $ f_x = - sin (x + y) y^8
    ==>
      (partial) / (partial y) f_x & = (partial) / (partial y) (- sin (x + y) y^8)\
      & = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
  - 换另一种顺序：
    对 $f$ 先关于 $y$ 求导再关于 $x$ 求导：
    $ f_y = (- sin (x + y) y^8 + 8 y^7 cos (x + y))
      ==> (partial) / (partial x) f_y &= (partial) / (partial x) (- sin (x + y) y^8 + 8 y^7 cos (x + y))\
       & = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
  - 两种方式，我们都得到相同的结果：
    $ f_(x y) = f_(y x) = - cos (x + y) y^8 - 8 y^7 sin (x + y) $
]

好，那么我们之前给的那个例子呢？
#question[
  判断是否存在可微函数 $f(x,y)$ 使得
  $ nabla f = vec(2 y, x). $
]

嗯，如果存在这样的 $f$，而我们得到了不匹配的结果，那么
$ f_(x y) = partial / (partial y) f_x = partial / (partial y) (2 y) = 2 \
  f_(y x) = partial / (partial x) f_y = partial / (partial x) x = 1. $
所以由反证法，不存在这样的 $f$。

== [RECIPE] 排除反梯度不存在 <sec-when-antigrad>

事实证明，我描述的这个检验对 18.02 来说已经足够——
它能抓住所有不可能的题目。
具体来说，下面的定理成立。

#memo(title: [记住：二维反梯度存在的判别准则])[
  考虑定义在整个 $RR^2$ 上的两个函数 $vec(p(x,y), q(x,y))$，
  其中 $p$ 和 $q$ 连续可微。
  那么存在 $f$ 使得 $ nabla f = vec(p(x,y), q(x,y)) $
  当且仅当
  $ (partial p) / (partial y) = (partial q) / (partial x). $
]
你应该把它想成 $f_(x y) = f_(y x)$。
我们后面在 India 部还会再见到它，不过是用不同的话说：
“$f$ 的二维标量旋度为零”。

三维版本要检验所有可能的配对：
#memo(title: [记住：三维反梯度存在的判别准则])[
  考虑定义在整个 $RR^3$ 上的三个函数 $vec(p(x,y,z), q(x,y,z), r(x,y,z))$，
  其中 $p$、$q$、$r$ 连续可微。
  那么存在 $f$ 使得 $ nabla f = vec(p(x,y,z), q(x,y,z), r(x,y,z)) $
  当且仅当下面三个方程都成立：
  $ (partial p) / (partial y) = (partial q) / (partial x), quad
    (partial p) / (partial z) = (partial r) / (partial x), quad
    (partial q) / (partial z) = (partial r) / (partial y). $
]
上面三个方程应当记作
$f_(x y) = f_(y x)$、$f_(y z) = f_(z y)$、$f_(z y) = f_(x y)$。
这一点我们在 India 部还会再见一次，隐藏在另一个名字之下：
“$f$ 的三维标量旋度为零”。
在那部分中，给定的右端会被称作*向量场*，
而函数 $f$ 会被称作它的*势函数*。
但现在先别管这些名字。

== [EXER] 习题

#exer[
  设 $f (x , y)$ 是可微函数，且
  $ nabla f (x , y) = vec(x^2 + a x y + 2 y^2 + y + 1, x^2 + x + b x y + y^2 + 2) $
  其中 $a$ 和 $b$ 是某些常数。
  计算常数 $a$ 和 $b$，并确定 $f$。
] <exer-antigrad-quad>
