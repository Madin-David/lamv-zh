#import "@local/evan-zh:1.0.0":*
#let poonen = link("https://math.mit.edu/~poonen/notes02.pdf")[Poonen 讲义]
#let epigraph(quote_text, attribution: none) = {
  set text(size: 10pt)
  pad(left: 35%)[
    #emph(quote_text)
    #line(length: 100%)
    #if attribution != none { align(right)[--- #attribution] }
  ]
}

#show: evan.with(
  title: [线性代数与多元微积分],
  subtitle: [MIT 18.02 课程讲义（2024 年秋季）],
  author: "Evan Chen",
  date: datetime.today(),
  report-style: true,
)

#rect(stroke: 2pt)[#image("lamv-cover-art.png", width: 100%)]

#pagebreak()

#align(center)[
  #text(size: 0.85em)[
    原著：Evan Chen，#link("https://web.evanchen.cc/textbooks/lamv.pdf")[*Linear Algebra and Multivariable Calculus*] \
    中文翻译版（仅供个人学习使用） \
    原书采用 #link("https://creativecommons.org/licenses/by-nc-sa/4.0/")[CC BY-NC-SA 4.0] 许可协议，\
    本译本以相同协议发布。
  ]
]

#pagebreak()

#toc

#pagebreak()

#include "src/preface.typ"
#pagebreak()
#include "src/tsafe.typ"
#pagebreak()

#part[Alfa 部：向量的线性代数]
#epigraph(attribution: [大卫·福斯特·华莱士《无尽的玩笑》])[
  这是一种非常美国式的病症：把自己完全交托给「工作」这个念头，
  只为换取某种黄铜戒指，而那东西通常意味着别人对你抱有的某种看法。
]
作为对照，Alfa 部大致对应 #poonen 的 §1、§2、§3.9。
#include "src/vectors.typ"
#pagebreak()
#include "src/dot.typ"
#pagebreak()
#include "src/planes.typ"
#pagebreak()
#include "src/cross.typ"
#pagebreak()

#part[Bravo 部：矩阵的线性代数]
#epigraph(attribution: [Serena An《Holding on to Her Words》中 Lydia 的开场白])[
  翻译是一座桥。它能连接两种语言、两个时代、两种文化，
  连接书页与你的心灵，甚至连接两个人之间的空隙。
  翻译意味着反思自己，反思自己与他人的关系。
  这正是我研究中国文学的核心原因。但我花了很多年才意识到这一点。
]
作为对照，Bravo 部大致对应 #poonen 的 §3、§4、§6。
#include "src/matrix.typ"
#pagebreak()
#include "src/basis.typ"
#pagebreak()
#include "src/eigen.typ"
#pagebreak()

#part[Charlie 部：复数复习]
#epigraph(attribution: [#link("https://w.wiki/Tpof")[_Stephen's Sausage Roll_]])[
  博学之人投下长长的影子。
]
作为对照，Charlie 部大致对应 #poonen 的 §11。
#include "src/complex.typ"
#pagebreak()
#include "src/mt1.typ"
#pagebreak()

#part[Delta 部：参数方程支线]
#epigraph(attribution: [《暗杀教室》中的杀老师])[
  大体而言，一个人想要教授某样东西有两个原因：
  要么他想传递自己的成功，要么他想传递自己的失败。
]
作为对照，Delta 部大致对应 #poonen 的 §5 与 §7。
#include "src/param.typ"
#pagebreak()

#part[Echo 部：多元微分]
#epigraph(attribution: [#link("https://www.ams.org/notices/201005/rtx100500608p.pdf")[《数学有什么用？》]，作者 Underwood Dudley])[
  然而，当我站在审判席前——无论是天国的还是别的什么——被要求为一生做出交代时，
  我会骄傲地挺直身子说：「我是数学的管家之一，它在我手中毫发无损。」
  我不会说：「我帮人找到了工作。」
]
作为对照，Echo 部大致对应 #poonen 的 §8 与 §12.1–§12.3。
#include "src/level.typ"
#pagebreak()
#include "src/partial.typ"
#pagebreak()
#include "src/grad.typ"
#pagebreak()
#include "src/antigrad.typ"
#pagebreak()

#part[Foxtrot 部：最优化]
#epigraph(attribution: [Toby Fox《三角符文》中的女王])[
  青少年不过是大号的孩子 #text(size:7pt)[而成年人更是大号的孩子]
]
作为对照，Foxtrot 部大致对应 #poonen 的 §9 与 §12.4–§12.6。
#include "src/minmax.typ"
#pagebreak()
#include "src/regions.typ"
#pagebreak()
#include "src/opt.typ"
#pagebreak()
#include "src/mt2.typ"
#pagebreak()

#part[Golf 部：标量函数的二重积分]
#epigraph(attribution: [《卡尔文与霍布斯》中的卡尔文（1989 年 5 月 3 日）])[
  妈妈说霍布斯不会被偷走，因为他根本不值钱。\
  ……（抽鼻子）可*我*觉得他很珍贵。
]
作为对照，Golf 部对应 #poonen 的 §13.1–§13.5。
#include "src/ipep.typ"
#pagebreak()
#include "src/double.typ"
#pagebreak()
#include "src/chvar.typ"
#pagebreak()
#include "src/polar.typ"
#pagebreak()
#include "src/shorthand.typ"
#pagebreak()

#part[Hotel 部：标量函数的三重积分]
#epigraph(attribution: [#link("https://puzzles.mit.edu/2023/puzzlefactory.place/puzzles/5d-barred-diagramless-with-multiverse-time-travel")[5D Barred Diagramless with Multiverse Time Travel] 的作者说明，作者 Alex Irpan])[
  有些时候，我并不确信这道题应该存在，
  但编辑和测试者鼓励我把它做完，说它「正是我期待在神秘猎题大赛里看到的那种胡说八道」。
  （这道题的幸运后期制作者也想表达他的支持。）希望你们玩得开心！说真的，本来可以糟糕得多。
]
作为对照，Hotel 部对应 #poonen 的 §13.6–13.9 与 §17.1–§17.6。
#include "src/triple.typ"
#pagebreak()
#include "src/sph.typ"
#pagebreak()
#include "src/psurf.typ"
#pagebreak()
#include "src/scalint.typ"
#pagebreak()
#include "src/surfcross.typ"
#pagebreak()

#part[India 部：向量场沿曲线的线积分]
#epigraph(attribution: [EWD 1036，Edsger W. Dijkstra（1988）])[
  我今天想说的是：如果我们真要统计代码行数，
  就不该把它们看作「产出的行数」，而应看作「花掉的行数」：
  当下流行的观念愚蠢到把这个数字记在了账本错误的一侧。
]
作为对照，India 部对应 #poonen 的 §14、§15、§20、§21。
#include "src/vecfield.typ"
#pagebreak()
#include "src/gcd.typ"
#pagebreak()
#include "src/work.typ"
#pagebreak()
#include "src/ftcgreen.typ"
#pagebreak()
#include "src/2dflux.typ"
#pagebreak()
#include "src/lineex.typ"
#pagebreak()
#include "src/mt3.typ"
#pagebreak()

#part[Juliett 部：向量场穿过曲面的通量积分]
#epigraph(attribution: [《弹丸论破》中的黑白熊])[
  每个人都有遗憾，都有想回去改变的事。但我没有！因为我是只熊啊！
]
作为对照，Juliett 部对应 #poonen 的 §17.7、§18、§19、§21。
#include "src/flux.typ"
#pagebreak()
#include "src/divthm.typ"
#pagebreak()
#include "src/badstokes.typ"
#pagebreak()

#part[Kilo 部：练习题]
#epigraph(attribution: [#link("https://cinnamew.itch.io/porcelain-heart")[《Porcelain Heart》]])[
  别傻了，亲爱的。诅咒是不存在的。
]
#include "src/practice.typ"
#pagebreak()

#part[Lima 部：解答]
#epigraph(attribution: [#link("https://mitadmissions.org/discover/life-culture/hacks-tomfoolery-pranks/")[MIT 恶作剧者守则]])[
  蛮力是无能者的最后手段。
]
#include "src/sol-alfa.typ"
#pagebreak()
#include "src/sol-bravo.typ"
#pagebreak()
#include "src/sol-charlie.typ"
#pagebreak()
#include "src/sol-delta.typ"
#pagebreak()
#include "src/sol-echo.typ"
#pagebreak()
#include "src/sol-foxtrot.typ"
#pagebreak()
#include "src/sol-golf.typ"
#pagebreak()
#include "src/sol-hotel.typ"
#pagebreak()
#include "src/sol-india.typ"
#pagebreak()
#include "src/sol-juliett.typ"
#pagebreak()
#include "src/sol-kilo.typ"
#pagebreak()

#part[Mike 部：附录]
#epigraph[
  你们每个人心里都有一点「我想拯救世界」的火苗，这正是你们来到这里、来到大学的原因。
  我想让你们知道：哪怕你只拯救了一个人，那也完全可以；
  而如果那个人就是你自己，同样完全可以。
]
#include "src/appendix.typ"
