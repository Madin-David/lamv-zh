#import "@local/evan-zh:1.0.0":*

= 通量的捷径：散度定理 <ch-divthm>

== [TEXT] 散度定理

还记得当初我们学格林定理的时候吗，
我们可以把二维标量通量（它是一个_线积分_）
转化为面积分：
$ underbrace(integral.cont_(cal(C)) (bf(F) dot bf(n) dif s), = integral.cont_(cal(C)) (-q dif x + p dif y))
  = underbrace(integral.double_(cal(R)) nabla dot bf(F) dif A,
    = integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A). $
这很好，因为参数化很烦人，而直接算面积分要简单得多。
一般来说，如果你还留着那张海报，绿色的图更容易处理。

散度定理能让你做同样的事情，
把一个通量的曲面积分
（也就是那个可怕的_曲面积分_，
最近几周一直缠着你不放）
转化为体积分。
而这收益更大——不用参数化，不用叉积表，等等。

#figure(
  box(image("figures/divthm-cut.svg", width: auto), stroke: 1pt),
  caption: [我们海报 @poster-stokes 中散度定理所对应的高亮箭头。],
)

结果如下：

#memo(title: [记住：散度定理])[
  设一个闭曲面 $cal(S)$ 包围一个紧的立体 $cal(T)$，
  且 $bf(F)$ 在 $cal(T)$ 中处处有定义。
  那么
  $ underbrace(integral.surf_(cal(S)) bf(F) dot bf(n) dif S,
    = integral.double_(cal(R)) bf(F)(bf(r)(u,v)) dot
    ((partial bf(r))/(partial u) times (partial bf(r))/(partial v)) dif u dif v)
    = underbrace(integral.triple_(cal(T)) nabla dot bf(F) dif V,
    = integral.triple_(cal(T)) ((partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z)) dif V). $
]

我悄悄塞进来一个新符号 $integral.surf_(cal(S))$，但多出来的那个圈和之前是类似的。
就像 $integral.cont_(cal(C))$ 是在提醒 $cal(C)$ 是一条闭曲线一样：
#definition(title: [$integral.surf$ 的定义])[
  $integral.surf_(cal(S))$ 的意思是“$integral.double_(cal(S))$，但额外加了一个可有可无的提醒，表示 $cal(S)$ 是闭曲面”。
  （这个提醒是可选的，也就是说，即使 $cal(S)$ 是闭合的，你也没有义务把它加上。）
]
另外注意，有一处小字要求：$cal(T)$ 应当是紧的，
也就是说，它在任何方向上都不要延伸到无穷远。

#remark(title: [注：“闭曲面”=“不漏水”])[
  如果你不清楚“闭曲面”是什么意思，
  可以记住这样一幅图：“不漏水”。也就是说，
  你可以想象往 $cal(S)$ 的内部灌水
  （那部分就是体积 $cal(T)$），而水不应该漏出来。
  所以下面这些_不是_闭曲面：

  - 半球的曲面部分（例如没有盖的碗）
  - 圆柱的曲面部分（例如吸管）

  但下面这些是闭曲面：

  - 包含两个底面的圆柱（例如水瓶）
  - 球面
  - 长方体的六个面

]

我们现在可以直接进入例题了！

#sample[
  给定 $R > 0$。
  计算向量场
  $bf(F) (x , y , z) = vec(x , y , z)$ 穿过
  由 $x^2 + y^2 + z^2 = R^2$ 定义的球面闭曲面 $cal(S)$（定向朝外）
  的通量，使用散度定理。
]

#soln[
  球面 $cal(S)$ 包围一个半径为 $R$ 的球体 $cal(T)$。
  散度由下式给出：
  $ nabla dot bf(F) = (partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z) = 1 + 1 + 1 = 3 $
  于是答案为
  $ integral.triple_(cal(T)) nabla dot bf(F) dif V = integral.triple_(cal(T)) 3 dif V = 3 op("体积")(cal(S)) = 3 dot 4/3 pi R^3 =
    #boxed[$ 4 pi R^3 $]. #qedhere $
]

#remark(title: [注：与球面表面积的联系])[
  这也是我们用表面积技巧做的第一个例题，
  当时我们发现答案是 $R dot op("曲面面积")(cal(S))$，它同样等于 $4 pi R^3$。

  其实，换个说法：
  如果你知道球的体积是 $4/3 pi R^3$ 以及散度定理，
  那么表面积技巧就能让你推导出表面积的公式 $4 pi R^2$。
]

#warning(title: [警告：当心 $bf(F)$ 没有定义的点])[
  你需要小心：只有当力在整个立体 $cal(T)$ 上确实有定义时，
  才能应用散度定理！
  下面是一个可能出错的例子。

  仍然设 $cal(S)$ 表示半径为 $R$ 的球面 $x^2+y^2+z^2=R^2$。
  设 $bf(G)$ 是位于原点的点质量 $m$ 所产生的万有引力。
  上一章我们算出了
  $ integral.double_(cal(S)) bf(G) dot bf(n) dif S = - 4 pi G m $
  用的是表面积技巧。

  然而，如果你去计算散度 $nabla dot bf(G)$，
  你会发现它在每一点都是_零_——除了原点，
  在原点处 $bf(G)$ 没有定义，因为引力导致了除以零。
  （见 @exer-gravity-div1。）
  如果你盲目地应用散度定理，没有注意到原点处的问题，
  就会得到错误的答案 $integral.triple_(cal(T)) 0 dif V = 0$，
  而不是正确答案 $-4 pi G m$。
  （话虽如此，安全的使用方式见 @exer-gravity-div2。）
]

#sample[
  给定 $a > 0$。
  计算向量场
  $bf(F) (x , y , z) = vec(x^2 , y^2 , z^2)$ 穿过
  由 $0 <= x , y , z <= a$ 围成的立方体 $cal(S)$ 的闭曲面
  的通量，使用散度定理。
]
#soln[
  散度为
  $ nabla dot bf(F) = (partial) / (partial x) (x^2) + (partial) / (partial y) (y^2) + (partial) / (partial z) (z^2) = 2 x + 2 y + 2 z. $
  因此通量化为
  $ integral.triple_(cal(T)) (2 x + 2 y + 2 z) dif V
    = 2 integral.triple_(cal(T)) x dif V + 2 integral.triple_(cal(T)) y dif V + 2 integral.triple_(cal(T)) z dif V. $
  由于立方体的对称性：
  $ integral.triple_(cal(T)) x dif V = integral.triple_(cal(T)) y dif V = integral.triple_(cal(T)) z dif V = a/2 dot op("体积")(cal(T)) = a^4 / 2. $
  如果你看不出这个对称性，也可以直接显式计算
  $ integral.triple_(cal(T)) x dif V
    = (integral_(x=0)^a x dif x) (integral_(y=0)^a dif y) (integral_(z=0)^a dif z)
    = a^2/2 dot a dot a = a^4/2. $
  无论如何，我们得到的答案是
  $ 2 dot a^4/2 + 2 dot a^4/2 + 2 dot a^4 /2 = #boxed[$ 3a^4 $]. #qedhere $
]

#sample[
  计算向量场
  $bf(F) (x , y , z) = vec(y z , x z , x y)$
  穿过由 $x^4 + (y-5)^6 + z^8 = 2025$ 定义的闭曲面 $cal(S)$ 的通量。
]
#soln[
  曲面 $cal(S)$ 很难描述，但它包围着_某个_立体 $cal(T)$。
  不过，如果你去计算散度，会发现它是
  $ nabla dot bf(F) = (partial) / (partial x) (y z) + (partial) / (partial y) (x z) + (partial) / (partial z) (x y)
    = 0 + 0 + 0 = 0. $
  所以立体 $cal(T)$ 到底是什么根本无关紧要；答案就是
  $ integral.triple_(cal(T)) 0 dif V = #boxed[$ 0 $]. #qedhere $
]


#sample[
  计算向量场
  $bf(F) (x , y , z) = vec(x y , y z , z x)$ 穿过
  由抛物面 $z = x^2 + y^2$ 及其圆形底面 $z = 0$（其中 $x^2 + y^2 <= 1$）
  所构成的闭曲面 $cal(S)$ 的通量。
]

#soln[
  设 $cal(T)$ 表示 $cal(S)$ 所包围的区域。
  散度由下式给出：
  $ nabla dot bf(F) = (partial) / (partial x) (x y) + (partial) / (partial y) (y z) + (partial) / (partial z) (z x) = y + z + x $

  区域 $cal(T)$ 由 $z = x^2 + y^2$ 与 $z = 0$ 围成，且满足 $x^2 + y^2 <= 1$。
  所以散度定理意味着我们需要计算
  $ integral.double_(x^2+y^2 <= 1) integral_(z=0)^(x^2+y^2) (x+y+z) dif z dif x dif y. $
  自然地，这最好用柱坐标来做。
  写出 $x = r cos theta$ 与 $y = r sin theta$，并记住
  $ dif x dif y dif z = dif V = r dif r dif theta dif z $
  那么它变成
  $ integral_(r=0)^1 integral_(theta=0)^(2 pi) integral_(z=0)^(r^2) r (r cos theta + r sin theta + z) dif z dif theta dif r. $

  但含 $theta$ 的那些积分由对称性都会等于零。
  例如，第一项是
  $ integral_(r=0)^1 integral_(theta=0)^(2 pi) integral_(z=0)^(r^2) r^2 cos theta dif z dif r dif theta
    = (integral_(r=0)^1 integral_(z=0)^(r^2) r^2 dif z dif r) underbrace((integral_(theta=0)^(2 pi) cos theta dif theta), =0)
    = 0. $
  类似地，$r sin theta$ 的贡献同样是零。
  于是我们只剩下
  $ integral_(r=0)^1 integral_(theta=0)^(2 pi) integral_(z=0)^(r^2) r z dif z dif theta dif r
    = (integral_(r=0)^1 integral_(z=0)^(r^2) r z dif z dif r) (integral_(theta=0)^(2pi) dif theta). $
  显然 $integral_(theta=0)^(2pi) dif theta = 2pi$。
  这个二重积分可以算作
  $ integral_(r=0)^1 r integral_(z=0)^(r^2) z dif z dif r
    = integral_(r=0)^1 r dot [z^2/2]_(z=0)^(r^2) dif r
    = integral_(r=0)^1 r^5/2 dif r
    = [r^6/12]_(r=0)^1 = 1/12. $
  因此最终答案是
  $  1/12 dot 2 pi = #boxed[$ pi / 6 $]. #qedhere $
]

== [SIDENOTE] 一张说明散度定理为何成立的图

这幅图其实和 @sec-2dflux-explain 中的 @fig-2dflux-explain 完全一样，
也就是我们讲二维通量的格林定理时用的那幅图！
散度仍然画成绿色的爆炸。
唯一的变化在于维数：

- 对于通量的格林定理，我们有一条一维路径（紫色方块）包围一个二维区域，
  该区域被分成许多灰色小方块。
- 对于散度定理，我们有一个二维曲面（紫色方框）包围一个三维区域，
  该区域被分成许多灰色小立方体。

而剩下的类比也照样成立：
所有内部的绿色箭头都相互抵消，只剩下那些直接顶在
立方体紫色面上的箭头，于是我们就得到了想要的通量积分。

== [RECAP] 求通量的所有方法

下面是求通量的完整方法，并附上我们讲过的两个捷径。

#recipe(title: [求通量的方法（含捷径）])[
  设我们需要计算 $bf(F)$ 穿过曲面 $cal(S)$ 的通量。

  1. 如果 $cal(S)$ 是一个封闭区域，就用散度定理来避免参数化：
    $ integral.surf_(cal(S)) bf(F) dot bf(n) dif S
      = underbrace(integral.triple_(cal(T)) nabla dot bf(F) dif V,
      = integral.triple_(cal(T)) ((partial p) / (partial x) + (partial q) / (partial y) + (partial r) / (partial z)) dif V). $
  2. 如果 $bf(F) dot bf(n)$ 恰好处处都等于同一个常数 $c$
    （如 @sec-flux-to-surf 所述），
    那么就输出 $c$ 乘以 $cal(S)$ 的表面积，即
    $ integral.surf_(cal(S)) bf(F) dot bf(n) dif S = c op("曲面面积")(cal(S)). $
  3. 否则，就退回到 @sec-recipe-flux-param 中描述的参数化方法。
    这里再简要复述一遍：
    1. 求出叉积 $(partial bf(r))/(partial u) times (partial bf(r))/(partial v)$，
      可以从 @table-surfcross-2 查表得到，也可以手算，
      其中 $bf(r) : cal(R) -> RR^3$ 是曲面 $cal(S)$ 的一个参数化。
    2. 如有必要，把叉积取反，使其与题目中指定的曲面定向一致。
    3. 计算点积 $bf(F) dot ((partial bf(r))/(partial u) times (partial bf(r))/(partial v))$。
    4. 用任意一种二重积分方法在区域 $cal(R)$ 上积分。

]

== [TEXT] 高级技巧：密封区域

这是 @sec-green-seal-region 的三维版本：
有些情况下，如果你有一个并不闭合的曲面 $cal(S)$，
你可以通过给曲面补上一部分来把它密封起来。
你可以在脑海里想象你有一个碗之类的东西，
然后你在碗上盖一层保鲜膜。

#sample[
  设向量场 $bf(F)$ 由下式定义：
  $ bf(F) (x,y,z) = chevron.l x + tan z, y + e^z, 1 chevron.r. $
  考虑由方程
  $ x^2 + y^2 + z^2 = 1 quad upright("with") quad z >= 0 $
  定义的半球面 $cal(S)$，定向朝外。
  计算 $bf(F)$ 穿过 $cal(S)$ 的通量。
]

#figure(
  image("figures/divthm-bowl.svg", width: auto),
  caption: [用盖子把一个碗密封起来。就像用微波炉加热食物，只不过这个碗是倒扣的。],
) <fig-divthm-bowl>


#soln[
  我们脑海中的图景是 $cal(S)$ 看起来像一个倒扣的碗。
  所以我们加一个盖子 $cal(S)_"盖面"$，它由圆盘 $z = 0$ 与 $x^2 + y^2 <= 1$ 构成。
  这样就围出了一个立体区域 $cal(T)$，即半径为 $1$ 的半个实心球，
  如 @fig-divthm-bowl 所示。

  $bf(F)$ 的散度是：
  $ nabla dot bf(F) = (partial) / (partial x)(x + tan z) + (partial) / (partial y)(y + e^z)
    + (partial) / (partial z) (1) = 1 + 1 + 0 = 2 $
  它是一个常数。
  所以散度在 $cal(T)$ 上的积分就是
  $ integral.triple_(cal(T)) nabla dot bf(F) dif V = 2 dot op("体积")(cal(T))
    = 2 dot (1/2 dot 4/3 pi dot 1^3) = 4/3 pi. $

  与此同时，$cal(S)_("盖面")$（我们把它定向朝下）是一个平坦曲面，
  所以它的通量积分很好算：
  从 @table-surfcross-2 我们选取 $bf(n) dif S = chevron.l 0, 0, -1 chevron.r$，因此
  $ integral.double_(cal(S)_("盖面")) bf(F) dot bf(n) dif S
    &= integral.double_(x^2+y^2 <= 1) chevron.l x + tan 0, y + e^0, 1 chevron.r dot chevron.l 0,0, -1 chevron.r dif x dif y \
    &= integral.double_(x^2+y^2 <= 1) (-1) dif x dif y = -pi. $

  于是当我们应用散度定理时，得到
  $ underbrace(integral.double_(cal(S)) bf(F) dot bf(n) dif S, "答案")
    + underbrace(integral.double_(cal(S)_("盖面")) bf(F) dot bf(n) dif S, = - pi)
    = underbrace(integral.triple_(cal(T)) nabla dot bf(F) dif V, = 4 / 3 pi). $
  因此，我们得到答案
  $ integral.double_(cal(S)) bf(F) dot bf(n) dif S
    = 4 / 3 pi - (-pi) = #boxed[$ 7 / 3 pi $]. #qedhere $
]

== [EXER] 习题

#exer[
  设 $cal(S)$ 是曲面 $z = e^(x^2+y^2)$ 中满足 $z <= e$ 的部分，
  其法向量定向朝下。
  设 $bf(F)(x,y,z) = chevron.l cos(z^2) - x, sin(z^2) - y, 2z chevron.r$。
  计算 $bf(F)$ 穿过 $cal(S)$ 的通量。
  （推荐做法：密封。）
] <exer-flux-sealing>

#exer[
  设 $cal(S)_1$ 与 $cal(S)_2$ 是两个不相交的闭曲面，
  且 $cal(S)_2$ 包含在 $cal(S)_1$ 的内部。
  把两个曲面都定向朝外。
  设 $O$ 是包含在 $cal(S)_2$ 内部的一点。
  考虑位于 $O$ 处、质量为 $m$ 的点质量所产生的万有引力 $bf(G)$。
  证明
  $ integral.surf_(cal(S)_1) bf(G) dot bf(n) dif S = integral.surf_(cal(S)_2) bf(G) dot bf(n) dif S. $
] <exer-gravity-div2>

#exerstar[
  通过引用散度定理来证明通量形式的格林定理。

  也就是说，设 $bf(F) = vec(p,q)$ 是 $RR^2$ 中的一个向量场，
  而 $cal(C)$ 是一条逆时针包围区域 $cal(R)$ 的闭曲线。
  想办法用散度定理来证明
  $ integral.cont_(cal(C)) bf(F) dot bf(n) dif bf(s)
    = integral.double_(cal(R)) ((partial p) / (partial x) + (partial q) / (partial y)) dif A. $
] <exer-div-to-green>
