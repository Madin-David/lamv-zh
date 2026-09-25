#import "@local/evan-zh:1.0.0":*

= Hotel 部习题解答

== @exer-napkin-ring 的解答（餐巾环问题）

#recall-thm(<exer-napkin-ring>)

这是一道著名的习题，在维基百科上有它自己的页面：#url("https://w.wiki/CarU")。
下面我们给出一个用柱坐标的解答，
但这远不是唯一可能的解法。

使用柱坐标，球的方程是：$ r^2 + z^2 = R^2 . $
由于孔沿 $z$ 轴、半径为 $a$，
我们施加 $ a <= r <= R $，
也就是说，这个珠子由到 $z$ 轴距离至少为 $a$ 的那些点组成。

至于 $z$，我们要求 $r^2 + z^2 <= R^2$。也就是说，对每个给定的 $r$，
$z$ 可能的取值范围是
$  - sqrt(R^2 - r^2) <= z <= sqrt(R^2 - r^2). $

柱坐标下的体积元是：
$ dif V = r dif r dif theta dif z . $
把这些放在一起，体积积分为：
$ V = integral_(theta=0)^(2 pi) integral_(r=a)^R integral_(z=- sqrt(R^2 - r^2))^(sqrt(R^2 - r^2))
  r dif z dif r dif theta . $
计算内层积分得：
$ integral_(z=- sqrt(R^2 - r^2))^(sqrt(R^2 - r^2)) dif z = 2 sqrt(R^2 - r^2) . $
因此，体积积分化简为：
$ V &= integral_(theta=0)^(2 pi) integral_(r=a)^R 2 r sqrt(R^2 - r^2) dif r dif theta \
  &= (integral_(theta=0)^(2 pi) dif theta)(integral_(r=a)^R 2 r sqrt(R^2 - r^2) dif r) \
  &= 2 pi (integral_(r=a)^R 2 r sqrt(R^2 - r^2) dif r). $
为计算这个积分，
我们作代换 $u = R^2 - r^2$，于是 $dif u = - 2 r dif r$，我们把它改写为：
$ integral_(r=a)^R 2 r sqrt(R^2 - r^2) dif r &= integral_(u=R^2 - R^2)^(R^2 - a^2) sqrt(u) (- dif u) \
  &= integral_(u=0)^(R^2 - a^2) sqrt(u) dif u \
  &= [2/3 u^(3 \/ 2)]_(u=0)^(R^2-a^2) \
  &= 2/3 (R^2 - a^2)^(3/2). $
乘以 $2 pi$，我们得到：
$ V = 2 pi dot 2 / 3 (R^2 - a^2)^(3 \/ 2) = (4 pi) / (3) (R^2 - a^2)^(3 \/ 2) . $
由于 $h = 2 sqrt(R^2 - a^2)$，我们有 $R^2 - a^2 = h^2 / 4$，所以
$ V = #boxed[$ pi / 6 h^3 $]. $

== @exer-sphere-line-distance 的解答（球面上各点到直线的平均距离）


#recall-thm(<exer-sphere-line-distance>)

我们取 $z$ 轴与直线 $ell$ 重合。
于是点 $P = (r , theta , phi)$ 到 $ell$ 的距离
就是 $P$ 到 $z$ 轴的垂直距离，即：
$ d(P) = r sin phi . $

我们在整个球上积分，坐标范围为
$ 0 <= r <= 1 , quad 0 <= theta <= 2 pi , quad 0 <= phi <= pi . $
球体的总体积为：
$ op("体积")(cal(T)) = 4 / 3 pi (1)^3 = (4 pi) / (3) . $

我们现在建立积分 $integral.triple_(cal(T)) d(P) dif V$。
体积元为：
$ dif V = r^2 sin phi dif r dif phi dif theta . $
因此
$ integral.triple_(cal(T)) d(P) dif V
  &= integral.triple_(cal(T)) r sin phi dot r^2 sin phi dif r dif phi dif theta \
  &= integral_(theta=0)^(2 pi) dif theta integral_(phi=0)^pi sin^2 phi dif phi integral_(r=0)^1 r^3 dif r. $
中间那个积分需要用到下面的三角恒等式：
$ sin^2 phi &= (1 - cos(2 phi))/2 \
  ==> integral sin^2 phi dif phi &= phi / 2 - sin(2 phi) / 4. $
因此，
$ integral.triple_(cal(T)) d(P) dif V
  &= integral_(theta=0)^(2 pi) dif theta integral_(phi=0)^pi sin^2 phi dif phi integral_(r=0)^1 r^3 dif r \
  &= (2 pi) dot (pi / 2) dot (1/4) \
  &= pi^2 / 4. $
所以最终答案是
$ 1/(op("体积")(cal(T))) integral.triple_(cal(T)) d(P) dif V
  &= (pi^2 \/ 4) / (4 pi \/ 3) = #boxed[$ 3/16 pi $]. $

== @exer-sphere-gravity 的解答（半球上的引力）

#recall-thm(<exer-sphere-gravity>)

我们摆放半球，使它位于 $x y$ 平面上、且点 $P$ 在 $(0,0,0)$ 处
（所以半球是 $x^2 + y^2 + z^2 <= 1$ 且 $z >= 0$）。
那么这与 @sec-sph-gravity 中的例题基本相同，
只是积分限变了。

确切地说，我们有 $G_1 = G_2 = 0$，而 @eqn-sph-G3 只是说
$ G_3 = G m integral.triple_(cal(T)) sin phi cos phi dif rho dif phi dif theta $
在把密度设为 $1$ 之后。
唯一的变化是积分限：对半球我们应有
$ 0 <= rho <= 1 , quad 0 <= theta <= 2 pi , quad 0 <= phi.alt <= pi / 2 . $

因此，当我们积分计算 $G_3$ 时，有
$ G_3 &= G m integral_(theta=0)^(2 pi) integral_(phi=0)^(pi / 2) integral_(rho=0)^(1)
    sin phi cos phi dif rho dif phi dif theta \
  &= G m (integral_(theta=0)^(2 pi) dif theta)
    (integral_(phi=0)^(pi / 2) sin phi cos phi dif phi)
    (integral_(rho=0)^(1) dif rho) \
  &= G m (2 pi) (integral_(phi=0)^(pi / 2) sin phi cos phi dif phi) (1). $
为计算关于 $phi$ 的积分，写出
$ integral_(phi=0)^(pi \/ 2) sin phi cos phi dif phi
  = 1 / 2 integral_0^(pi \/ 2) sin 2 phi dif phi
  = 1 / 2 [- 1 / 2 cos 2 phi]_(phi=0)^(pi \/ 2)
  = 1/2. $
因此，
$ G_3 = (G m) dot (2 pi) dot 1/2 dot 1 = G m pi. $
换言之，在我们选取的坐标系中，引力为
$ bf(G) = lr(chevron.l 0, 0, G m pi chevron.r). $
其模长为 $|bf(G)| = #boxed[$ G m pi $]. $

== @exer-psurf 的解答（求参数曲面上的点）

#recall-thm(<exer-psurf>)

要使 $P = (2 , 8 , k)$ 落在 $cal(S)$ 上，必须存在 $u$ 与 $v$
使得：$ u - v = 2 , quad u + v = 8 , quad u v = k . $
把前两个方程相加：
$ (u - v) + (u + v) = 2 + 8 ==> 2 u = 10 ==> u = 5. $
用第二个方程减去第一个方程：
$ (u + v) - (u - v) = 8 - 2 ==> 2 v = 6 ==> v = 3. $
因此 $k = u v = #boxed[$ 15 $]. $

== @exer-surf-tangent 的解答（求参数曲面的切平面）

#recall-thm(<exer-surf-tangent>)

第一步是解出 $(u,v)$，与前面的 @exer-psurf 很像。
点 $(3 , 7 , 10)$ 必须满足参数方程：
$ u - v = 3 , quad u + v = 7 , quad u v = 10 . $
解得 $(u,v) = (5,2)$。

现在，根据 @sec-surface-area-explanation 中的讨论，
思路是：我们切平面的法向量应当由
$ (partial bf(r))/(partial u) times (partial bf(r))/(partial v) $
在曲面的每一点处给出。

所以，我们先计算导数：
$ (partial bf(r))/(partial u)
  &= ((partial) / (partial u) (u - v) , (partial) / (partial u) (u + v) , (partial) / (partial u) (u v)) \
  &= chevron.l 1 , 1 , v chevron.r \
  (partial bf(r))/(partial v)
  &= ((partial) / (partial v) (u - v) , (partial) / (partial v) (u + v) , (partial) / (partial v) (u v)) \
  &= chevron.l - 1 , 1 , u chevron.r. $
在 $(u,v) = (5,2)$ 处，我们得到
$ (partial bf(r))/(partial u)(5,2)
  &= chevron.l 1 , 1 , 2 chevron.r \
  (partial bf(r))/(partial v)(5,2)
  &= chevron.l - 1 , 1 , 5 chevron.r. $
于是叉积为
$ (partial bf(r))/(partial u)(5,2)
  times (partial bf(r))/(partial v)(5,2)
  &= detmat(bf(e)_1, bf(e)_2, bf(e)_3;
  1, 1, 2;
  -1, 1, 5
  )
  &= 3 bf(e)_1 - 7 bf(e)_2 + 2 bf(e)_3. $
因此，法向量为 $chevron.l 3, -7, 2 chevron.r$。
所以切平面的方程应为
$ 3 x - 7 y + 2 z = k $
其中 $k$ 是某个数。
要经过 $(3,7,10)$，我们取 $k = 3 dot 3 - 7 dot 7 + 2 dot 10 = - 20$。
因此最终答案是 $ #boxed[$ 3 x - 7 y + 2 z = - 20 $]. $

/*
== @exer-sphere-avg-distance 的解答（球面平均距离）

#recall-thm(<exer-sphere-avg-distance>)

我们又需要 @sec-offset-sphere 中的偏心球面，
但这次球面是空心的，这让情况大不相同。

为建立坐标系，我们令 $A = (0,0,0)$，
并把球面 $cal(S)$ 看作曲面 $x^2 + y^2 + (z-1)^2 = 1$。
如果使用球坐标，那么 $cal(S)$ 由那些满足
$ 0 <= theta < 2 pi , quad 0 <= phi.alt <= pi / 2 , quad rho = 2 cos phi. $
的点组成。
这与 @sec-offset-sphere 中的方程相同，
只是现在我们有 $rho = 2 cos phi$ 而不是 $0 <= rho <= 2 cos phi$，
因为 $cal(S)$ 是空心的，不是一个三维区域。

于是，我们得到偏心球面如下一个参数化：
$ bf(r)(phi, theta)
  &= (rho sin phi cos theta, rho sin phi sin theta, rho cos theta) \
  &= (2 cos phi sin phi cos theta, 2 cos phi sin phi sin theta, 2 cos phi cos phi). $
而我们要积的函数是
$ lr(|P A|) = rho = 2 cos phi. $

……哎呀这太恶心了。
我想按对称性，我们应该对经过 A 点的那个大圆来做这道题，
但那样就违背了把它放进标量积分这一节的初衷。
*/


== @exer-surface-area-paraboloid 的解答（抛物面的表面积）

#recall-thm(<exer-surface-area-paraboloid>)

曲面 $cal(S)$ 由
$ bf(r) (x , y) = vec(x ,y ,z) = vec(x ,y ,x^2 + y^2) $
参数化，其中 $(x , y)$ 位于圆盘 $x^2 + y^2 <= 1$ 内。
计算 $bf(r)$ 关于
$x$ 与 $y$ 的偏导数：
$ frac(partial bf(r), partial x) &= vec((partial x) / (partial x) ,(partial y) / (partial x) ,(partial z) / (partial x)) = vec(1 ,0 ,2 x) \
  frac(partial bf(r), partial y) &= vec((partial x) / (partial y) ,(partial y) / (partial y) ,(partial z) / (partial y)) = vec(0 ,1 ,2 y). $
因此，叉积 $frac(partial bf(r), partial x) times frac(partial bf(r), partial y)$ 为：
$ frac(partial bf(r), partial x) times frac(partial bf(r), partial y)
  &= (0 dot 2 y - 1 dot 2 x) ee_1 - (1 dot 2 y - 0 dot 2 x) ee_2 + (1 dot 1 - 0 dot 0) ee_3 \
  &= vec(-2x, -2y, 1). $
因此这个叉积的模长为：
$ lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) = sqrt((- 2 x)^2 + (- 2 y)^2 + (1)^2) = sqrt(4 x^2 + 4 y^2 + 1). $

因此，所讨论曲面的表面积为
$ op("曲面面积")(cal(S)) &= integral.double_(x^2 + y^2 <= 1) lr(|frac(partial bf(r), partial x) times frac(partial bf(r), partial y)|) dif x dif y \
  &= integral.double_(x^2 + y^2 <= 1) sqrt(4 x^2 + 4 y^2 + 1) dif x dif y $
由于圆对称性，改用极坐标比较方便；我们写出
$ op("曲面面积")(cal(S)) &= integral_(theta=0)^(2 pi) integral_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r dif theta \
  &= (integral_(theta=0)^(2 pi) dif theta) (integral_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r). $
关于 $r$ 的积分可以通过如下 $u$-代换计算
$ u := 4 r^2 + 1 ==> dif u = 8 r dif r ==> r dif r = (dif u) / (8) $
所以
$ integral_(r=0)^1 sqrt(4 r^2 + 1) dot r dif r &= integral_(u=1)^5 (sqrt(u)/8) dif u \
  &= 1/8 integral_1^5 sqrt(u) dif u = [1 / 8 dot 2 / 3 u^(3 \/ 2)]_(u=1)^5
  = 1 / 12 (5^(3 \/ 2) - 1^(3 \/ 2)) \
  &= 1 / 12 (5 sqrt(5) - 1). $
当然 $integral_(theta=0)^(2 pi) dif theta = 2pi$。
因此答案是 $ #boxed[$ frac(5 sqrt(5) - 1, 6) pi $]. $

== @exer-archimedes 的解答（阿基米德帽盒定理）

#recall-thm(<exer-archimedes>)

圆柱部分的面积很直接，不需要微积分：
它是一个底面周长为 $2 pi$、
高为 $b - a$ 的圆柱，所以表面积为
$ 2 pi (b-a). $
因此问题的主要部分是要证明 @fig-surfcross-archimedes 中球的蓝色部分
表面积相同。

只需解决 $0 <= a <= b <= 1$ 的情形就足够了。
（如果 $a$ 与 $b$ 都为负，那么你可以用反射的论证。
而如果 $a < 0 < b$，那么应当沿球的赤道
（即 $z = 0$）把表面积分成两部分；再把它们加起来。）

这个计算中我们使用球坐标
（感谢 Catherine Xu 指出这个做法）。
取 $R = 1$，
我们的区域是 $phi in [cos^(-1)(b), cos^(-1)(a)]$，$theta in [0,2pi]$。
于是
$ op("曲面面积")(cal(S))
  &= integral_(theta = 0)^(2 pi) integral_(phi = cos^(-1)(b))^(cos^(-1)(a)) dif S \
  &= integral_(theta = 0)^(2 pi) integral_(phi = cos^(-1)(b))^(cos^(-1)(a)) sin phi dif phi dif theta \
  &= 2 pi dot [-cos(phi)]_(phi = cos^(-1)(b))^(cos^(-1)(a)) \
  &= 2 pi dot (b-a). $

#h3[不使用球坐标的另一种更长做法]

如果你讨厌球坐标，
也可以采用 @sec-surf-grad-magic 中的计算。
在那一节中，我们把球面看作 $g(x,y,z) = x^2+y^2+z^2 = 1$ 的等值面，
从而算出了单位半球面的表面积，
所用的公式是
$ (nabla g) / (partial g slash partial z) = lr(chevron.l 2x, 2y, 2z chevron.r) / (2z)
  = lr(chevron.l x/z, y/z, 1 chevron.r). $
由此推导出
$ op("曲面面积")("半球") = integral.double_(x^2+y^2<=1) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
对于阿基米德帽盒定理，积分本身保持不变；
变化在于：我们不再沿整个 $x^2+y^2 <= 1$ 积分
（那会给出半球面的表面积），
而是改为沿圆环积分
$ 1-b^2 <= x^2 + y^2 <= 1-a^2. $
确实，这就是 @fig-surfcross-archimedes 中表面积在 $x y$ 平面上的投影。
（确实，底部圆盘的半径是 $sqrt(1-a^2)$，顶部圆盘的半径是 $sqrt(1-b^2)$。）

回到积分，我们要求的球面表面积因此为
$ S = integral.double_(1-b^2 <= x^2+y^2 <= 1-a^2) 1/sqrt(1-(x^2+y^2)) dif x dif y. $
现在我们只需重做 @sec-surface-area-explanation 中的计算，
只作细微修改。
我们用极坐标把它化为
$ S &= integral_(theta=0)^(2pi) integral_(r=sqrt(1-b^2))^(sqrt(1-a^2)) 1/(sqrt(1-r^2)) (r dif r dif theta) \
  &= (integral_(theta=0)^(2pi) dif theta) (integral_(r=sqrt(1-b^2))^(sqrt(1-a^2)) r/(sqrt(1-r^2)) dif r). $
左边的积分是 $2pi$。
对于内层积分，使用 $u$-代换 $u=1-r^2 ==> (dif u) / (dif r) = -2r$，得到
$ integral_(r=sqrt(1-b^2))^(sqrt(1-a^2)) r/(sqrt(1-r^2)) dif r
  = integral_(u=b^2)^(a^2) -1/2 u^(-1/2) dif u
  = integral_(u=a^2)^(b^2) 1/2 u^(-1/2) dif u
  = [u^(1/2)]_(u=a^2)^(b^2) = b-a. $
这样我们就同样得到所需的 $  S = 2 pi (b - a) $。
