#import "@local/evan-zh:1.0.0":*

= Juliett 部解答

== @exer-flux-xy-ez 的解答（穿过曲面的通量）

#recall-thm(<exer-flux-xy-ez>)

我们用 $bf(r)(x,y) = chevron.l x, y, log(x^3+y^4) chevron.r$ 对该曲面作参数化。
与其处理 log，我们改用 @table-surfcross-2 的第二行，
并定义函数 $ g (x , y , z) = x^3 + y^4 - e^z . $
该曲面由 $g (x , y , z) = 0$ 隐式给出，因此我们计算它的梯度：
$ nabla g = lr(chevron.l (partial g) / (partial x) , (partial g) / (partial y) , (partial g) / (partial z) chevron.r)
  = (3 x^2 , 4 y^3 , - e^z) . $
因此，
$ (partial bf(r)) / (partial x) times (partial bf(r)) / (partial y)
  = (nabla g) / ((partial g) / (partial z))
  = (chevron.l 3x^2, 4y^3, -e^z chevron.r)/(-e^z)
  = vec( - 3x^2 e^(-z), - 4y^3 e^(-z), 1 ). $
这个法向量的定向朝上，因为它的 $z$ 分量为正，
所以我们把它取作我们的 $bf(n) dif S$。

因此，$bf(F)$ 穿过 $S$ 的通量由下式给出
$ integral.double_(cal(S)) bf(F) dot bf(n) dif S
  &= integral_(x=0)^5 integral_(y=0)^5 vec( x/3, y/4, 1/5 ) dot vec( - 3x^2 e^(-z), - 4y^3 e^(-z), 1 ) dif y dif x  \
  &= integral_(x=0)^5 integral_(y=0)^5 ((-x^3 - y^4) / e^z + 1/5)  dif y dif x \
  &= integral_(x=0)^5 integral_(y=0)^5 ((-e^z) / e^z + 1/5) dif y dif x \
  &= integral_(x=0)^5 integral_(y=0)^5 -4/5 dif y dif x \
  &= 25 dot -4/5 = #boxed[$ -20 $]. $

== @exer-flux-sealing 的解答（把曲面封起来）

#recall-thm(<exer-flux-sealing>)

$bf(F)$ 的散度为
$ nabla dot bf(F) = (partial) / (partial x) (cos (z^2) - x)
  + (partial) / (partial y) (sin (z^2) - y) + (partial) / (partial z) (2 z) = (- 1) + (- 1) + 2 = 0 . $

我们通过添加 $cal(S)_"盖面"$ 来把区域 $cal(S)$ 封起来，
它是满足 $z = e$ 且 $x^2+y^2 <= 1$ 的点构成的曲面。
这就围出了一个闭合的体积 $cal(T)$。
我们把 $cal(S)_"盖面"$ 的法向量定向为朝上（背离 $cal(T)$）。
注意 $cal(S)$ 的法向量也是背离 $cal(T)$ 的。

对围出 $cal(T)$ 的 $cal(S)$ 与 $cal(S)_"盖面"$ 应用散度定理，现在得到
$ integral.double_(cal(S)) bf(F) dot dif bf(S) + integral.double_(cal(S)_"盖面") bf(F) dot dif bf(S) =
  integral.triple_(cal(T)) nabla dot bf(F) dif V = 0. $
因此，我们计算穿过圆盘的通量，并用它来确定穿过 $cal(S)$ 的通量。

对平坦曲面 $cal(S)_"盖面"$，我们可以取 $bf(n) dif S = chevron.l 0,0,1 chevron.r$，于是
$ integral.double_(cal(S)_"盖面") bf(F) dot dif bf(S) = integral.double_(cal(S)_"盖面") bf(F) dot chevron.l 0 , 0 , 1 chevron.r dif A
  &= integral.double_(cal(S)_"盖面") 2z dif A \
  &= integral.double_(x^2+y^2 <= 1) 2e dif A \
  &= 2e op("面积")(x^2+y^2 <= 1) = 2 e pi. $
因此答案是：
$ integral.double_(cal(S)) bf(F) dot dif bf(S)
  = - integral.double_(cal(S)_"盖面") bf(F) dot dif bf(S)
  = #boxed[$ - 2 pi e $]. $

== @exer-gravity-div2 的解答（引力）

#recall-thm(<exer-gravity-div2>)

这基本上由 @exer-gravity-div1 可得，它告诉我们 $bf(G)$ 的散度为 $0$。
参见 @fig-sol-india-gravity 中的示意图。

我们考虑介于 $cal(S)_1$ 与 $cal(S)_2$ 之间的实心体积 $cal(T)$。
由于 $cal(S)_2$ 的法向量指向 $cal(T)$，
而 $cal(S)_1$ 的法向量背离 $cal(T)$，
散度定理给出
$ integral.double_(cal(S)_1) bf(G) dot bf(n) dif S
  - integral.double_(cal(S)_2) bf(G) dot bf(n) dif S
  = integral.triple_(cal(T)) nabla dot bf(G) dif V. $

#figure(
  image("figures/sol-india-gravity.svg", width: auto),
  caption: [@exer-gravity-div2 的示意图。],
) <fig-sol-india-gravity>

然而，$cal(T)$ 不包含点 $O$。
因此，应用 @exer-gravity-div1，我们有
$ integral.triple_(cal(T)) nabla dot bf(G) dif V = integral.triple_(cal(T)) 0 dif V = 0. $
证明完毕。

== @exer-div-to-green 的解答（用散度定理推通量的格林定理）

#recall-thm(<exer-div-to-green>)

Poonen 的讲义第 20.2 节涵盖了这一内容。
我们在此给出同样的解答。

我们不在二维中处理，而是把 $cal(R)$ 延拓为
三维区域 $cal(T)$，它由一块高度为 $1$ 的平板构成：
$ cal(T) = { (x , y , z) divides (x , y) "in" cal(R) , 0 <= z <= 1 } . $
换句话说，
想象我们有一台学校用的那种很酷的打印机，它能在瞬间
把同一张图印成几百份的一叠。
于是我们打印许多份 $cal(R)$，直到这叠复印件的高度达到 $1$；
此时 $cal(T)$ 就表示这些纸张中沾有墨迹的那部分。
参见 @fig-sol-india-div-to-green。

现在 $cal(T)$ 的边界曲面由三部分组成：

- 顶盖 $cal(S)_"顶面"$，它看起来像是位于高度 $z=1$ 处的一份 $cal(R)$ 的副本。
- 底盖 $cal(S)_"底面"$，它看起来像是位于高度 $z=0$ 处的一份 $cal(R)$ 的副本；
- 弯曲部分 $cal(S)$，它看起来像是 $cal(T)$ 的侧壁。

我们把这三者都定向为背离 $cal(T)$。

#figure(
  image("figures/sol-india-div-to-green.svg", width: auto),
  caption: [我们把 $cal(R)$ 的副本叠成高度为 $1$ 的一摞。
  这样就得到一个实心体积 $cal(T)$。],
) <fig-sol-india-div-to-green>

接下来，我们基于二维场 $bf(F)$ 定义一个新的三维向量场：
$ bf(F)^(*) = chevron.l p , q , 0 chevron.r. $
$bf(F)^(*)$ 的散度为：
$ nabla dot bf(F)^(*) = (partial p) / (partial x) + (partial q) / (partial y) . $
对 $cal(T)$ 应用散度定理，我们得到：
$ integral.double_(cal(S)_"顶面") bf(F)^(*) dot bf(n) dif S
  + integral.double_(cal(S)_"底面") bf(F)^(*) dot bf(n) dif S
  + integral.double_(cal(S)) bf(F)^(*) dot bf(n) dif S
  = integral.triple_(cal(T)) nabla dot bf(F)^(*) dif V . $

由于 $cal(T)$ 的高度为 1，体积分简化为：
$ integral.triple_(cal(T)) nabla dot bf(F)^(*) dif V
  &= integral_(z=0)^1 integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A dif z \
  &= integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $

现在我们来看 $cal(T)$ 边界的三部分：

- 在 $z = 1$ 处的顶面上，外法向量是 $bf(n) = chevron.l 0 , 0 , 1 chevron.r$，
  而由于 $bf(F)^(*) = chevron.l p , q , 0 chevron.r$，我们有：
  $ bf(F)^(*) dot chevron.l 0,0,1 chevron.r = 0 . $
  因此，顶面没有贡献。
- 类似地，底面 $z = 0$ 也没有贡献。
- 竖直侧壁正好投影到 $cal(C)$ 上，即 $cal(R)$ 的边界。
  这些侧壁的法向量是 $x y$ 平面内的 $bf(n)$，
  所以面元为 $bf(n) dif S = bf(n) dif s dif z$。
  这些侧壁的通量贡献为：
  $ integral.cont_(cal(C)) integral_(z=0)^1 bf(F)^(*) dot bf(n) dif z dif s . $
  由于 $bf(F)^(*)$ 不依赖于 $z$，这简化为：
  $ integral.cont_(cal(C)) bf(F) dot bf(n) dif s . $

把这一切综合起来，我们得到
$ integral.cont_(cal(C)) bf(F) dot bf(n) dif s = integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A . $
这就用散度定理完成了通量的格林定理的证明。


== @exer-stokes-to-green 的解答（用斯托克斯定理推功的格林定理）

#recall-thm(<exer-stokes-to-green>)

Poonen 的讲义第 20.1 节涵盖了这一内容。
它实际上比 @exer-div-to-green 更容易，
因为不需要打印一大堆 $cal(R)$ 的副本——只需要一份。

具体来说，我们只取平面 $z = 0$ 上的一份 $cal(C)$。
就这样——它完全是平的。
然后我们取曲面 $cal(S)$ 就是平坦的 $cal(R)$，同样还是包含在 $z = 0$ 中。
并且我们取力场为
$ bf(F)^(*) = chevron.l p , q , 0 chevron.r  $
与之前一样。

经典的斯托克斯定理现在告诉我们，对于以 $cal(C)$ 为边界的曲面 $cal(S)$，
$ integral.cont_(cal(C)) bf(F)^(*) dot dif bf(r) = integral.double_(cal(S)) nabla times bf(F)^(*) dot bf(n) dif S . $
左端与二维中的 $integral.cont_(cal(C)) bf(F) dot dif bf(r)$ 相同：
多加一个维度并不会改变功。
所以我们只需计算右端的旋度：
$ nabla times bf(F)^(*) = detmat(bf(e)_1, bf(e)_2, bf(e)_3;
  (partial) / (partial x), (partial) / (partial y), (partial) / (partial z);
  p, q, 0)
  = vec(0 , 0 , (partial q) / (partial x) - (partial p) / (partial y)) . $
由于曲面 $cal(S)$ 位于平面 $z = 0$ 内，所以 $cal(S)$ 的
单位法向量为 $bf(n) = chevron.l 0 , 0 , 1 chevron.r$。
因此点积为
$ (nabla times bf(F)^(*)) dot bf(n)
  = vec(0 , 0 , (partial q) / (partial x) - (partial p) / (partial y)) dot vec(0,0,1)
  = (partial q) / (partial x) - (partial p) / (partial y). $
把它代入我们应用斯托克斯定理所得等式的右端，证明就完成了。
