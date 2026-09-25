#import "@local/evan-zh:1.0.0":*

= Delta 部的解答

== @exer-param-parabola 的解答（抛物线弧长）

#recall-thm(<exer-param-parabola>)

我们取参数化
$ bf(r)(t) = (t, t^2-t-12) quad -3 <= t <= 4. $
其导数为
$ bf(r)'(t) = chevron.l 1, 2t-1 chevron.r quad -3 <= t <= 4. $
因此，题目所求的弧长为
$ L = integral_(t=-3)^4 sqrt(1 + (2t-1)^2) dif t. $

为了使用习题中的提示，
我们作 $u$-换元
$ u = 2t-1 = 2 (t - 1 / 2) ==> dif u = 2 dif t ==> dif t = (d u) / (2). $
当 $t=-3$ 时得到 $u=-7$，当 $t=4$ 时得到 $u=7$。
于是我们有
$ L = 1/2 integral_(u=-7)^7 sqrt(u^2+1) dif u. $
现在利用提示可得
$ L &= 1/4 [u sqrt(u^2+1) + log(u + sqrt(u^2+1))]_(u=-7)^7 \
  &= 1/4 (14 sqrt(50) + log(7 + sqrt(50)) - log(-7 + sqrt(50))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2)) / (-7 + 5 sqrt(2))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2))^2 / ((7 + 5 sqrt(2))(-7 + 5 sqrt(2)))) \
  &= 35/2 sqrt(2) + 1/4 log((7 + 5 sqrt(2))^2) \
  &= #boxed[$ 35/2 sqrt(2) + 1/2 log(7 + 5 sqrt(2)) $]. $

== @exer-param-teacup 的解答（茶杯）

#recall-thm(<exer-param-teacup>)

我们先参数化幼儿的运动，然后再求导以求出速度向量。

1. 茶杯中心以角速度
  $omega_(upright("ride"))$ 沿半径为 $R$ 的圆周绕一个
  固定中心顺时针旋转。茶杯中心的位置作为时间
  $t$ 的函数为：
  $ bf(C) (t) = vec(R cos (omega_(upright("ride")) t) , - R sin (omega_(upright("ride")) t)) . $
  这描述了茶杯中心绕游乐设施固定中心的圆周运动，
  其中正弦项上的负号表示顺时针旋转。

2. 幼儿坐在茶杯的边缘，茶杯以角速度 $omega_(upright("cup"))$
  逆时针旋转，半径为 $r$。初始时刻 $t = 0$ 时，幼儿相对于
  茶杯中心位于 $(r , 0)$。幼儿相对于茶杯中心的位置为：
  $ bf(T)_(upright("relative")) (t) = vec(r cos (omega_(upright("cup")) t) , r sin (omega_(upright("cup")) t)) . $
  这描述了幼儿相对于茶杯中心的逆时针圆周运动。

3. 为求出幼儿的总位置作为时间的函数，我们把
  茶杯中心的位置 $bf(C) (t)$ 与
  幼儿相对于茶杯的位置
  $bf(T)_(upright("relative")) (t)$ 相加。幼儿的
  总位置为：
  $ bf(T) (t) = bf(C) (t) + bf(T)_(upright("relative")) (t) . $
  代入 $bf(C) (t)$ 与
  $bf(T)_(upright("relative")) (t)$ 的表达式，得到：
  $ bf(T) (t) = vec(R cos (omega_(upright("ride")) t) , - R sin (omega_(upright("ride")) t)) + vec(r cos (omega_(upright("cup")) t) , r sin (omega_(upright("cup")) t)) . $
  化简后，我们有：
  $ bf(T) (t) = vec(R cos (omega_(upright("ride")) t) + r cos (omega_(upright("cup")) t) , - R sin (omega_(upright("ride")) t) + r sin (omega_(upright("cup")) t)) . $
  这就给出了幼儿的位置作为时间函数的参数化。

速度向量 $bf(T)' (t)$ 是位置向量
$bf(T) (t)$ 对时间的导数：
$ #boxed[$ bf(T)' (t) =
  vec(- R omega_(upright("ride")) sin (omega_(upright("ride")) t)
  - r omega_(upright("cup")) sin (omega_(upright("cup")) t),
  - R omega_(upright("ride")) cos (omega_(upright("ride")) t)
  + r omega_(upright("cup")) cos (omega_(upright("cup")) t)) $] . $

== @exer-param-helicopter 的解答（直升机）

#recall-thm(<exer-param-helicopter>)

我们先参数化 $bf(P)(t)$：
1. 由于直升机以恒定速率 $v = 5$ 向上运动，
  直升机在时刻 $t$ 的高度为：
  $ z (t) = v t = 5 t . $
2. 点 $P$ 位于旋翼叶片的尖端，叶片以角速度
  $omega = pi / 3$ 顺时针旋转。在水平
  平面内，$P$ 相对于旋翼中心的位置可以
  参数化为：
  $ bf(v) (t) = vec(r cos (omega t) , - r sin (omega t)) , $
  其中 $r = 2$ 是叶片的半径，$y$ 坐标中的
  负号反映了顺时针旋转。
  因此，$P$ 在 $x y$ 平面内的位置为：
  $ bf(v) (t) = vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t)) . $
3. 点 $P$ 的总位置作为时间的函数，是
  $z$ 方向上的向上运动与 $x y$ 平面内的
  旋转运动的叠加。因此，$P$ 的位置为：
  $ #boxed[$ bf(P) (t) = vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t) , 5 t) $]. $

至于路程，我们先求导计算速度向量：
$ bf(P)' (t) &= (d) / (dif t) vec(2 cos (pi / 3 t) , - 2 sin (pi / 3 t) , 5 t)
  = vec(- (2 pi) / (3) sin (pi / 3 t) , - (2 pi) / (3) cos (pi / 3 t) , 5) . $
速率是速度向量的模长：
$ lr(|bf(P)' (t)|) = sqrt((- (2 pi) / (3) sin (pi / 3 t))^2 + (- (2 pi) / (3) cos (pi / 3 t))^2 + 5^2) . $
利用三角恒等式 $sin^2 (theta) + cos^2 (theta) = 1$，
上式化简为：
$ lr(|bf(P)' (t)|) &= sqrt(((2 pi) / (3))^2 + 5^2) = sqrt((4 pi^2) / (9) + 25) \
  &= sqrt((4 pi^2) / (9) + 225 / 9) = sqrt((4 pi^2 + 225) / (9)) = sqrt(4 pi^2 + 225) / 3 $
这是一个常数！
因此总路程就等于
$ upright("距离") = integral_0^(18) sqrt(4 pi^2 + 225) / 3 dif t
  = 18 dot sqrt(4 pi^2 + 225) / 3  = #boxed[$ 6 sqrt(4 pi^2 + 225) $]. $

== @exer-param-clockblock 的解答（时钟）

#recall-thm(<exer-param-clockblock>)

答案是 $#boxed[4 o'clock]$！
换言之，红色圆盘绕蓝色方块整整转一圈时，
自转的是_三_圈，而不只是两圈。

这是所谓的*硬币旋转悖论*（coin rotation paradox）的一个变体
（见 #link("https://w.wiki/CBUS")[维基百科]），其中 $R = 20$、$r = 10$。
细节和动画（当 $R = r$ 以及 $R = 3r$ 时）见那里的说明。
