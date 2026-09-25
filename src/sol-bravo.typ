#import "@local/evan-zh:1.0.0":*

= Bravo 部习题解答

== @exer-matrix-rotrefl 的解答（旋转与反射）

#recall-thm(<exer-matrix-rotrefl>)

我们计算 $T$ 在基向量
$ee_1 = chevron.l 1,0 chevron.r$ 与 $ee_2 = chevron.l 0,1 chevron.r$ 上的输出。

对 $ee_1$，我们首先得到
$ ee_1 = lr(chevron.l 1,0 chevron.r) -->
  lr(chevron.l cos 30 degree, sin 30 degree chevron.r) = lr(chevron.l sqrt(3)/2, 1/2 chevron.r)
  --> lr(chevron.l 1/2, sqrt(3)/2 chevron.r) = T(ee_1) $
（第一个箭头是旋转，第二个箭头是反射）。

对 $ee_2$，我们得到
$ ee_2 = lr(chevron.l 0,1 chevron.r) -->
  lr(chevron.l cos 120 degree, sin 120 degree chevron.r) = lr(chevron.l -1/2, sqrt(3)/2 chevron.r)
  --> lr(chevron.l sqrt(3)/2, -1/2 chevron.r) = T(ee_2). $

因此，答案是
$ T = #boxed[$ mat(1 slash 2, sqrt(3) slash 2; sqrt(3) slash 2, -1 slash 2) $]. $

另外，也可以把对应逆时针旋转
与关于 $y = x$ 反射的矩阵相乘来得到同样的答案；即
$ T = mat(0,1;1,0) mat(cos 30 degree, cos 120 degree; sin 30 degree, sin 120 degree), $
算出来是同一个结果。
这正好印证了 @sec-matrix-mult 成立：
施加两个变换等同于把它们对应的矩阵相乘。

== @exer-basis-birthday 的解答（生日）

#recall-thm(<exer-basis-birthday>)

$bf(v)_1$ 与 $bf(v)_2$ 都不为零，
而且对几乎所有人来说，这两个向量不会互为倍数。
所以对大多数人来说，答案是张成为 $#boxed[$RR^2$ 的全部]$。

为了找出一个两个向量线性相关的 K-pop 偶像
（从而得到“直线”这个答案），
我们需要找到一份 K-pop 生日数据库，并且知道该从哪里入手。
大致可以采取两种策略：

- 对于 2000 年之前出生的偶像，唯一可行的年份是 1995
  （因为 $19$ 是大于 $12$ 的素数，后两位必须是 $19$ 的倍数）。
  可行的日期是 1 月 5 日、2 月 10 日、3 月 15 日、
  4 月 20 日、5 月 25 日和 6 月 30 日。
  例如，前男子组合 Snuper 的 Jo Sangho 出生于 1995 年 2 月 10 日：
  $ bf(v)_1 = vec(02,10) " 与 " bf(v)_2 = vec(19,95). $

- 对于 2000 年之后出生的偶像，值得一试的年份是 2004 或 2005。
  （2004 年有 5 月 1 日和 10 月 2 日；2005 年有 4 月 1 日、8 月 2 日、12 月 3 日。）
  例如，KJRGL 的 Machida Riku 出生于 2004 年 10 月 2 日：
  $ bf(v)_1 = vec(10,02) " 与 " bf(v)_2 = vec(20,04). $

== @exer-basis-perpbasis 的解答（最多有多少个互相垂直的向量）

#recall-thm(<exer-basis-perpbasis>)

这些向量都必须位于一个与 $bf(v)$ 垂直的超平面中，
这是一个 $#boxed[$ 4 $]$ 维空间。
（除了 $bf(v)$ 不是零向量之外，向量 $bf(v)$ 的各分量都无关紧要。）

== @exer-eigen-warmup 的解答（四个二阶矩阵）

#recall-thm(<exer-eigen-warmup>)

只需照着方法做即可。
答案如下。

/ 矩阵 $A = mat(1, 1; 1, 1)$:
  为求特征值 $lambda$，我们解特征方程：
  $ det (A - lambda I) = 0, $ 其中 $I$ 是单位矩阵。

  $ A - lambda I &= mat(1 - lambda, 1; 1, 1 - lambda) \
    det (A - lambda I) &= (1 - lambda)^2 - (1) (1) = lambda^2 - 2 lambda  = lambda(lambda-2). $
  因此，特征值为：$ lambda_1 = 0 , quad lambda_2 = 2 $

  现在计算特征向量：

  - *当 $lambda_1 = 0$ 时*：
    $ (A - 0 I) bf(v) &= A bf(v) = mat(1, 1; 1, 1) vec(x, y) = vec(x + y, x + y) = bf(0) \
      x + y &= 0 ==> y = - x $
    因此，对应 $lambda_1 = 0$ 的特征向量
    是 $ bf(v)_1 = vec(1, - 1). $ 的所有倍数。

  - *当 $lambda_2 = 2$ 时*：
    $ (A - 2 I) bf(v) &= mat(- 1, 1; 1, - 1) vec(x, y) = vec(- x + y, x - y) = bf(0) \
      - x + y &= 0 ==> y = x $
    因此，对应 $lambda_2 = 2$ 的特征向量
    是 $ bf(v)_2 = vec(1, 1). $ 的所有倍数。

/ 矩阵 $B = mat(5, 1; 2, 4)$:
  解
  $ 0 = det (B - lambda I) = detmat(5 - lambda, 1; 2, 4 - lambda)
    = lambda^2 - 9 lambda + 18 = (lambda-6)(lambda-3). $
  因此，特征值为：
  $ lambda_1 = 6 , quad lambda_2 = 3. $

  现在计算特征向量：

  - *当 $lambda_1 = 6$ 时*：
    $ (B - 6 I) bf(v) &= mat(- 1, 1; 2, - 2) vec(x, y) = vec(- x + y, 2 x - 2 y) = bf(0) \
      - x + y &= 0 ==> y = x $
    因此，对应 $lambda_1 = 6$ 的特征向量是
    $ bf(v)_1 = vec(1, 1). $ 的所有倍数。

  - *当 $lambda_2 = 3$ 时*：
    $ (B - 3 I) bf(v) &= mat(2, 1; 2, 1) vec(x, y) = vec(2 x + y, 2 x + y) = bf(0) \
      2 x + y &= 0 ==> y = - 2 x $
    因此，对应 $lambda_2 = 3$ 的特征向量是
    $ bf(v)_2 = vec(1, - 2). $ 的所有倍数。

/ 矩阵 $C = mat(9, 0; 0, 9)$:
  注意矩阵 $C$ 实际上是单位矩阵的 $9$ 倍：
  因此唯一的特征值是 $9$，而且事实上 $RR^2$ 中_每一个_向量都是特征向量。

/ 矩阵 $D = mat(6, 1; 0, 6)$:
  解
  $ det (D - lambda I) = detmat(6 - lambda, 1; 0, 6 - lambda) = (6 - lambda)^2 - (1) (0) = (6 - lambda)^2 = 0 $
  因此，唯一的特征值是：
  $ lambda = 6. $

  为求特征向量，解
  $ (D - 6 I) bf(v) = mat(0, 1; 0, 0) vec(x, y) = vec(y, 0) = bf(0) ==> y = 0. $
  因此，特征向量满足 $y = 0$。
  所以特征向量是形如以下的所有非零向量：
  $ bf(v) = vec(x, 0). $

== @exer-eigen-example 的解答（特征值为 5 和 7）

#recall-thm(<exer-eigen-example>)

我们随意取两个分量都非零的向量作为特征向量，比如：
$ bf(v) = vec(1,1) \
  bf(w) = vec(1,-1). $
然后我们找一个矩阵 $T$，使得
$ T vec(1,1) &= vec(5,5) \
  T vec(1,-1) &= vec(7,-7). $
此时可以暴力求解一个含四个未知量的方程组，
其中 $T = mat(a,b;c,d)$。
另一方面，更经济的做法是把这两个方程相加，得到
$ T vec(2,0) &= vec(12,-2) ==> T(ee_1) = vec(6,-1) $
而如果改为相减，则得到
$ T vec(0,2) &= vec(-2,12) ==> T(ee_2) = vec(-1,6). $
这给出一个可行的矩阵：
$ T = #boxed[$ mat(6,-1;-1,6) $]. $

而由构造方式我们已经知道特征向量：
它们是 $bf(v)$ 的倍数（对应 $lambda = 5$），
以及 $bf(w)$ 的倍数（对应 $lambda = 7$）。

== @exer-eigen-6x6 的解答（六阶矩阵的特征向量）

#recall-thm(<exer-eigen-6x6>)

基本想法是，我们完全可以靠手算，
不必借助之前见过的行列式。
具体来说，假设我们有一个候选的
非零特征向量 $bf(v) = chevron.l x_1, x_2, x_3, x_4, x_5, x_6 chevron.r$，
其对应特征值为 $lambda$。
那么我们期望
$ M bf(v) = vec(5x_1, -9x_2, 5x_3, 0, 8x_5, x_5 + 8x_6) =
  vec(lambda x_1, lambda x_2, lambda x_3, lambda x_4, lambda x_5, lambda x_6) = lambda bf(v). $
令各分量相等，我们得到六个方程，依次表达如下：

1. 要么 $x_1 = 0$，要么 $lambda = 5$。
2. 要么 $x_2 = 0$，要么 $lambda = -9$。
3. 要么 $x_3 = 0$，要么 $lambda = 5$。
4. 要么 $x_4 = 0$，要么 $lambda = 0$。
5. 要么 $x_5 = 0$，要么 $lambda = 8$。
6. 我们有 $(lambda - 8) x_6 = x_5$。
  特别地，若 $x_6 != 0$，则要么 $lambda = 8$，要么 $x_5 != 0$，
  但上一项告诉我们，$x_5 != 0$ 无论如何都会迫使 $lambda = 8$。

由于 $x_i$ 中至少有一个应当非零
（因为我们总是忽略 $bf(v) = bf(0)$），
由此可得所有可能的特征值正是 $ #boxed[$ lambda = -9, 0, 5, 8 $] $。
并且我们可以从上面六个编号项中直接读出相应的特征向量：

- 当 $lambda = -9$ 时，特征向量是 $chevron.l 0, x_2, 0, 0, 0, 0 chevron.r$，其中 $x_2$ 任取。
- 当 $lambda = 0$ 时，特征向量是 $chevron.l 0, 0, 0, x_4, 0, 0 chevron.r$，其中 $x_4$ 任取。
- 当 $lambda = 5$ 时，特征向量是 $chevron.l x_1, 0, x_3, 0, 0, 0 chevron.r$，其中 $x_1$ 与 $x_3$ 任取。
- 当 $lambda = 8$ 时，特征向量是 $chevron.l 0, 0, 0, 0, 0, x_6 chevron.r$，其中 $x_6$ 任取。
  （上面最后一个方程在 $lambda = 8$ 时蕴含 $x_5 = 0$。）

== @exer-eigen-power 的解答（计算 $M^(20)$）

#recall-thm(<exer-eigen-power>)

我们将沿用 @sec-matrix-power 中的思路：
找出 $M$ 的一组特征向量基，并用它来计算 $M$ 的幂。

和通常一样，为求 $M$ 的特征值，我们处理
$ 0 = det (M - lambda I) = detmat(4-lambda, 3; 6, 7-lambda)
  = (4-lambda)(7-lambda)-18 = lambda^2 - 11 lambda + 10 = (lambda-1)(lambda-10) $
所以特征值是 $lambda_1 = 1$ 与 $lambda_2 = 10$。
我们再来求相应的特征向量。

- 对特征值 $lambda_1 = 1$，我们需要
  $ mat(4-1, 3; 6, 7-1) vec(x,y) = vec(0,0) <==> x + y = 0 <==> y=  -x $
  所以特征向量是 $bf(v)_1 = vec(1, -1)$ 的所有倍数。
- 对特征值 $lambda_2 = 10$，我们需要
  $ mat(4-10, 3; 6, 7-10) vec(x,y) = vec(0,0) <==> -2x + y = 0 <==> y = 2x $
  所以特征向量是 $bf(v)_2 = vec(1, 2)$ 的所有倍数。

因此，在取 $20$ 次幂时，我们应当有
$ M^(20) bf(v)_1 = 1^(20) bf(v)_1 &==> M^(20) vec(1, -1) = vec(1, -1) \
  M^(20) bf(v)_2 = 10^(20) bf(v)_2 &==> M^(20) vec(1, 2) = vec(10^(20), 2 dot 10^(20)). $
因此，我们求出了 $M^(20)$ 在两个线性无关向量上的作用！
正如我们在 @sec-matrix-power 中所证明的，
这意味着我们也应当能够还原出 $M^(20)$ 在基向量上的作用。

为得到 $M^(20)$ 的第一列，我们写出
$ M^(20) (ee_1) &= M^(20) (2/3 vec(1,-1) + 1/3 vec(1, 2))
  = 2/3 M^(20) vec(1,-1) + 1/3 M^(20) vec(1,2)
  = vec((2 + 10^(20)) slash 3, (-2 + 2 dot 10^(20)) slash 3) \
  &= vec(100000000000000000002 slash 3, 199999999999999999998 slash 3)
  = vec(33333333333333333334, 66666666666666666666) $
这正是第一列所需要的结果。

为得到 $M^(20)$ 的第二列，我们写出
$ M^(20) (ee_2) &= M^(20) (1/3 vec(1,2) - 1/3 vec(1,-1))
  = 1/3 M^(20) vec(1,2) - 1/3 M^(20) vec(1,-1)
  = vec((10^(20) - 1) slash 3, (2 dot 10^(20) + 1) slash 3) \
  &= vec(99999999999999999999 slash 3, 200000000000000000001 slash 3)
  = vec(33333333333333333333, 66666666666666666667) $
这正是第二列所需要的结果。
解答完毕。
