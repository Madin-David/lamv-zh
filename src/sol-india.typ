#import "@local/evan-zh:1.0.0":*

= India 部习题解答 <ch-sol-india>

== @exer-touchgrass 的解答（出门走走）

#recall-thm(<exer-touchgrass>)

这是批改完第三次期中考试后月光航行的一张照片。

#figure(
  [
    #image("media/moon1.jpg", width: 60%) \
    #image("media/moon2.jpg", width: 60%)
  ],
  caption: [第三次期中考试之后的月光航行。],
)

== @exer-poster 的解答（打印海报）

#recall-thm(<exer-poster>)

这是我房间里贴着一张剩余海报的照片。

#figure(
  image("media/room-poster.jpg", width: 60%),
  caption: [在我房间里挂海报。],
)

== @exer-gravity-div1 的解答（引力的散度）

#recall-thm(<exer-gravity-div1>)

回忆引力向量场为
$ bf(G) = lr(chevron.l
  (-G m x)/((x^2+y^2+z^2)^(3/2)),
  (-G m y)/((x^2+y^2+z^2)^(3/2)),
  (-G m z)/((x^2+y^2+z^2)^(3/2))
  chevron.r) $
为简便起见，我们令 $rho = sqrt(x^2+y^2+z^2)$，
$ bf(G) = lr(chevron.l (-G m x)/(rho^3), (-G m y)/(rho^3), (-G m z)/(rho^3) chevron.r). $
忽略常数因子 $G m$，我们先
计算第一个分量关于 $x$ 的导数，即：
$ (partial)/(partial x) x / rho^3. $
使用商法则
$ (partial) / (partial x) x/rho^3
  = frac((rho^3) (partial) / (partial x) (x) - x (partial) / (partial x) (rho^3), (rho^3)^2) . $
由于 $rho^3 = (x^2 + y^2 + z^2)^(3 \/ 2)$，链式法则给出
$ (partial) / (partial x) (rho^3) = 3 / 2 (x^2 + y^2 + z^2)^(1 \/ 2) dot 2 x = 3 x rho. $
因此，商法则给出
$ (partial) / (partial x) x/rho^3
  = (rho^3 dot 1 - x dot 3 x rho) / (rho^6) = (rho^2 - 3x^2) / rho^5. $
现在散度由下式给出
$ nabla dot bf(G) &=
  -G m ((partial) / (partial x) x/rho^3 + (partial) / (partial y) y/rho^3 + (partial) / (partial z) z/rho^3) \
  &= -G m ((rho^2 - 3x^2) / rho^5 + (rho^2 - 3y^2) / rho^5 + (rho^2 - 3z^2) / rho^5) \
  &= -G m (3rho^2 - 3(x^2+y^2+z^2)) / rho^5 \
  &= 0 $
正如所断言的那样。

== @exer-parabola-1 的解答（抛物线弧 v1）

#recall-thm(<exer-parabola-1>)

我们把 $cal(C)$ 分成两部分 $cal(C)_1$ 与 $cal(C)_2$，
分别对应抛物线与线段。
它们在 @fig-sol-india-parabola-nofill 中分别用红色与蓝色标出。

#figure(
  image("figures/sol-india-parabola-nofill.svg", width: auto),
  caption: [曲线 $cal(C)$（以及它所围成的区域）。],
) <fig-sol-india-parabola-nofill>

对 $cal(C)_1$，我们选取参数化
$ bf(r)(t) = (t, t^2-1) $（$-1 <= t <= 1$），于是
$ bf(F)(bf(r)(t)) = bf(F)(t, t^2-1) = vec(t^4, t^4)
  quad
  bf(r)'(t) = vec(1, 2t). $
于是我们得到
$ integral_(cal(C)_1) bf(F) dot dif bf(r)
  &= integral_(t=-1)^1 vec(t^4, t^4) dot vec(1, 2t) dif t \
  &= integral_(t = - 1)^1 (t^4 + t^4 dot 2 t) dif t \
  &= [t^5/5 + 1/3 t^6]_(t=-1)^1 = 2 / 5 . $

接下来，我们用 $(1 - t , 0)$（$0 <= t <= 2$）参数化 $cal(C)_2$。
于是
$ bf(F)(bf(r)(t)) = bf(F)(1-t,0) = vec((1-t)^2, 1)
  quad
  bf(r)'(t) = vec(-1, 0). $
于是
$ integral_(cal(C)_2) bf(F) dot dif bf(r)
  &= integral_(t=0)^2 vec((1-t)^2, 1) dot vec(-1, 0) dif t \
  &= integral_(t=0)^2 - (1 - t)^2 dif t \
  &= - 2 / 3 . $
把这些放在一起，我们得到
$ integral_(cal(C)) bf(F) dot dif bf(r)
  = integral_(cal(C)_1) bf(F) dot dif bf(r) + integral_(cal(C)_2) bf(F) dot dif bf(r)
  = 2 / 5 - 2 / 3 = #boxed[$ -4/15 $]. $

== @exer-work-given-angle 的解答（$45 degree$ 角下的功）

#recall-thm(<exer-work-given-angle>)

取曲线 $cal(C)$ 的任意参数化，比如从 $t=0$ 到 $1$。
我们要求的功就是
$ integral_(cal(C)) bf(F) dot dif bf(r) = integral_(t=0)^(1) bf(F)(bf(r)(t)) dot bf(r)'(t) dif t. $
这道题的关键在于，
$bf(F)(bf(r)(t))$ 的模长应为 $5$，
并与 $bf(r)'(t)$ 成 $45 degree$ 角。
因此，如果我们使用点积的_几何_定义，就得到
$ integral_(cal(C)) bf(F) dot dif bf(r) &= integral_(t=0)^(1) |bf(F)(bf(r)(t))| |bf(r)'(t)| cos(45 degree) dif t \
  &= integral_(t=0)^(1) 5 |bf(r)'(t)| cos(45 degree) dif t \
  &= 5 cos(45 degree)  integral_(t=0)^(1) |bf(r)'(t)| dif t. $
但那个积分是 $cal(C)$ 的弧长。
所以
$ integral_(cal(C)) bf(F) dot dif bf(r)
  = 5 cos(45 degree) dot 7 = 35 cos(45 degree) = #boxed[$ (35 sqrt(2)) / 2 $]. $

== @exer-consv 的解答（检验保守性）

#recall-thm(<exer-consv>)

是的，因为
$ (partial)/(partial y) sin(e^x) &= 0 \
  (partial)/(partial x) arctan(y^pi+pi^y) &= 0. $
一般来说，这道题的要点在于：形如
$bf(F)(x,y) = chevron.l "stuff only involving" x, "stuff only involving" y chevron.r$
的向量场总是保守的，因为相关的偏导数都为 $0$。

== @exer-work-boring 的解答（功的习题）

#recall-thm(<exer-work-boring>)

该向量场是保守的，因为
$ partial / (partial y) (x^2 - y) = -1 = partial / (partial x) (y^2 - x). $
所以答案是 $0$。
（如果你一开始没注意到这一点而尝试使用格林定理，
那么在旋度算出来为 $0$ 的那一刻你就该注意到了。）

== @exer-parabola-2 的解答（抛物线弧 v2）

#recall-thm(<exer-parabola-2>)

令 $P = x^2 (y + 1)$，$Q = (y + 1)^2$。
因此 $ (partial Q) / (partial x) - (partial P) / (partial y) = 0 - x^2 = -x^2. $

设 $cal(R)$ 为 $y = x^2-1$ 与 $y=0$ 之间、被 $cal(C)$ 围成的区域。
那么 $cal(R)$ 可以用不等式描述
$ -1 <= x <= 1 \ x^2-1 <= y <= 0. $
见 @fig-sol-india-parabola-fill。

#figure(
  image("figures/sol-india-parabola-fill.svg", width: auto),
  caption: [曲线 $cal(C)$ 围出一个区域 $cal(R)$。],
) <fig-sol-india-parabola-fill>

因此由格林定理，我们有
$ integral_(cal(C)) bf(F) dot dif bf(r)
  &= integral.double_(cal(R)) ((partial Q) / (partial x) - (partial P) / (partial y)) dif A \
  &= integral_(x=- 1)^1 integral_(y=x^2 - 1)^0 (- x^2) dif y dif x \
  &= integral_(x=- 1)^1 x^2 (x^2 - 1) dif x \
  &= [x^5/5 - x^3/3]_(x=-1)^1  = 2 / 5 - 2 / 3 = #boxed[$ -4/15 $]. $

== @exer-shoelace 的解答（鞋带公式）

#recall-thm(<exer-shoelace>)
格林定理指出，对围成区域 $cal(R)$ 的简单闭曲线 $cal(C)$，我们有
$ integral.double_(cal(R)) ((partial Q) / (partial x) - (partial P) / (partial y)) dif A = integral.cont_(cal(C)) (P dif x + Q dif y) . $
我们取 $cal(C)$ 为该多边形，按逆时针定向，
并取 $cal(R)$ 为它的内部。
我们将选取向量场
$ bf(F) = vec(0,x) $
使得二维标量旋度等于
$ (partial Q) / (partial x) - (partial P) / (partial y)
  = (partial) / (partial x) (x) - (partial) / (partial y) (0) = 1 . $
因此，格林定理给出：
$ op("面积")(cal(P)) = integral.cont_(cal(C)) x dif y . $

现在我们“手工”沿多边形的 $n$ 条边计算这个线积分。
由于边界 $cal(C)$ 由各条边 $P_i P_(i + 1)$ 组成，
我们对每条边求和：
$ integral.cont_(cal(C)) x dif y = sum_(i = 0)^(n-1) integral_("由" P_i "to" P_(i + 1)) x dif y . $

我们把连接 $(x_i, y_i)$ 与 $(x_(i+1), y_(i+1))$ 的线段
用恰好耗时一个单位的匀速参数化来参数化：
$ bf(r)(t) = chevron.l
  (1 - t) x_i + t x_(i + 1),
  (1 - t) y_i + t y_(i + 1)
  chevron.r quad 0 <= t <= 1. $
因此，
$ bf(F)(bf(r))(t) &= vec(0, (1 - t) x_i + t x_(i + 1)) \
  bf(r)'(t) &= vec( x_(i+1) - x_i, y_(i+1) - y_i ) $
所以我们是在积分这个点积
$ integral_("由" P_i "to" P_(i + 1)) x dif y
  &= integral_(t=0)^1 vec(0, (1 - t) x_i + t x_(i + 1))
  dot vec( x_(i+1) - x_i, y_(i+1) - y_i ) dif t \
  &= integral_(t=0)^1 ((1 - t) x_i + t x_(i + 1)) (y_(i + 1) - y_i) dif t \
  &= (y_(i + 1) - y_i) ( x_i integral_(t=0)^1 (1 - t) dif t + x_(i + 1) integral_(t=0)^1 t  dif t ) \
  &= (y_(i + 1) - y_i) ( x_i dot 1/2 + x_(i + 1) dot 1/2 ) \
  &= 1/2 (y_(i + 1) - y_i) (x_i + x_(i + 1)) \
  &= (x_i y_(i+1) - x_(i+1) y_i)/2  + (x_(i+1) y_(i+1) - x_i y_i) / 2. $
对所有边求和，第一项正是我们想要的右边，
而第二项会相消，因为
$ (x_1 y_1 - x_n y_n) / 2 + (x_2 y_2 - x_1 y_1) / 2
  + (x_3 y_3 - x_2 y_2) / 2 + ... + (x_n y_n - x_(n-1) y_(n-1)) / 2 = 0. $
换言之，
$ sum_(i = 0)^(n-1) integral_("由" P_i "to" P_(i + 1)) x dif y
  &= sum_(i = 0)^(n-1) ((x_i y_(i+1) - x_(i+1) y_i)/2  + (x_(i+1) y_(i+1) - x_i y_i) / 2) \
  &= sum_(i = 0)^(n-1) ((x_i y_(i+1) - x_(i+1) y_i)/2) $
证毕。

== @exer-parabola-3 的解答（抛物线弧 v3）

#recall-thm(<exer-parabola-3>)

我们几乎可以照抄 @exer-parabola-1 与 @exer-parabola-2，
只作细微修改，把功换成二维通量。
见下图，
它只是 @fig-sol-india-parabola-nofill 与 @fig-sol-india-parabola-fill 的复制。

#figure(
  stack(
    dir: ltr,
    spacing: 2mm,
    [#image("figures/sol-india-parabola-nofill.svg", width: auto)],
    [#image("figures/sol-india-parabola-fill.svg", width: auto)]
  ),
  caption: [又是这条抛物线弧。],
) <fig-sol-india-parabola-both>

#h3[使用直接参数化]
我们再次把 $cal(C)$ 分成两部分 $cal(C)_1$ 与 $cal(C)_2$，
分别对应抛物线与线段。

对 $cal(C)_1$，我们选取参数化
$ bf(r)(t) = (t, t^2-1) $（$-1 <= t <= 1$）。
正如我们在 @exer-parabola-1 中所见，我们有
$ bf(r)(t) = (t, t^2-1) $（$-1 <= t <= 1$），所以
$ bf(F)(bf(r)(t)) = bf(F)(t, t^2-1) = vec(t^4, t^4)
  quad
  bf(r)'(t) = vec(1, 2t). $
于是按 @sec-recipe-2d-flux 中那样旋转 $bf(F)$，我们得到
$ integral_(cal(C)_1) bf(F) dot bf(n) dif s
  &= integral_(t=-1)^1 vec(-t^4, t^4) dot vec(1, 2t) dif t \
  &= integral_(t = - 1)^1 (-t^4 + t^4 dot 2 t) dif t \
  &= [-t^5/5 + 1/3 t^6]_(t=-1)^1 = -2 / 5 . $

接下来，我们用 $(1 - t , 0)$（$0 <= t <= 2$）参数化 $cal(C)_2$。
再次重复 @exer-parabola-1 的内容，我们有
$ bf(F)(bf(r)(t)) = bf(F)(1-t,0) = vec((1-t)^2, 1)
  quad
  bf(r)'(t) = vec(-1, 0). $
按 @sec-recipe-2d-flux 中那样旋转 $bf(F)$，我们得到
$ integral_(cal(C)_2) bf(F) dot bf(n) dif s
  &= integral_(t=0)^2 vec(-1, (1-t)^2) dot vec(-1, 0) dif t \
  &= integral_(t=0)^2 1 dif t \
  &= 2. $

把这些放在一起，我们得到
$ integral_(cal(C)) bf(F) dot bf(n) dif s
  = integral_(cal(C)_1) bf(F) dot bf(n) dif s + integral_(cal(C)_2) bf(F) dot bf(n) dif s
  = -2/5 + 2 = #boxed[$ 8/5 $]. $

#h3[使用格林定理]
这与 @exer-parabola-2 类似，
我们唯一改变的是被积函数。
令 $P = x^2 (y + 1)$，$Q = (y + 1)^2$，我们考虑
$ (partial P) / (partial x) + (partial Q) / (partial y) = 2 x (y + 1 ) + 2 (y + 1)
  = 2(x+1)(y+1). $

再设 $cal(R)$ 为 $y = x^2-1$ 与 $y=0$ 之间、被 $cal(C)$ 围成的区域。
区域 $cal(R)$ 没有变化，仍由
$ -1 <= x <= 1 \ x^2-1 <= y <= 0. $
给出。
因此由格林定理，我们有
$ integral_(cal(C)) bf(F) dot bf(n) dif s
  &= integral.double_(cal(R)) ((partial P) / (partial x) + (partial Q) / (partial y)) dif A \
  &= integral_(x=- 1)^1 integral_(y=x^2 - 1)^0 2(x+1)(y+1) dif y dif x \
  &= integral_(x=- 1)^1 (x+1) integral_(y=x^2 - 1)^0 2(y+1) dif y dif x \
  &= integral_(x=- 1)^1 (x+1) (1-x^4) dif x \
  &= integral_(x=- 1)^1 (-x^5-x^4+x+1) dif x \
  &= [-x^6/6 - x^5/5 + x^2/2 + x]_(x=-1)^1 = #boxed[$ 8/5 $]. $

== @exer-flux-triangle 的解答（穿过三角形的通量）

#recall-thm(<exer-flux-triangle>)

给定三角形 $A B C$，其顶点为：
$ A = (- 5 , 0) , quad B = (9 , 0) , quad C = (0 , h) , $
其中 $C$ 在 $y$ 轴正半轴上。
我们先求出 $h$，之后就能容易地得到周长的长度。

向量场为：
$ bf(F) (x , y) = (P , Q) = (x + 7 y^2 , x^2 + 7 y) . $
设 $cal(C)$ 为该三角形的边界。
格林定理给出
$ 672 = integral.cont_(cal(C)) bf(F) dot bf(n) dif s = integral.double_(cal(R)) ((partial P) / (partial x) + (partial Q) / (partial y)) dif A . $
计算偏导数：
$ (partial P) / (partial x) &= (partial) / (partial x) (x + 7 y^2) = 1 , \
  (partial Q) / (partial y) &= (partial) / (partial y) (x^2 + 7 y) = 7 . $
因此，散度为：
$ nabla dot bf(F) = (partial P) / (partial x) + (partial Q) / (partial y) = 1 + 7 = 8 . $
因此，我们得到
$ 672 = integral.double_(cal(R)) 8 dif A = 8 op("面积")(cal(R)). $
但三角形的面积为：
$ op("面积")(triangle.stroked.t A B C)
  = 1 / 2 dot upright("底") dot upright("高")
  = 1 / 2 dot 14 dot h = 7 h. $
把它代入积分等式：
$ 8 dot 7 h = 672 . $
解出 $h$：
$ 56 h = 672 ==> h = 672 / 56 = 12 . $

因此，我们知道 $C = (0,12)$。

然后我们可以通过计算所有边长来得到周长：
$ A B &= lr(|9 - (- 5)|) = 14 \
  B C &= sqrt((9 - 0)^2 + (0 - 12)^2) = sqrt(81 + 144) = sqrt(225) = 15 \
  C A &= sqrt((0 - (- 5))^2 + (12 - 0)^2) = sqrt(25 + 144) = sqrt(169) = 13 . $
因此，周长为：$14 + 15 + 13 = #boxed[$ 42 $]. $

== @exer-mt3-butterfly 的解答（蝴蝶归来）

#recall-thm(<exer-mt3-butterfly>)

注意蝴蝶从 $bf(r)(0) = (0,0)$ 出发，也回到 $bf(r)(2 pi) = (0,0)$。

#h3[两问的简短解答]

无论向量场 $bf(F)$ 是什么，答案都是 $#boxed[$0$]$！
有两种看法。
- 这可以由格林定理推出，因为轨迹 $bf(r)$
  切出一个面积为零的退化平行四边形。
- 蝴蝶在反向重走自己的路径，所以 $0 <= t <= pi/2$ 的部分
  与 $pi/2 <= t <= pi$ 的部分相消，
  而 $pi <= t <= 3/2 pi$ 的部分与 $3/2 pi <= t <= 2 pi$ 的部分相消。

#h3[第一问向量场的另一种简短做法]

第一个积分是对保守向量场 $bf(F) = vec(x, 0)$ 的积分，
因为它的二维标量旋度为 $0 - 0 = 0$。
所以微积分基本定理也说明答案是 $0$，
因为路径是一个环路。
（如果 $f$ 是势函数，那么答案应该是 $f(0,0) - f(0,0) = 0$。
如果你愿意，可以算出势函数 $f(x,y) = x^2/2+C$，但没必要。）

#h3[第二问非保守场的繁琐做法]

在第二问中，$bf(F) = vec(y,0)$ 不是保守的。
假设你没想到那个巧妙解法里的想法。
那你仍然可以手工计算这个积分，取
$ bf(r)'(t) = chevron.l cos(t), cos(t) chevron.r $
于是该线积分由下式给出
$ integral_(t=0)^(2pi) bf(F)(sin(t), sin(t)) dot bf(r)'(t) dif t
  = integral_(t=0)^(2pi) sin(t) cos(t) dif t. $
这个积分是 $0$；下面是许多种计算它的方法。

1. 注意，如果你也手工计算了第一个线积分，
  所得到的其实正是同一个三角积分，所以答案应当相同，即 $0$。
2. 注意在 $0 <= t <= pi$ 上，来自 $t$ 与 $t + pi$ 的贡献相消。
3. 另一种计算该积分的方法是作 $u$-代换 $u = sin(t)$，
  其中 $dif u = cos(t) dif t$：
  $ integral_(t=0)^(2pi) sin(t) cos(t) dif t = integral_(u=sin(0))^(u=sin(2pi)) u dif u = integral_0^0 u dif u = 0. $
4. 还有一种方法是使用三角代换
  $ integral_(t=0)^(2pi) sin(t) cos(t) dif t = integral_(t=0)^(2pi) sin(2t)/2 dif t = [-cos(2t)/4]_(t=0)^(2pi) = 0. $
5. 如果你对三角函数过敏，第五种做法是记住
  线积分不依赖于具体的参数化。
  所以不必使用 $bf(r)(t) = chevron.l sin(t), sin(t) chevron.r$，
  你可以想象把蝴蝶的运动切成三段匀速轨迹：
  - $bf(r)_1(t) = (t,t)$，$0 <= t <= 1$
  - $bf(r)_2(t) = (1-t,1-t)$，$0 <= t <= 2$
  - $bf(r)_3(t) = (t-1,t-1)$，$0 <= t <= 1$。
  如果你计算这三段线积分，其和也会是零。

== @exer-mt3-green 的解答（标准的功与通量）

#recall-thm(<exer-mt3-green>)

这是格林定理（两种形式）的模板式应用。

对于线积分，使用带二维标量旋度的格林定理：
$ integral_(cal(C)) bf(F) dot dif bf(r)
  &= integral.double_(x^2+y^2 <= 1) (partial/(partial x)(4x+8y) - partial/(partial y)(x+2y)) dif A \
  &= integral.double_(x^2+y^2 <= 1) (4-2) dif A \
  &= 2 integral.double_(x^2+y^2 <= 1) dif A \
  &= #boxed[$ 2 pi $]. $

对于通量，使用带散度的格林定理：
$ integral_(cal(C)) bf(F) dot bf(n) dif s
  &= integral.double_(x^2+y^2 <= 1) nabla dot bf(F) dif A \
  &= integral.double_(x^2+y^2 <= 1) ( partial/(partial x)(x+2y) +  partial/(partial y)(4x+8y) ) dif A \
  &= integral.double_(x^2+y^2 <= 1) (1+8) dif A \
  &= 9 integral.double_(x^2+y^2 <= 1) dif A \
  &= #boxed[$ 9 pi $]. $

== @exer-mt3-chvar 的解答（面积为 $pi$ 的区域）

#recall-thm(<exer-mt3-chvar>)

设 $cal(R)$ 表示题中的区域。
这是一道换元题，其中
$ u = x + k y \
  v = k x + y $
把 $cal(R)$ 变成半径为 $1/2$ 的圆盘 $u^2 + v^2 <= 1/4$。

设 $bf(T)$ 表示相应的映射 $(u,v) |-> (x,y)$。
计算雅可比的逆
$ J_(bf(T)^(-1)) = mat((partial u) / (partial x), (partial u) / (partial y);
  (partial v) / (partial x), (partial v) / (partial y))
  = mat(1, k; k, 1). $
所以
$ det J_(bf(T)) = 1 / (detmat(1, k; k, 1)) = 1/(1-k^2). $
现在，题目的条件告诉我们
$ pi = integral.double_(cal(R)) dif x dif y
  = integral.double_(u^2+v^2 <= 1/4) lr(|1/(1-k^2)|) dif u dif v
  = lr(|1/(1-k^2)|) integral.double_(u^2+v^2 <= 1/4) dif u dif v
  = lr(|1/(1-k^2)|) dot pi / 4. $
所以我们要解的方程是
$ pi = lr(|1/(1-k^2)|) dot pi / 4 <==> k^2 - 1 = pm 1/4 <==> k^2 = 3/4 " or " k^2 = 5/4. $

因此答案是 $ k = #boxed[$ pm sqrt(3) / 2 " or " pm sqrt(5) / 2 $]. $

== @exer-mt3-polar 的解答（楔形的质心）

#recall-thm(<exer-mt3-polar>)

首先，我们画出区域的草图。
条件 $x^2 + y^2 <= 9$ 表示以原点为圆心、半径为 $3$ 的圆。
不等式 $y >= 0$ 与 $y >= sqrt(3) lr(|x|)$
切出一个楔形，它覆盖了圆的上半部分，即 chevron.range 之内，
换成极坐标就是 $pi / 3 <= theta <= (2 pi) / (3)$。
见 @fig-mt3-slice。

换成极坐标后，该区域在极坐标下由以下条件界定：
- $0 <= r <= 3$（圆的半径），
- $pi / 3 <= theta <= (2 pi) / (3)$（角度的界由 $y = sqrt(3) x$ 与 $y = - sqrt(3) x$ 确定）。

从而质心的坐标为：
$ dash(x) = 1 / (op("面积")(cal(R))) integral.double_cal(R) x dif A , quad dash(y) = 1 / (op("面积")(cal(R))) integral.double_cal(R) y dif A . $

- 注意到该区域是整个圆面积的六分之一，即可算出面积：
  $ op("面积")(cal(R)) = 1/6 dot (3^2 dot pi) = (3 pi) / 2. $
- 由关于 $y$ 轴的对称性，我们有 $dash(x) = 0$。
- 我们需要计算 $dash(y)$。
  使用 $y = r sin theta$：
  $ dash(y) = integral.double_cal(R) y dif A = integral_(theta = pi / 3)^((2 pi) / (3)) integral_(r = 0)^3 r sin theta dot r dif r dif theta = integral_(theta = pi / 3)^((2 pi) / (3)) sin theta integral_(r = 0)^3 r^2 dif r dif theta . $
  首先，我们计算
  $ integral_(r = 0)^3 r^2 dif r = [r^3 / 3]_(r = 0)^3 = 27 / 3 = 9 . $
  因此
  $dash(y) = integral.double_cal(R) y dif A = 9 integral_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta$.
  对 $theta$ 积分 $sin theta$：
  $ integral_(theta = pi / 3)^((2 pi) / (3)) sin theta dif theta
    = - [cos theta]_(theta = pi / 3)^((2 pi) / (3)) = - cos ((2 pi) / (3)) + cos (pi / 3)
    = - (- 1 / 2) + 1 / 2 = 1 . $
  因此 $integral.double_cal(R) y dif A = 9 dot 1 = 9$，于是
  $ dash(y) = 1 / (op("面积")(cal(R))) integral.double_cal(R) y dif A = 9 / ((3 pi) / 2) = 6 / pi . $
总之，质心由 $ (dash(x),dash(y)) = #boxed[$ (0, 6/pi) $]. $ 给出。

#digression(title: [题外话：求面积的繁琐做法])[
  如果你不想做几何，
  可以按定义手工计算 $op("面积")(cal(R))$
  $op("面积")(cal(R)) = integral_(theta = pi / 3)^((2 pi) / (3)) integral_(r = 0)^3 r dif r dif theta$。
  首先，对 $r$ 积分：
  $ integral_(r = 0)^3 r dif r = [r^2 / 2]_(r = 0)^3 = 9 / 2 . $
  然后，对 $theta$ 积分：
  $ A = integral_(theta = pi / 3)^((2 pi) / (3)) 9 / 2 dif theta = 9 / 2 ((2 pi) / (3) - pi / 3) = 9 / 2 dot pi / 3 = (3 pi) / (2) . $
]

#figure(
  image("figures/mt3-wedge.svg", width: auto),
  caption: [这是披萨的六分之一块之类的东西。],
) <fig-mt3-slice>

#digression(title: [题外话：求 $overline(x)$ 的繁琐做法])[
  作为对照，我们展示如果你没注意到对称性而直接积分会发生什么。
  在极坐标下，$x = r cos theta$，$dif A = r dif r dif theta$。
  所以：
  $ integral.double_cal(R) x dif A = integral_(r = 0)^3 integral_(theta = pi / 3)^((2 pi) / (3))  r cos theta dot r dif r dif theta
    = integral_(r = 0)^3 r^2 integral_(theta = pi / 3)^((2 pi) / (3)) cos theta  dif theta dif r. $
  然而，内层积分是
  $ integral_(theta = pi / 3)^((2 pi) / (3)) cos theta dif theta &= [sin theta]_(theta = pi / 3)^((2 pi) / (3)) \
    &= sin ((2 pi) / (3)) - sin (pi / 3) = sqrt(3) / 2 - sqrt(3) / 2 = 0. $
  所以整个结果为 $0$。
]

== @exer-mt3-consv 的解答（还原 $h$）

#recall-thm(<exer-mt3-consv>)

因为 $bf(F)$ 是保守的，我们知道下面两个偏导数必须相等：
$ partial / (partial y) (x y + cos (x)) &= x \
  partial / (partial x) (h(x) + cos(y)) &= h'(x). $
由 $h'(x) = x$ 我们推出 $ h(x) = x^2 / 2 + C $，
其中 $C$ 是某个常数。

所以我们几乎已经知道了 $h$，只是还需要用最后一条信息来求出 $C$。
首先，用 $C$ 表示出 $bf(F)$ 的一个势函数：
$ f(x,y) = 1/2 x^2  y + sin(x) + sin(y) + C y + C' $
其中 $C'$ 是某个常数（无关紧要）。
然后使用线积分的微积分基本定理：
$ integral_(cal(C)) bf(F) dot dif bf(r) &= f(pi, pi) - f(0,0) \
  ==> 0 &= (pi^3/2 + C pi + C') - C' ==> C = -pi^2/2. $
这样我们就完全还原了函数 $h$：
$ h(x) = #boxed[$ x^2/2 - pi^2/2 $]. $

== @exer-mt3-log 的解答（积分 $log(sqrt(x)+1)$）

#recall-thm(<exer-mt3-log>)

乍看之下，这像是一个 18.01 的积分，
但我们从 18.01 中知道，这个积分其实是在度量某条曲线下方的面积；
我们用 $cal(R)$ 表示那个区域，它在下面用蓝色阴影标出。
思路是：为了避免处理对数和平方根，
我们将对图中曲线下方的区域使用水平切片。

#figure(
  image("figures/mt3-undergraph.svg", width: auto),
  caption: [区域 $y <= log(sqrt(x)+1)$，其中 $0 <= x <= (e-1)^2$。],
)

关键在于现在把它改写为
$ y <= log(sqrt(x)+1) <==> e^y - 1 <= sqrt(x) <==> x >= (e^y-1)^2. $
因此，我们同样可以把蓝色阴影区域 $cal(R)$ 改写为：
$ 0 <= y <= 1 " 与 " x >= (e^y-1)^2. $
把它写成二重积分，得到
$ op("面积")(cal(R))
  &= integral_(y=0)^1 integral_(x=(e^y-1)^2)^((e-1)^2) dif x dif y
  = integral_(y=0)^1 ((e-1)^2 - (e^y-1)^2) dif y \
  &= e^2-2e - integral_(y=0)^1 (e^(2y) - 2e^y) dif y
  = e^2-2e - lr([e^(2y)/2 - 2e^y])_(y=0)^1 \
  &= e^2-2e - (e^2/2 - 2e) + (1/2-2) = #boxed[$ (e^2-3)/2 $]. $

#remark[
  也可以直接用分部积分与 $u$-代换求出 $log(sqrt(x)+1)$ 的一个原函数，
  但这个过程很费时间。
  结果这个原函数等于 $-x/2 + sqrt(x) + (x-1)log(sqrt(x)+1) + C$。
]
