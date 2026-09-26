# 线性代数与多元微积分（中文翻译版）

MIT 18.02《Linear Algebra and Multivariable Calculus》的中文译本。

> 原著：**Linear Algebra and Multivariable Calculus** — Notes from MIT's 18.02 course in fall 2024
> 作者：**Evan Chen**
> **原著仓库：<https://github.com/vEnhance/1802>**
> 原书下载：<https://web.evanchen.cc/textbooks/lamv.pdf>
> 原书许可：**CC BY-NC-SA 4.0**

本仓库是原书的中文翻译（改编作品），从**上述原著仓库**的 Typst 源码翻译而来，
依据原书许可协议以**相同方式**（CC BY-NC-SA 4.0）发布。

---

## 下载

编译好的 PDF 见 **[Releases](../../releases)** 页面（446 页，约 31 MB）：

**<https://github.com/Madin-David/lamv-zh/releases/latest/download/lamv-zh.pdf>**

## 改动说明

依据 CC BY-NC-SA 4.0 的要求，此处说明本译本相对于原著所做的改动：

- **正文**：全书正文由英文译为简体中文。
- **图表标签**：图中原本为英文的标签一并汉化（如 `Unit circle` → `单位圆`）。
- **数学内容**：**未做任何改动**。所有公式、符号、编号与原书逐字符一致。
- **版式**：改用适合中文的字体组合（正文宋体、强调楷体、标题微软雅黑），
  定理环境名、图表编号前缀（图 / 表）等界面文字已中文化。
- **内容**：章节结构、图表、习题与解答均与原书一一对应，未增删。

## 如何构建

需要 [Typst](https://typst.app) 0.15 或更高版本。原书的 `evan` 排版包已针对中文做了适配
（`evan-zh`，随本仓库提供），因此只需安装这一个本地包：

```bash
# 1. 安装 evan-zh 排版包
#    Windows:  %APPDATA%\typst\packages\local\evan-zh\1.0.0\
#    Linux/macOS: ~/.local/share/typst/packages/local/evan-zh/1.0.0/
#    把仓库 tools/evan-zh/ 下的文件放进去即可

# 2. 编译
typst compile lamv-zh.typ
```

图形已随仓库提供编译好的 SVG，因此**无需安装 Asymptote 和 TeX** 即可出书。
只有需要修改图形时，才需要 Asymptote + XeLaTeX（见 `tools/`）。

`evan-zh` 依赖的 `gentle-clues` 等公开包，Typst 会在首次编译时自动下载。

### 目录结构

```
lamv-zh.typ              主文件
src/                     53 个章节（Typst 源码）
  figures/               124 个图形：.asy 源文件 + 编译好的 .svg
  media/                 书中引用的照片等素材
  include/               附录中的示例代码
tools/
  evan-zh/               中文排版包（需按上文安装到 typst packages 目录）
  build_figures.sh       从 .asy 重新生成图形
  check_labels.py        检查图内是否残留英文
  release.sh             编译并发布 PDF 到 Releases
LICENSE                  CC BY-NC-SA 4.0
```

## 关于第三方素材

原书正文与插图整体采用 CC BY-NC-SA 4.0，但其中**部分素材另有出处**，
不受该协议覆盖，版权归各自所有者。以下是 `src/media/` 下各文件在书中的出处说明：

**书中已注明来源的：**

| 文件 | 原书图注中标注的来源 |
|---|---|
| `xkcd-977.png` | [xkcd 977](https://xkcd.com/977/)，CC BY-NC 2.5 |
| `teacups.jpg` | [Dreamland Amusements](https://dreamlandamusements.com/carnival-ride-rentals/tea-cups/) |
| `int-rigor.webp` | [Math with Bad Drawings](https://mathwithbaddrawings.com/2015/12/16/good-mathematician-vs-great-mathematician/) |
| `north-hemisphere.svg` | 改编自[公有领域](https://w.wiki/CWcn)素材 |
| `parallelepiped.png` | 取自维基百科（原书未给具体链接） |

**原书标注为作者自制的：** `waterfall.png`、`whirlpool.png`（图注写明「用 ProCreate 绘制」），
以及 `moon1.jpg`、`moon2.jpg`、`room-poster.jpg`、`all-stokes.png`、`brainfart.png`
（图注语境为作者本人拍摄或绘制）。

**原书未标注出处的：** `cross-products.jpg`、`lamv-cover-art.png`。

各章节开头的题词为原著中的短篇引用。若你是上述任一素材的权利人并希望调整使用方式，
欢迎提 issue 联系。

## 许可

本译本采用 **[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)** 许可协议，
与原著一致。你可以自由地：

- **共享** —— 以任何媒介或格式复制、发行本作品
- **改编** —— 修改、转换或以本作品为基础进行创作

但须遵守以下条件：

- **署名** —— 注明原作者 Evan Chen，标明本译本链接，并说明是否作了改动
- **非商业性使用** —— 不得用于商业目的
- **相同方式共享** —— 若你基于本译本再创作，须以相同协议发布

完整条款见 [`LICENSE`](LICENSE)。

## 致谢

感谢 Evan Chen 撰写并开放这本书。英文原著与 Typst 源码见
[原著仓库 vEnhance/1802](https://github.com/vEnhance/1802)，
也可直接下载[原书 PDF](https://web.evanchen.cc/textbooks/lamv.pdf)。

原书内容精彩、讲解透彻，中文翻译过程中最大的工作量在于忠实地保留其数学内容与行文风格。

如发现翻译错误或排版问题，欢迎提 issue 或 PR。
