#import "@local/evan-zh:1.0.0":*

= 参数化曲面 <ch-psurf>

== [TEXT] 参数化曲面

现在我们转向参数化曲面。
与参数化曲线相比，这需要多一点时间来适应，
因为现在有两个变量而不是一个。

作为对照，请回想早在 @ch-param 中我们参数化曲线时，
你写下记号 $bf(r)(t)$，
并且通常把参数 $t$ 想成"时间"。
于是你可以想象，把_时间轴_当作输入变量，
就能在 $RR^2$ 或 $RR^3$ 中刻划出一条 1D 曲线
$bf(r) : RR -> RR^n$。
再回顾一下 @fig-param-timeline。

相反，对于 $RR^3$ 中的 2D 曲面，我们需要两个变量：
#idea[
  我们将把曲面描述为某个函数
  $bf(r)(u,v) : cal(R) -> RR^3$
  的像，其中 $cal(R)$ 是 $RR^2$ 中的某个区域；见 @fig-psurf-mesh。
]
时间的类比在这里失效了，所以我要换一个类比：
地图上的网格线，就像经线和纬线。
这其实正是我们在 @sec-chvar-transition 中
介绍换元的过渡映射时所用的类比。
唯一的区别在于，在 @sec-chvar-transition 中，
我们用二维的纸画出一个同样生活在二维空间中的古怪区域。
但在参数化曲面时，我们将用二维的纸（表示为区域 $cal(R)$）
画出生活在三维空间中的二维曲面，我们把它记作 $cal(S)$。

#typesig[
  为了强调这里的类型，设 $cal(S)$ 是三维空间中的一个曲面。
  那么要参数化一个 2D 曲面，你需要指定 $RR^2$ 中的一个 2D 区域 $cal(R)$，
  然后写下一个二元函数 $bf(r) : cal(R) -> RR^3$
  $bf(r)(u,v)$，其中 $(u,v)$ 取遍区域 $cal(R)$，
  它覆盖了 $cal(S)$ 中的所有点。
]

#warning[
  这里 $cal(R)$ 是 $RR^2$ 中用于参数化的区域，通常是一个矩形。
  它_不是_要计算表面积的那个曲面 $cal(S)$；
  （对于三维空间中的二维曲面，我们通常更愿意用字母 $cal(S)$，
  这样它看起来就不像一个区域）。
]

@fig-psurf-mesh 给出了这种情况的示意图。
理解这幅图非常重要，所以请花点时间把它消化掉。

#figure(
  image("figures/psurf-mesh.svg", width: auto),
  caption: [
    用制图学说明如何在概念上理解参数化。
    想象一张纸 $cal(R)$ 展示着生活在空间中的曲面 $cal(S)$。
    （在这幅示意图中，$cal(S)$ 可以被描述为一片山脉。）
    纸上的一对 $(u,v)$ 可以类比为经度和纬度；
    它应当标出曲面 $cal(S)$ 上的某个点 $bf(r)(u,v)$。
    因此我们把参数化写成 $bf(r) : cal(R) -> RR^3$，
    并把 $cal(S)$ 与 $bf(r)$ 等同起来。
  ],
) <fig-psurf-mesh>

== [TEXT] 参数曲面的例子

事实上，地球是另一个很好的例子，因为球坐标给出了
一个使用矩形纸张的参数化。

#example(title: [参数化的例子：球形地球])[
  考虑单位球面，即 $x^2 + y^2 + z^2 = 1$。
  由球坐标系给出一个参数化 $bf(r)$：
  $ bf(r) (phi, theta) = (sin phi cos theta , sin phi sin theta , cos phi) $
  其中 $0 <= phi <= pi$，$0 <= theta < 2 pi$。
  也就是说，当 $theta$ 和 $phi$ 取遍这些范围时，
  我们恰好得到球面上的每个点各一次。
  见 @fig-psurf-lonlat。
]

#figure(
  [
    #image("figures/psurf-lonlat1.svg", width: auto)
    #image("figures/psurf-lonlat2.svg", width: auto)
  ],
  caption: [
    考虑单位球；那么参数化
    $bf(r) (phi, theta) = (sin phi cos theta , sin phi sin theta , cos phi)$
    对应于经度和纬度。
    在这幅示意图中，应当把黄色纸张想象成地球的地图，
    地球用绿色画出。
    纸张上的蓝色与红色网格线描出
    地球上的经线和纬线。
    （纸张被旋转过，使 $theta$ 在下方、$phi$ 在左侧，
    以便看起来更自然一些。）
  ],
) <fig-psurf-lonlat>

如果你觉得这似曾相识，那是因为我们在换元时
用了几乎相同的类比——制图学。
地球是圆的，但你仍然可以画出一张矩形的世界地图。
所以我们这里所说的 $bf(r)(u,v)$ 所扮演的角色，
与我们做换元时的过渡映射 $bf(T)$ 相同。
唯一的区别是，在换元中，二维情形下我们有 $bf(T) : RR^2 -> RR^2$，
三维情形下我们有 $bf(T) : RR^3 -> RR^3$。
但对于 $RR^3$ 中曲面的参数化，我们有的是 $bf(r) : RR^2 -> RR^3$。
（也就是说，在换元中我们为 $n$ 维区域作出 $n$ 维的映射，
而这里我们为生活在 $RR^3$ 中的曲面作出 $2$ 维的映射。）

#example(title: [例子：地图印在圆形纸上的半球])[
  在 @fig-psurf-mesh 和 @fig-psurf-lonlat 中我们都用了矩形纸张。
  但我们也可以很容易地使用非矩形的纸张。
  例如，设 $cal(R)$ 是区域 $x^2+y^2 <= 1$，并考虑曲面
  $ bf(r)(x,y) = ( x, y, sqrt(1-(x^2+y^2)) ). $
  那么这就给出了一个_半球_的参数化：
  球面 $x^2+y^2+z^2=1$ 中满足 $z >= 0$ 的部分。
  从图像上看，这相当于从北极俯瞰，
  画出北半球的圆形地图。
  见 @fig-north-hemisphere。
]

#figure(
  image("media/north-hemisphere.svg", width: 11cm),
  caption: [
    地球的北半球，画在一张二维的纸上。
    图片改编自 #link("https://w.wiki/CWcn")[公有领域]。
  ],
) <fig-north-hemisphere>


#remark(title: [注：函数的图像是一类常见的曲面])[
  注意，在我们刚才在 @fig-north-hemisphere 中所做的例子里，
  我们选择了变量名 $x$ 和 $y$ 而不是 $u$ 和 $v$，
  因为它们与 $bf(r)(x,y)$ 的 $x$-分量和 $y$-分量一致，
  这样需要摆弄的不同字母就更少。
  总的来说我们都会这样做：如果我们的参数化_先验地_写作
  $ bf(r)(u,v) = chevron.l u, v, f(u,v) chevron.r $
  其中 $(u,v)$ 取遍某个区域 $cal(R)$，那么我们通常更愿意改用变量名
  $ bf(r)(x,y) = chevron.l x, y, f(x,y) chevron.r $
  来代替。

  这种情况相当常见。
  这类曲面有时被称为函数 $f$ 的*图像*，
  因为你把它们看成 $z = f(x,y)$ 的图像的一部分，
  其中 $f : cal(R) -> RR$ 是某个函数。
  我们马上再给出两个例子。
]

#example(title: [图像的另一个例子：满足 $x,y,z >= 0$ 的平面 $x + 2 y + 3 z = 6$])[
  作为另一个例子，让我们考虑平面 $x + 2 y + 3 z = 6$ 中
  位于第一卦限 $x,y,z >= 0$ 内的部分。
  它画在 @fig-psurf-plane 的右半部分。

  为了参数化它，我们再次使用"图像"的想法：
  我们想象把曲面直接投影到 $x y$-平面（即 $z = 0$）上，
  而我们的纸张就是落在影子里的那些点。
  在这种情况下，我们的区域 $cal(R)$ 是 $x y$-平面中被
  $x,y >= 0$ 和 $x + 2y <= 6$ 截出的部分，如 @fig-psurf-plane 的左半部分所示。
  于是参数化方程恰好由下式给出
  $ bf(r)(x,y) = (x, y, (6-x-2y)/3). $
  也可以选择把区域 $cal(R)$ 也画进三维草图中；
  这就是 @fig-psurf-plane 右半部分中带阴影的底部三角形。
]

#figure(
  image("figures/psurf-plane.svg", width: auto),
  caption: [
    平面 $x+2y+3z=6$ 的一部分，通过投影到 $x y$-平面来参数化。
    因为我们把该平面看成图像，
    所以我们选用字母 $bf(r)(x,y)$ 而不是 $bf(r)(u,v)$。
  ],
) <fig-psurf-plane>


#example(title: [例子：$y z$-平面])[
  考虑 $RR^3$ 中的整个 $y z$ 平面（即满足 $x = 0$ 的点）。
  那么可以用 $bf(r) : RR^2 -> RR^3$ 来参数化它
  （所以我们的纸张 $cal(R) = RR^2$ 是无限的！），其定义方程为
  $ bf(r)(u,v) = (0,u,v). $
  （我想把变量改名为 $bf(r)(y,z) = (0,y,z)$ 本来也说得通，
  但这无关紧要。）
]

== [SIDENOTE] 参数化仍然很灵活

与 @ch-param 中一样，曲面的参数化并不唯一，
你在如何参数化它上有很多灵活性。
例如，对于我们刚才处理的简单 $y z$-平面，
我们给出一个过于复杂的参数化的例子。

我们的纸张将是 $cal(R) = (-pi/2, pi/2) times (-pi/2, pi/2)$
（即边长为 $pi$ 的正方形），
而我们的参数化 $bf(r) : cal(R) -> RR^3$ 由下式定义
$ bf(r)(u,v) = (0, (tan u)^3, log(e^u+5) + tan v). $
这确实是一个有效的参数化：
你可以验证 $y z$-平面中的每个点都恰好在地图上出现一次。
它甚至具有面积有限的区域 $cal(R)$。
但它丑陋到你绝不会想用它。

== [EXER] 习题

#exer[
  考虑由参数化 $bf(r) : RR^2 -> RR^3$ 给出的曲面 $cal(S)$，其定义为
  $ bf(r)(u,v) = chevron.l u-v, u+v, u v chevron.r $
  对 $RR^2$ 中所有的 $(u,v)$ 成立。
  求使点 $P = (2, 8, k)$ 落在 $cal(S)$ 上的实数 $k$。
] <exer-psurf>
