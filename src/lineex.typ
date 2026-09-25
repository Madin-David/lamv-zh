#import "@local/evan-zh:1.0.0":*

= 功与 2D 通量的例题实在太多 <ch-lineex>

本章完全*只是复习与例题*，如果你已经掌握，*可以跳过*。

本章的目标是把 @tab-work-vs-flux 的几个例子完整写出来。
我们将展示整张表在四种情形下的结果：

- 保守场 $bf(F) = vec(2x+y, x+2y)$
  在逆时针定向的单位圆上（一条闭曲线）。
- 保守场 $bf(F) = vec(2x+y, x+2y)$
  在从 $(1,4)$ 到 $(3,9)$ 的线段上。
- 非保守场 $bf(F) = vec(x^2+3y,5y)$
  在逆时针定向的单位圆上（一条闭曲线）。
- 非保守场 $bf(F) = vec(x^2+3y,5y)$
  在从 $(1,4)$ 到 $(3,9)$ 的线段上。

== 当 $bf(F) = vec(2x+y, x+2y)$、$cal(C)$ 为单位圆时的例子

#sample[
  设 $bf(F) = vec(2x+y, x+2y)$，
  并令 $cal(C)$ 为逆时针定向的单位圆。
  计算 $integral bf(F) dot dif bf(r)$ 与 $integral bf(F) dot bf(n) dif s$。
]

我们使用参数化
$ bf(r)(t) = vec(cos(t), sin(t)) quad 0 <= t <= 2pi $
于是
$ bf(r)'(t) = vec(-sin(t), cos(t)) quad 0 <= t <= 2pi. $

在这种情况下五种方法全都适用，见下表。

#figure(
  table(
    columns: 3,
    align: left,
    table.header([方法],
      [功 $integral_(cal(C)) bf(F) dot dif bf(r)$\ （见 @sec-recipe-work）],
      [2D 通量 $integral_(cal(C)) bf(F) dot bf(n) dif s$ \ （见 @sec-recipe-2d-flux）]),
    [$bf(F)$ 是保守场 \ $==>$ FTC],
      [$f(1,0)-f(1,0)=0$], [_不适用_],
    [$cal(C)$ 是闭曲线 \ $==>$ 格林定理],
      [$integral.double_(cal(R)) underbrace(1-1, "2D scalar curl") dif A = 0$],
      [结果 $integral.double_(cal(R)) underbrace(2+2, "Div" = nabla dot bf(F)) dif A = 4pi$],
    [直接计算的定义 \ 使用参数化],
      [$integral_(t=0)^(2pi) vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$integral_(t=0)^(2pi) vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t), ) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [对于保守场 $bf(F) = vec(2x+y, x+2y)$，
    其势函数为 $f(x,y) = x^2 + x y + y^2$，沿单位圆。],
  kind: table
)

=== 用 FTC 求功

这个线积分平凡地等于零：
我们甚至不必计算势函数，
因为 FTC（微积分基本定理）意味着我们会得到 $f(1,0) - f(1,0) = #boxed[$ 0 $]$。
事实上势函数是 $f(x,y) = x^2 + x y + y^2$，
但在下一个例子之前我们不会用到它。

=== 用格林定理求功

如果你没看出这个向量场是保守的，
并且使用了格林定理，
那么 2D 标量旋度得到 $0$ 也就不足为奇了：
$ integral.double_(cal(R)) underbrace(1-1, "2D scalar curl") dif A = integral.double_(cal(R)) 0 dif A = #boxed[$ 0 $]. $
保守函数的旋度为零。
所以实际上，即使你一开始没有注意到这个场是保守的，
当你试图应用格林定理时也会得到一个相当不客气的提醒——
你会发现自己不过是在积分 $0$ 函数。

=== 直接计算：功

对于功积分，计算如下：
$ bf(F)(cos t, sin t) dot bf(r)'(t) &= vec(2cos(t)+sin(t), cos(t)+2sin(t)) dot vec(-sin(t), cos(t)) \
  &= (2 cos t + sin t) (- sin t) + (cos t + 2 sin t) (cos t) \
  &= - 2 cos t sin t - sin^2 t + cos^2 t + 2 cos t sin t \
  &= cos^2 t - sin^2 t = cos(2t). $
于是积分变为：
$ integral_0^(2 pi) cos (2 t) dif t = #boxed[$ 0 $] $
因为这是对余弦函数两个完整周期的积分，故为 $0$。
（或者写成 $[(sin 2 t) / (2)]_(t=0)^(2 pi) = (sin 4 pi) / (2) - (sin 0) / (2) = 0 - 0 = 0$。）

=== 用格林定理求通量

对于通量，我们反正得不到微积分基本定理，
但散度处处为 $2+2=4$，是一个常数，
所以通量算出为 $4op("面积")(cal(R))$，也就是 $#boxed[$ 4 pi $]$。

=== 直接计算：通量
对于通量积分，把向量场的向量旋转
（也就是考虑 $-q dif x + p dif y$）以得到点积
$ vec(-(cos(t)+2sin(t)), 2cos(t)+sin(t)) dot vec(-sin(t), cos(t))
  &= (2 cos t + sin t) cos t + (cos t + 2 sin t) sin t \
  &= 2 cos^2 t + sin t cos t + cos t sin t + 2 sin^2 t \
  &= 2 (cos^2 t + sin^2 t) + 2 sin t cos t \
  &= 2 (1) + sin 2 t = 2 + sin 2 t . $
因此，
$ integral_(t=0)^(2 pi) (2 + sin 2 t) dif t  = 4 pi + integral_(t=0)^(2 pi) sin 2 t dif t = #boxed[$ 4 pi $]. $
因为 $integral_(t=0)^(2 pi) sin 2 t$ 是对正弦函数两个完整周期的积分。

== 当 $bf(F) = vec(2x+y, x+2y)$、$cal(C)$ 为线段时的例子

#sample[
  设 $bf(F) = vec(2x+y, x+2y)$，
  并令 $cal(C)$ 为从 $(1,4)$ 到 $(3,9)$ 的路径。
  计算 $integral bf(F) dot dif bf(r)$ 与 $integral bf(F) dot bf(n) dif s$。
]

我们使用同一个向量场，但这次把线段参数化
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
于是
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 1. $

这次我们的表长这样：

#figure(
  table(
    columns: 3,
    align: left,
    table.header([方法],
      [功 $integral_(cal(C)) bf(F) dot dif bf(r)$\ （见 @sec-recipe-work）],
      [2D 通量 $integral_(cal(C)) bf(F) dot bf(n) dif s$ \ （见 @sec-recipe-2d-flux）]),
    [$bf(F)$ 是保守场 \ $==>$ FTC],
      [$f(3,9)-f(1,4) = 117 - 21 = 96$], [_不适用_],
    [$cal(C)$ 是闭曲线 \ $==>$ 格林定理],
      [_此处无法使用_],
      [_此处无法使用_],
    [直接计算的定义 \ 使用参数化],
      [$integral_(t=0)^(1) vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) dot vec(2,5) dif t$],
      [$integral_(t=0)^(1) vec(-((1+2t)+2(4+5t)), 2(1+2t)+(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [对于保守场 $bf(F) = vec(2x+y, x+2y)$，
    其势函数为 $f(x,y) = x^2 + x y + y^2$，
    但这次是在从 $(1,4)$ 到 $(3,9)$ 的线段上。],
  kind: table
)

一如既往，直接计算法最费力，
但对于通量积分我们其实别无选择，因为其他方法都不可能。

=== 用 FTC

这次我们真的会用到势函数
$ f(x,y) = x^2 + x y + y^2 $
（其实是对任意常数 $C$ 的 $f(x,y) = x^2 + x y + y^2 + C$）。
于是我们可以把整个线积分短路掉，只需计算
$ f(3,9)-f(1,4) = 117 - 21 = #boxed[$ 96 $]. $

=== 直接计算：功

对于功积分，先展开
$ bf(F) (1+2t,4+5t) = vec(2(1+2t)+(4+5t), (1+2t)+2(4+5t)) = vec(2 + 4 t + 4 + 5 t , 1 + 2 t + 8 + 10 t) = vec(6 + 9 t, 9 + 12 t). $
由此点积为
$ bf(F) (1+2t,4+5t) dot bf(r)'(t) = vec(6 + 9 t, 9 + 12 t) dot vec(2, 5) = 2(6 + 9 t) + 5(9 + 12 t) = 57 + 78 t. $
对它积分得到
$ integral_(t=0)^1 (57 + 78 t) dif t = [57 t + 39 t^2]_0^1 = 57 (1) + 39 (1)^2 - 0 = 57 + 39 = #boxed[$ 96 $]. $

=== 直接计算：通量

对于通量积分，改为把向量场的向量旋转
（也就是考虑 $-q dif x + p dif y$）以得到点积
$ vec(-(9 + 12 t), 6 + 9 t) dot vec(2, 5) = -2(9 + 12t) + 5(6+ 9t) = 12 + 21 t $
对它积分得到
$ integral_(t=0)^1 (12 + 21 t) dif t = [12 t + 21/2 t^2]_(t=0)^1 = #boxed[$ 45/2 $]. $

== 当 $bf(F) = vec(x^2+3y,5y)$、$cal(C)$ 为单位圆时的例子

#sample[
  设 $bf(F) = vec(x^2+3y, 5y)$，
  并令 $cal(C)$ 为逆时针定向的单位圆。
  计算 $integral bf(F) dot dif bf(r)$ 与 $integral bf(F) dot bf(n) dif s$。
]

这里格林定理可以直接用，因为 $cal(C)$ 是闭曲线。
你也可以做参数化，虽然很恶心，但确实可行。

#figure(
  table(
    columns: 3,
    align: left,
    table.header([方法],
      [功 $integral_(cal(C)) bf(F) dot dif bf(r)$\ （见 @sec-recipe-work）],
      [2D 通量 $integral_(cal(C)) bf(F) dot bf(n) dif s$ \ （见 @sec-recipe-2d-flux）]),
    [$bf(F)$ 是保守场 \ $==>$ FTC],
      [_此处无法使用_], [_不适用_],
    [$cal(C)$ 是闭曲线 \ $==>$ 格林定理],
      [$integral.double_(cal(R)) underbrace(0-3, "2D scalar curl") dif A = -3pi$],
      [结果 $integral.double_(cal(R)) underbrace(2x+5, "Div" = nabla dot bf(F)) dif A = 5pi$],
    [直接计算的定义 \ 使用参数化],
      [$integral_(t=0)^(2pi) vec(cos(t)^2+3sin(t), 5sin(t)) dot vec(-sin(t), cos(t)) dif t$],
      [$integral_(t=0)^(2pi) vec(-5sin(t), cos(t)^2+3sin(t)) dot vec(-sin(t), cos(t)) dif t$],
  ),
  caption: [对于非保守场 $bf(F) = vec(x^2+3y, 5y)$，
    沿单位圆的积分。],
  kind: table
)

=== 用格林定理求功

对于功的版本，我们计算
$ (partial q) / (partial x) &= (partial) / (partial x) (5 y) = 0 \
  (partial p) / (partial y) &= (partial) / (partial y) (x^2 + 3 y) = 3 . $
所以答案是 $integral.double_(cal(R)) (0-3) dif A = #boxed[$ -3 pi $]$。

=== 直接计算：功

我们需要计算
$ integral_(t=0)^(2pi) vec(cos(t)^2+3sin(t), 5sin(t)) dot vec(-sin(t), cos(t)) dif t. $

展开点积得到
$ integral_(t=0)^(2 pi) (-cos^2 t sin t - 3 sin^2 t + 5 sin t cos t) dif t . $
分别计算每个积分：
1. $integral_(t=0)^(2 pi) cos^2 t sin t dif t$：
  设 $u = cos t$，则 $dif u = - sin t dif t$。
  $ integral cos^2 t sin t dif t = - integral u^2 dif u = - u^3 / 3 + C = - (cos^3 t) / (3) + C . $
  从 $0$ 到 $2 pi$ 求值：
  $ [- (cos^3 t) / (3)]_(t=0)^(2 pi) = - frac(cos^3 (2 pi), 3) + (cos^3 0) / (3) = - 1 / 3 + 1 / 3 = 0 . $
2. $integral_(t=0)^(2 pi) sin^2 t dif t$：
  使用恒等式 $sin^2 t = (1 - cos 2 t) / (2)$：
  $ integral_(t=0)^(2 pi) sin^2 t dif t = 1 / 2 integral_(t=0)^(2 pi) (1 - cos 2 t) dif t = 1 / 2 [t - (sin 2 t) / (2)]_(t=0)^(2 pi) = 1 / 2 (2 pi - 0) = pi . $
3. $integral_(t=0)^(2 pi) sin t cos t dif t$：
使用恒等式 $sin t cos t = (sin 2 t) / (2)$：
$ integral_(t=0)^(2 pi) sin t cos t dif t = 1 / 2 integral_(t=0)^(2 pi) sin 2 t dif t = 0 . $
（因为正弦在其完整周期上的积分为零。）
合并结果得到
$ - 0 - 3 dot pi + 5 dot 0 = #boxed[$ -3 pi $]. $

=== 用格林定理求通量

对于通量的版本，则是
$ (partial p) / (partial x) &= (partial) / (partial x) (x^2 + 3 y) = 2 x \
  (partial q) / (partial y) &= (partial) / (partial y) (5 y) = 5 . $
所以通量为
$ integral.cont_(cal(C)) bf(F) dot bf(n) dif s = integral.double_(cal(R)) (2 x + 5) dif A . $
由对称性，我们有
$ integral.double_(cal(R))  x dif A = 0 $
并且我们还有
$ integral.double_(cal(R)) 5 dif A &= 5 pi $
于是得到答案 $0 + 5 pi = #boxed[$ 5 pi $]$。

#remark(title: [通量的那个用极坐标也可以])[
  如果你没注意到对称性技巧，也可以用极坐标。
  写成 $2 x + 5 = 2 r cos theta + 5$，并把通量积分设为：
  $ integral.cont_(cal(C)) bf(F) dot bf(n) dif s &= integral_(theta=0)^(2 pi) integral_(r=0)^1 (2 r cos theta + 5) r dif r dif theta \
    &= integral_(theta=0)^(2 pi) integral_(r=0)^1 (2 r^2 cos theta + 5 r) dif r dif theta \
    &= 2 integral_(theta=0)^(2 pi) cos theta integral_(r=0)^1 r^2 dif r dif theta
      + 5 integral_(theta=0)^(2 pi) integral_(r=0)^1 r dif r dif theta . $
  内层积分是 $integral_(r=0)^1 r^2 dif r = 1 / 3$ 与 $integral_(r=0)^1 r dif r = 1 / 2$，
  所以我们得到相同的答案
  $ 2 dot 1 / 3 integral_0^(2 pi) cos theta dif theta + 5 dot 1 / 2 integral_0^(2 pi) dif theta
    = 2/3 dot 0 + 5 dot 1/2 dot 2 pi = 5 pi. $
]

=== 直接计算：通量

我们需要计算
$ integral_(t=0)^(2pi) vec(-5sin(t), cos(t)^2+3sin(t)) dot vec(-sin(t), cos(t)) dif t. $

展开点积：
 $ integral_(t=0)^(2 pi) (cos^3 t + 3 sin t cos t + 5 sin^2 t) dif t . $
分别计算每个积分：
1. $integral_(t=0)^(2 pi) cos^3 t dif t$：
  使用恒等式 $cos^3 t = (3 cos t + cos 3 t) / (4)$：
  $ integral_(t=0)^(2 pi) cos^3 t dif t = 3 / 4 integral_(t=0)^(2 pi) cos t dif t + 1 / 4 integral_(t=0)^(2 pi) cos 3 t dif t = 0 + 0 = 0 . $
2. $integral_(t=0)^(2 pi) sin t cos t dif t$：
  使用恒等式 $sin t cos t = (sin 2 t) / (2)$：
  $ integral_(t=0)^(2 pi) sin t cos t dif t = 1 / 2 integral_(t=0)^(2 pi) sin 2 t dif t = 0 . $
3. $integral_(t=0)^(2 pi) sin^2 t dif t$：
  使用恒等式 $sin^2 t = (1 - cos 2 t) / (2)$：
  $ integral_(t=0)^(2 pi) sin^2 t dif t = 1 / 2 integral_(t=0)^(2 pi) (1 - cos 2 t) dif t = 1 / 2 [2 pi - 0] = pi . $
合并结果得到
$ 0 + 3 dot 0 + 5 dot pi = #boxed[$ 5 pi $]. $

== 当 $bf(F) = vec(x^2+3y,5y)$、$cal(C)$ 为线段时的例子

#sample[
  设 $bf(F) = vec(x^2+3y, 5y)$，
  并令 $cal(C)$ 为从 $(1,4)$ 到 $(3,9)$ 的路径。
  计算 $integral bf(F) dot dif bf(r)$ 与 $integral bf(F) dot bf(n) dif s$。
]

这里两种情况下我们都只能硬着头皮上 --- 我们的捷径都不适用。
和之前一样，我们使用参数化
$ bf(r)(t) = vec(1+2t, 4+5t) quad 0 <= t <= 1 $
其中
$ bf(r)'(t) = vec(2,5) quad 0 <= t <= 1. $

#figure(
  table(
    columns: 3,
    align: left,
    table.header([方法],
      [功 $integral_(cal(C)) bf(F) dot dif bf(r)$\ （见 @sec-recipe-work）],
      [2D 通量 $integral_(cal(C)) bf(F) dot bf(n) dif s$ \ （见 @sec-recipe-2d-flux）]),
    [$bf(F)$ 是保守场 \ $==>$ FTC],
      [_此处无法使用_], [_不适用_],
    [$cal(C)$ 是闭曲线 \ $==>$ 格林定理],
      [_此处无法使用_],
      [_此处无法使用_],
    [直接计算的定义 \ 使用参数化],
      [$integral_(t=0)^(1) vec((1+2t)^2+3(4+5t), 5(4+5t)) dot vec(2,5) dif t$],
      [$integral_(t=0)^(1) vec(-5(4+5t), (1+2t)^2+3(4+5t)) dot vec(2,5) dif t$],
  ),
  caption: [对于非保守场 $bf(F) = vec(x^2+3y, 5y)$，
    沿单位圆的积分。],
  kind: table
)

=== 直接计算：功

对于功积分，把 $1 + 2 t$ 与 $4 + 5 t$ 代入 $bf(F)$：
$ bf(F) (1+2t, 4+5t) = vec((1 + 2 t)^2 + 3 (4 + 5 t) , thin 5 (4 + 5 t)) = vec(4t^2 + 19t + 13, 25t+20). $
然后点积为
点积：
$ vec(4t^2 + 19t + 13, 25t+20) dot vec(2,5) = 2 (4 t^2 + 19 t + 13) + 5 (25 t + 20) = 8 t^2 + 163 t + 126. $
因此
$ integral_(cal(C)) bf(F) dot dif bf(r) = integral_(t=0)^1 (8t^2 + 163t + 126) dif t . $
逐项积分：
$ integral_(t=0)^1 126 dif t &= 126, \
  integral_(t=0)^1 163 t dif t &= [163 / 2 t^2]_(t=0)^1 = 163 / 2 (1)^2 - 163 / 2 (0)^2 = 163 / 2 , \
  integral_(t=0)^1 8 t^2 dif t &= [8 / 3 t^3]_(t=0)^1 = 8 / 3 (1)^3 - 8 / 3 (0)^3 = 8 / 3 . $
合并结果：
$ integral_(cal(C)) bf(F) dot dif bf(r) = 126 + 163/2 + 8/3 = #boxed[$ 1261/6 $]. $

=== 直接计算：通量

对于通量积分，改为计算点积
$ vec(-(25t+20), 4t^2 + 19t + 13) dot vec(2,5) = -2 (25t+20) + 5(4t^2+19t+13) = 20t^2 + 45t + 25. $
再次逐项积分：
$ integral_(t=0)^1 25 dif t &= 25, \
  integral_(t=0)^1 45 t dif t &= [45 / 2 t^2]_(t=0)^1 = 45 / 2 (1)^2 - 45 / 2 (0)^2 = 45 / 2 , \
  integral_(t=0)^1 20 t^2 dif t &= [20 / 3 t^3]_(t=0)^1 = 20 / 3 (1)^3 - 20 / 3 (0)^3 = 20 / 3 . $
合并结果：
$ integral_(cal(C)) bf(F) dot bf(n) dif s = 25 + 45 / 2 + 20 / 3
  = 150 / 6 + 135 / 6 + 40 / 6 = #boxed[$ 325/6 $]. $
