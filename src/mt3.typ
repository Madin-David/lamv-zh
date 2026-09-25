#import "@local/evan-zh:1.0.0":*

= 针对 Golf、Hotel、India 部分中 2D 主题的模拟期中考试 <ch-mt3>

这是一份于 2024 年 11 月 13 日给出的模拟期中考试，
涵盖 Golf、Hotel 和 India 部分中的主题，
但只涉及这些部分中的 2D 主题。
解答见 @ch-sol-india。

#exer[
  另一只蝴蝶正在 $x y$ 平面中飞舞，
  其位置为 $bf(r)(t) = chevron.l sin(t), sin(t) chevron.r$。
  令 $cal(C)$ 表示它在 $0 <= t <= 2pi$ 之间的轨迹。
  计算 $integral_(cal(C)) (x dif x)$ 与 $integral_(cal(C)) (y dif x)$。
] <exer-mt3-butterfly>

#exer[
  令 $cal(C)$ 表示逆时针定向的单位圆 $x^2+y^2=1$，
  并考虑向量场 $bf(F)(x,y) = chevron.l x+2y, 4x+8y chevron.r$。
  计算 $integral_(cal(C)) bf(F) dot dif bf(r)$ 与 $integral_(cal(C)) bf(F) dot bf(n) dif s$。
] <exer-mt3-green>

#exer[
  求所有使下列区域面积为 $pi$ 的实数 $k$：
  $ (k x + y)^2 + (x + k y)^2 <= 1/4. $
] <exer-mt3-chvar>

#exer[
  计算满足 $y >= 0$ 且 $3x^2 <= y^2 <= 9 - x^2$ 的区域的质心，
  假设密度恒定。
] <exer-mt3-polar>

#exer[
  令 $cal(C)$ 表示从 $(0,0)$ 到 $(pi,pi)$ 的任意路径。
  求唯一的函数 $h(x)$，使得
  $bf(F)(x,y) = chevron.l x y + cos(x), h(x) + cos(y) chevron.r$ 为保守场，
  并且 $integral_(cal(C)) bf(F) dot dif bf(r) = 0$。
] <exer-mt3-consv>

#exer[
  假设 $log$ 以 $e approx 2.718$ 为底。用任何你想用的方法
  计算 $ integral_(x=0)^((e-1)^2) log(sqrt(x)+1) dif x. $
  推荐做法：把该积分视为曲线下方的面积，
  然后把竖直切片换成水平切片。
] <exer-mt3-log>
